import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Qaseeda/screens/read_screen.dart';
import 'package:Qaseeda/screens/significance_screen.dart';
import 'package:Qaseeda/screens/about_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/homebg.png',
            fit: BoxFit.cover,
          ),
          // Content overlay
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              Image.asset(
                'assets/qaseeda.png',
                width: 200, // Adjust width as needed
                height: 100, // Adjust height as needed
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              // Buttons
              _buildButton(context, 'READ'),
              _buildButton(context, 'SIGNIFICANCE'),
              _buildButton(context, 'ABOUT'),
              _buildButton(context, 'EXIT'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(206, 0, 255, 98),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
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
                  MaterialPageRoute(
                      builder: (context) => const SignificanceScreen()),
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
