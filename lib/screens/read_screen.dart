import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  int coupletNumber = 1;

  void goToNextVerse() {
    setState(() {
      coupletNumber++;
    });
  }

  void goToPreviousVerse() {
    if (coupletNumber > 1) {
      setState(() {
        coupletNumber--;
      });
    }
  }

  void playVerse() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Playing verse...')));
  }

  void pauseVerse() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Paused playback.')));
  }

  void goToVerse() {
    // Placeholder logic for "Go To Verse"
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Go to specific verse.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qaseeda - Read'),
        backgroundColor: const Color.fromARGB(255, 2, 84, 206),
      ),
      body: Container(
        color: const Color(0xFFFFF8DC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  verses[coupletNumber - 1].arabic,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  verses[coupletNumber - 1].urdu,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  verses[coupletNumber - 1].english,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: goToPreviousVerse,
                  tooltip: 'Previous Verse',
                ),
                IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.play_arrow),
                  onPressed: playVerse,
                  tooltip: 'Play Verse',
                ),
                IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.pause),
                  onPressed: pauseVerse,
                  tooltip: 'Pause Verse',
                ),
                IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: goToNextVerse,
                  tooltip: 'Next Verse',
                ),
              ],
            ),
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
                          itemCount: 70,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 40,
                              width: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  setState(() {
                                    coupletNumber = index + 1;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('${index + 1}'),
                              ),
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
              ),
              child: const Text('Go To Verse'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class Verse {
  final String arabic;
  final String urdu;
  final String english;

  Verse({
    required this.arabic,
    required this.urdu,
    required this.english,
  });
}

final List<Verse> verses = [
  Verse(
    arabic:
        "يَاعَيْنَ فَيْضِ اللَّهِ وَالْعِرْفَانِ\nيَسْعَى إِلَيْكَ الْخَلْقُ كَالظَّمْانِ",
    urdu:
        "اے اللہ کے فیض و عرفان کے چشمے ! خلقت تیری طرف پیاسے کی طرح دوڑ رہی ہے۔",
    english:
        'O you who are the fountain of Allah\'s beneficence and divine understanding; People throng towards you like the thirsty rushing towards water.',
  ),
  Verse(
    arabic:
        "يَا بَحْرَ فَضْلِ الْمُنْعِمِ الْمَنَّانِ\nتَهْوِي إِلَيْكَ الزُّمَرُ بِالْكِيْزَانِ",
    urdu:
        "اے انعام و احسان کرنے والے خدا کے فضل کے سمندر ! لوگوں کے گروہ کوزے لئے تیری طرف لپکے آرہے ہیں۔",
    english:
        'O you who are the ocean of the Grace of the Benefactor and Bountiful God; People flock to you with empty cups in their hands.',
  ),
  Verse(
    arabic:
        "يَا شَمْسَ مُلْكِ الْحُسْنِ وَالْإِحْسَانِ\nنَوَّرْتَ وَجْهَ الْبَرِّ وَالْعُمْرَانِ",
    urdu:
        "اے حسن و احسان کے ملک کے آفتاب ! تو نے بیابانوں اور آبادیوں کے چہرے کو منور کر دیا ہے۔",
    english:
        'O you the sun of the kingdom of beauty and virtue; You have illuminated the deserts as well as the cities.',
  ),
  Verse(
    arabic:
        "قَوْمٌ رَأَوْكَ وَأُمَّةٌ قَدْ أُخْبِرَتْ\nمِنْ ذَلِكَ الْبَدْرِ الَّذِي أَصْبَانِي",
    urdu:
        "ایک قوم نے تو تجھے دیکھا ہے اور ایک امت نے خبر سنی ہے اس بدر کی جس نے مجھے (اپنا) عاشق بنا دیا ہے۔",
    english:
        'A nation was blessed by having been able to see you, while many heard of the full moon which has captivated my heart.',
  ),
  Verse(
    arabic:
        "يَبْكُونَ مِنْ ذِكْرِ الْجَمَالِ صَبَابَةً\nوَتَأَلَّمَا مِنْ لَوْعَةِ الْهِجْرَانِ",
    urdu:
        "وہ تیرے حسن کی یاد میں بوجہ عشق کے ( بھی ) روتے ہیں اور جدائی کی جلن کے دُکھ اُٹھانے سے بھی۔",
    english:
        'People shed tears when they fondly reminisce of your grace and beauty; A fire consumes their hearts due to the pains of separation.',
  ),
  Verse(
    arabic:
        "وَأَرَى الْقُلُوْبَ لَدَى الْحَنَاجِرِ كُرْبَةً\nوَأَرَى الْغُرُوْبَ تُسِيْلُهَا الْعَيْنَانِ",
    urdu:
        "اور میں دیکھتا ہوں کہ دل بیقراری سے گلے تک آگئے ہیں اور میں دیکھتا ہوں آنکھیں آنسو بہا رہی ہیں۔",
    english:
        'I see their hearts are in such anxiety as if they have reached their throats; I see that their eyes are flowing with tears.',
  ),
  Verse(
    arabic:
        "يَامَنْ غَدَا فِي نُوْرِهِ وَضِيَائِهِ\nكَالنَّيْرَيْنِ وَنَوَّرَ الْمَلَوَانِ",
    urdu:
        "اے وہ ہستی جو اپنے نور اور روشنی میں مہر و ماہ کی طرح ہو گئی ہے اور رات اور دن منو ر ہو گئے ہیں۔",
    english:
        'O you who are the sun and moon of light; You have illuminated the day and the night.',
  ),
  Verse(
    arabic:
        "يَا بَدْرَنَا يَا آيَةَ الرَّحْمَنِ\nأَهْدَى الْهُدَاةِ وَأَشْجَعَ الشَّجْعَانِ",
    urdu:
        "اے ہمارے کامل چاند ! اور اے رحمان کے نشان! سب راہنماؤں کے راہنما اور سب بہادروں سے بہادر ۔",
    english:
        'O our full moon and sign of the Gracious God; O the best of all guides, the bravest of the brave.',
  ),
  Verse(
    arabic:
        "إِنِّي أَرَى فِي وَجْهِكَ الْمُتَهَلِلِ\nشَأْنَا يَفُوْقُ شَمَائِلَ الْإِنْسَانِ",
    urdu:
        "بے شک میں تیرے درخشاں چہرے میں دیکھ رہا ہوں ۔ ایک ایسی شان جو انسانی خصائل پر فوقیت رکھتی ہے۔",
    english:
        'I find such a glory in your sparkling countenance; That surpasses all human excellence.',
  ),
  Verse(
    arabic:
        "وَقَدِ اقْتَفَاكَ أُوْلُو النُّهَى وَبِصِدْقِهِمْ\nوَدَعُوْا تَذَكَّرَ مَعْهَدِ الْأَوْطَانِ",
    urdu:
        "بے شک دانشمندوں نے تیری پیروی کی ہے اور اپنے صدق کی وجہ سے انہوں نے وطنوں کی یاد بھلا دی ہے۔",
    english:
        'The wise chose your company and followed you; And the truthful relinquished their hearths and homes to be with you.',
  ),
  Verse(
    arabic:
        "قَدْ أَثَرُوْكَ وَفَارَقُوْا أَحْبَابَهُمْ\nوَتَبَاعَدُوا مِنْ حَلْقَةِ الْإِخْوَانِ",
    urdu:
        "پس بے شک انہوں نے تجھے مقدم کر لیا اور اپنے دوستوں کو چھوڑ دیا اور اپنے بھائیوں کے دائرہ سے دور ہو گئے ۔",
    english:
        'They chose you, and abandoned their friends; They distanced themselves from their families.',
  ),
  Verse(
    arabic:
        "قَدْ وَدَّعُوْا أَهْوَاءَهُمْ وَنُفُوْسَهُمْ\nوَتَبَرَّءُ وَا مِنْ كُلِّ نَشْبِ فَانٍ",
    urdu:
        "انہوں نے اپنی خواہشوں اور نفسوں کو یکسر چھوڑ دیا اور ہر فانی مال ومنال سے بیزار ہو گئے ۔",
    english:
        'They bid farewell to their base desires, and self-indulgence; They discarded all their material belongings.',
  ),
  Verse(
    arabic:
        "ظَهَرَتْ عَلَيْهِمْ بَيِّنَاتُ رَسُوْلِهِمْ\nفَتَمَزَّقَ الْأَهْوَاءُ كَالأَوْثَانِ",
    urdu:
        "ان پر اپنے رسول کے روشن دلائل ظاہر ہوئے تو ان کی نفسانی خواہشیں بتوں کی طرح ٹکڑے ٹکڑے ہوگئیں ۔",
    english:
        'When the clear signs of the truth of their Prophet became manifest upon them, Their base desires were shattered to pieces like smashed idols.',
  ),
  Verse(
    arabic:
        "فِي وَقْتِ تَرْوِيقِ اللَّيَالِي نُورُوا\nوَاللَّهُ نَجَّاهُمْ مِنَ الطَّوْفَانِ",
    urdu:
        "وہ راتوں کی تاریکی کے وقت منو ر ہو گئے اور اللہ تعالیٰ نے انہیں طوفان سے نجات دے دی۔",
    english:
        'They became enlightened in the pitch darkness of night; And Allah saved them from being engulfed in a raging storm of torment.',
  ),
  Verse(
    arabic:
        "قَدْ هَاضَهُمْ ظُلْمُ الْأَنَاسِ وَضَيْمُهُمْ\nفَتَثَبَّتُوْا بِعِنَايَةِ الْمَنَّـانِ",
    urdu:
        "بے شک لوگوں کے ظلم و ستم نے انہیں چور چور کر دیا۔ پھر بھی خدائے محسن کی عنایت سے وہ ثابت قدم رہے۔",
    english:
        'They became enlightened in the pitch darkness of night; And Allah saved them from being engulfed in a raging storm of torment.',
  ),
];
