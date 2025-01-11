import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8DC),
      appBar: AppBar(
        title: const Text(
          'Qaseeda',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF30CFD0),
                Color.fromARGB(255, 111, 79, 151),
              ],
              stops: [0.0, 1.0],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/qaseeda.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Qaseeda',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(179, 70, 69, 69),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Developed by',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(179, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Khuddam',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 63, 110, 18),
                      ),
                    ),
                    // const SizedBox(height: 5),
                    // const Text(
                    //   'Gulbarga, India',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: Colors.white70,
                    //   ),
                    // ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () => _launchURL('your-privacy-policy-url'),
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Color.fromARGB(255, 13, 148, 103),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
