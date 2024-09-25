import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
      
            // BACKGROUND
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(144, 75, 214, 1),
                    Color.fromRGBO(203, 164, 230, 0.8),
                  ],
                ),
              ),
            ),
      
            // TEXT
            LayoutBuilder(
              builder: (context, constraints) {
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      ' Welcome ',
                      style: TextStyle(
                        fontSize: constraints.maxWidth,
                        color: const Color.fromRGBO(255, 255, 255, 0.9),
                        fontFamily: 'Gilroy-Bold-120'
                      ),
                    ),
                  ),
                );
              },
            ),

            // IMG
            Positioned(
              child: Image.asset(
                'lib/assets/images/person.png',
                width: 550,
              ),
              bottom: -10,
              left: 80,
            ),
      
          ],
        ),
      ),
    );
  }
}