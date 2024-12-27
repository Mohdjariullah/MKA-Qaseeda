import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/screens/read_screen.dart';
import 'package:myapp/screens/significance_screen.dart';
import 'package:myapp/screens/about_screen.dart';
void main() {
  runApp(const QaseedaApp());
}

class QaseedaApp extends StatelessWidget {
  const QaseedaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qaseeda App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qaseeda'),
        centerTitle: true,
        backgroundColor: Colors.amber.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFDF5E6),
          border: Border.all(color: Colors.amber, width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Qaseeda',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 20),
            _buildButton(context, 'READ', Colors.amber),
            _buildButton(context, 'SIGNIFICANCE', Colors.amber),
            _buildButton(context, 'ABOUT', Colors.amber),
            _buildButton(context, 'EXIT', Colors.amber),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            switch (text) {
              case 'EXIT':
                SystemNavigator.pop();
                break;
              case 'READ':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReadScreen()),
                );
                break;
              case 'SIGNIFICANCE':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignificanceScreen()),
                );
                break;
              case 'ABOUT':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
                break;
            }
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}