import 'package:flutter/material.dart';

class SignificanceScreen extends StatefulWidget {
  const SignificanceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignificanceScreenState createState() => _SignificanceScreenState();
}

class _SignificanceScreenState extends State<SignificanceScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  void _autoScroll() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 30), // Adjust the duration for speed
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    const String significanceText = '''
Hadrat Mirza Ghulam Ahmad, the Promised Messiah and Mahdi, wrote the Arabic Qasidah (lyric poem) in his book A'ina'-e-Kamalat-e-Islam, addressing the Holy Prophet Muhammad (sa). In it, he expresses his love for the Prophet and praises him for his high moral and spiritual qualities, his beauty, his beneficence, and the spiritual revolution that he brought about in the lives of pre-Islamic Arabs, who were mired in the darkness of evil and part of a decadent society.

Regarding this Qasidah, the Promised Messiah (as) wrote: "This is a wonderful and beautiful Qasidah full of literary elegance and fine jewels of the Arabic language, written in praise of my master and the leader of both worlds—Hadrat Khatamun-Nabiyyin Muhammad (sa). To write this Qasidah was not possible due to my weak and humble nature—whatever I have stated is from Allah. The literary excellence, the interesting dialogue, and the fascinating and comprehensive words in which you find uniqueness and rarity are not the product of my own effort; yet, even then, Allah has given me supremacy over the writers who are masters of the pen. This is a sign from my God for the people of knowledge. I have expressed this matter for the sole purpose that I may be rewarded for being thankful, and so that I should not be counted among the ungrateful."

The Promised Messiah (as) is reported to have said: "If any person commits this Qasidah to memory, Allah will bless that person's memory."

He also said: "This Qasidah has been accepted by Allah, and Allah has informed me that whoever memorizes this Qasidah and repeats it constantly, their heart will be filled with deep love for me and for Prophet Muhammad (sa), and I will reward them with nearness to me."

My beloved father, the late Hadrat Maulana Jalal-ud-Din Shams, may Allah bestow His grace upon him, wrote the commentary of the Qasidah and its glossary in Urdu in 1956, while he was recuperating in Quetta, Pakistan, after a long period of illness. When he later gave a dars (an explanation or commentary) of the Qasidah and its explication at Mubarak Mosque, Rabwah, it had such an effect on the audience that there was hardly anyone who was not in tears.

The translation of the Qasidah, its glossary, and commentary was done into English by my elder brother, Falah-ud-Din Shams of America. Thus, my dream of getting an English translation published for the benefit of the wider public—Ahmadis, non-Ahmadis, and non-Muslims—has been fulfilled, for which I am extremely grateful to my Lord, Allah the Almighty. Thanks are due to Naser-ud-Din Shams, Zahida Shams, and Mubasher Ahmad (all of the U.S.A.), who helped initially in various capacities to finalize the script. Thanks are also due to Wakalat-e-Isha'at, Rabwah, and Ayyaz Mahmood Khan, who extended their full cooperation in making this book ready for publication. Moreover, we are also indebted to the Research Cell, Rabwah, for checking and providing the full references included in the book. May Allah the Almighty grant them the best reward for their tireless efforts. Ameen.
''';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Significance of Qaseeda',
          style: TextStyle(color: Colors.white),
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
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFFFF8DC),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( 
          controller: _scrollController,
          child: const Text(
            significanceText,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }
}
