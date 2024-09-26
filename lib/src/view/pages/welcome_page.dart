import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;


  @override
  void initState() {
    super.initState();

    // ANIMATION CONTROLLER
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    
    Future.delayed(const Duration(milliseconds: 1000), () {
      _isVisible = true;
      _controller.forward();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
                return Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 600),
                      left: _isVisible ? -70 : -300,
                      curve: Curves.easeInOut,
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        child: const FittedBox(
                          fit: BoxFit.fitHeight,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text(
                              ' Welcome ',
                              style: TextStyle(
                                fontSize: 100,
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                fontFamily: 'Gilroy-Bold-120',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            // IMG
            Positioned(
              bottom: 0,
              right: 0,
              child: FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  'lib/assets/images/half_person.png',
                  width: screenSize.height * 350 / 890,
                ),
              )
            ),
      
          ],
        ),
      ),
    );
  }
}