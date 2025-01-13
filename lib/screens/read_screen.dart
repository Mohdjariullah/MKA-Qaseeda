import 'package:flutter/material.dart';
import 'package:qaseeda/data/verses.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qaseeda/data/timestamps.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  int coupletNumber = 1;
  bool isPlaying = false;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  List<Verse> searchResults = [];
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isAudioInitialized = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
    assert(verses.isNotEmpty, 'Verses data must not be empty');
  }

  Future<void> _initAudio() async {
    try {
      await audioPlayer.setAsset('assets/qaseeda_audio.mp3');
      setState(() {
        isAudioInitialized = true;
      });
      print('Audio loaded successfully');
    } catch (e) {
      print('Audio initialization error: $e');
    }
  }

  void performSearch(String query) {
    setState(() {
      searchResults = verses.where((verse) {
        return verse.arabic.toLowerCase().contains(query.toLowerCase()) ||
            verse.english.toLowerCase().contains(query.toLowerCase()) ||
            verse.urdu.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }
  // Add this method to stop audio when verse changes
  void stopAudio() {
    audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  // Modify goToNextVerse
  void goToNextVerse() {
    setState(() {
      if (coupletNumber < verses.length) {
        stopAudio(); // Stop audio before changing verse
        coupletNumber++;
      }
    });
  }

  // Modify goToPreviousVerse
  void goToPreviousVerse() {
    setState(() {
      if (coupletNumber > 1) {
        stopAudio(); // Stop audio before changing verse
        coupletNumber--;
      }
    });
  }

  // Enhance togglePlayPauseAudio with better timing control
  void togglePlayPauseAudio() async {
    final timestamp = verseTimestamps[coupletNumber];

    setState(() {
      isPlaying = !isPlaying;
    });

    if (!isPlaying) {
      await audioPlayer.pause();
    } else {
      if (timestamp != null) {
        await audioPlayer.seek(timestamp.start);
        await audioPlayer.play();

        // Schedule stop at exact end time
        Future.delayed(timestamp.end - timestamp.start, () {
          if (mounted && coupletNumber == coupletNumber) { // Check if verse hasn't changed
            stopAudio();
          }
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final currentVerse = coupletNumber <= verses.length
        ? verses[coupletNumber - 1]
        : Verse(arabic: '', english: '', urdu: '');

    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? const Text('Qaseeda - Read')
            : TextField(
                controller: searchController,
                style: const TextStyle(color: Color.fromARGB(255, 19, 19, 19)),
                decoration: const InputDecoration(
                  hintText: 'Search verses...',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  border: InputBorder.none,
                ),
                onChanged: performSearch,
              ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF30CFD0),
                Color(0xFF330867),
              ],
              stops: [0.0, 1.0],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (isSearching) {
                  searchController.clear();
                  searchResults.clear();
                }
                isSearching = !isSearching;
              });
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFFFF8DC),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: isSearching && searchResults.isNotEmpty
            ? ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final verse = searchResults[index];
                  final verseNumber = verses.indexOf(verse) + 1;
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('$verseNumber'),
                      ),
                      title: Text(verse.arabic,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(verse.english),
                          Text(verse.urdu),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          coupletNumber = verseNumber;
                          isSearching = false;
                          searchController.clear();
                          searchResults.clear();
                        });
                      },
                    ),
                  );
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Verse $coupletNumber',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            currentVerse.arabic,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            currentVerse.urdu,
                            style: const TextStyle(
                              fontSize: 18,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            currentVerse.english,
                            style: const TextStyle(
                              fontSize: 18,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.arrow_back),
                        onPressed: coupletNumber > 1 ? goToPreviousVerse : null,
                        tooltip: 'Previous Verse',
                      ),
                      IconButton(
                        iconSize: 50,
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed:
                            isAudioInitialized ? togglePlayPauseAudio : null,
                        tooltip: isPlaying ? 'Pause Verse' : 'Play Verse',
                      ),
                      IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: coupletNumber < verses.length
                            ? goToNextVerse
                            : null,
                        tooltip: 'Next Verse',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Select Verse'),
                                content: SizedBox(
                                  width: double.maxFinite,
                                  height: 300,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 7,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                    ),
                                    itemCount: verses.length,
                                    itemBuilder: (context, index) {
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              coupletNumber == index + 1
                                                  ? Colors.amber[700]
                                                  : Colors.amber,
                                          padding: EdgeInsets.zero,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            coupletNumber = index + 1;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text('${index + 1}'),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text('Go To Verse'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text('Back'),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
