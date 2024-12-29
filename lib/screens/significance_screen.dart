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
Hadrat Mirza Ghulam Ahmadis, the Promised Messiah and Mahdi wrote the Arabic Qasidah [lyric poem] in his book A’ina’-e-Kamalat-e-Islam addressing the Holy Prophet Muhammadsa, expressing his love for him and praising him for his high moral and spiritual qualities, his beauty, his beneficence, and the spiritual revolution that he brought about in the lives of pre-Islamic Arabs who were plunged in the darkness of evil and were a decadent society. 

About this Qasidah, the Promised Messiahas wrote:
"This is a wonderful and beautiful Qasidah full of literary elegance and fine jewels of the Arabic language, and is written in praise of my master and leader of both worlds—Hadrat Khatamun-Nabiyyin Muhammadsa. To write this Qasidah was not possible due to my weak and humble nature—whatever I have stated is from Allah. The literary excellence, the interesting dialogue, and the fascinating and comprehensive words in which you find uniqueness and rarity are not a product of own effort; but even then, Allah has given me supremacy over the writers who are masters of the pen, and this is a sign from my God for people of knowledge. I have expressed this matter for the sole purpose that I may be rewarded for being thankful, and so that I should not be counted among the ungrateful."

The Promised Messiahas is reported to have said:
"If any person committed this Qasidah to memory, Allah would bless such a person’s memory."

He also said:
"This Qasidah has been accepted by Allah, and Allah has informed me that whoever memorises this Qasidah and repeats it constantly, such a person’s heart would be granted a deep love for me and for Prophet Muhammadsa and I will reward him with nearness to me."

My beloved father, the late Hadrat Maulana Jalal-ud-Din Shams, may Allah bestow His grace on him, wrote in Urdu the commentary of the Qasidah as well as its glossary in 1956 while he was recuperating in Quetta, Pakistan, after a long period of illness. When later he gave a dars [an explanation or commentary] of the Qasidah and its explication in Mubarak Mosque, Rabwah it had such an effect on the audience that there was hardly anyone who was not in tears.

The translation of the Qasidah, its glossary and commentary was translated into English by my elder brother, Falah-ud-Din Shams, of America, thus my dream of getting an English translation published for the benefit of the wider public—Ahmadis, non-Ahmadis and non-Muslims—has been fulfilled for which I am extremely grateful to my Lord, Allah the Almighty. Thanks are due to Naser-ud-Din Shams, Zahida Shams and Mubasher Ahmad (all of U.S.A.) who helped initially in various capacities to finalise the script. Thanks are also due to Wakalat-e-Isha‘at, Rabwah and Ayyaz Mahmood Khan who extended their full co-operation in making this book ready for publication. Moreover, we are also indebted to Research Cell, Rabwah for checking and providing the full references given in the book. May Allah the Almighty grant them the best reward for their tireless efforts. Amin.
''';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Significance of Qaseeda'),
        backgroundColor: const Color.fromARGB(255, 2, 84, 206),
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
