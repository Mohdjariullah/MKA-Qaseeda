// import 'package:flutter/material.dart';

// // ignore: camel_case_types
// class homescreen extends StatelessWidget {
//   const homescreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: const Color(0xFF1C1C1C),
//         child: Stack(
//           children: [
//             // Gradient Overlay
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'assets/gradient.png',
//                 fit: BoxFit.contain,
//               ),
//             ),
//             // Islamic Border Pattern
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'assets/homeborder.png',
//                 fit: BoxFit.contain,
//               ),
//             ),
//             // Center Gradient
//             Center(
//               child: SizedBox(
//                 width: 381,
//                 height: 381,
//                 // decoration: const ShapeDecoration(
//                 //   gradient: LinearGradient(
//                 //     begin: Alignment(0.37, -0.93),
//                 //     end: Alignment(-0.37, 0.93),
//                 //     colors: [Color(0xFF4F4B3D), Color(0x00907012)],
//                 //   ),
//                 //   shape: OvalBorder(),
//                 // ),
//                 child: Center(
//                   child: Image.asset(
//                     'assets/homelogo.png',
//                     width: 200,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

// ignore: camel_case_types
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<homescreen> {
  late _HomePageWidgetState _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = _HomePageWidgetState();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF1C1C1C),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/homeborder.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/gradient.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/homelogo.png',
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.45,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        _buildButton('Read Qaseeda'),
                        const SizedBox(height: 20),
                        _buildButton('Significance'),
                        const SizedBox(height: 20),
                        _buildButton('About App'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {
        print('Button pressed ...');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A1615),
        foregroundColor: Colors.amber,
        textStyle: const TextStyle(
          fontFamily: 'Inter Tight',
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
        side: const BorderSide(
          color: Color(0xFFF4B903),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
        minimumSize: const Size(200, 45),
      ),
      child: Text(text),
    );
  }
}
