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
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 7.0,
          ),
        ),
        child: Scaffold(
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
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          ' Welcome ',
                          style: TextStyle(
                            fontSize: constraints.maxWidth,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 255, 255, 0.9),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}