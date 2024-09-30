import 'dart:ui';

import 'package:david_portfolio_app/src/model/enums/about_me_section_enum.dart';
import 'package:david_portfolio_app/src/view/pages/about_me_page.dart';
import 'package:david_portfolio_app/src/view/widgets/pages/quit_go_back_drag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<String> jobTitles = [
    'Multiplatform Developer',
    'Proyect Manager',
    'App Designer',
  ];

  int currentIndex = 0;
  double opacity = 1.0;


  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), _updateText);
  }

  void _updateText() {
    opacity = 0.0;
    _updateView();

    Future.delayed(const Duration(seconds: 1), () {
      currentIndex = (currentIndex + 1) % jobTitles.length;
      opacity = 1.0;

      _updateView();

      Future.delayed(const Duration(seconds: 5), _updateText);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> links = [
      {
        'icon': Icons.work_outlined,
        'text': ['know', 'my work'],
        'color': const Color.fromRGBO(241, 152, 189, 1),
        'event': () => _openAboutSection(AboutMeSection.experience)
      },
      {
        'icon': Icons.quick_contacts_mail_outlined,
        'text': ['about', 'me'],
        'color': const Color.fromRGBO(125, 201, 211, 1),
        'event': () => _openAboutSection(AboutMeSection.hello)
      },
      {
        'icon': Icons.wechat_rounded,
        'text': ['where', 'I am'],
        'color': const Color.fromRGBO(158, 182, 239, 1),
        'event': () => _openAboutSection(AboutMeSection.hello)
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(204, 221, 241, 1),
      body: Stack(
        children: [

          // BACKGROUND
          ..._background(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MENU BTN
                    GestureDetector(
                      onTap: () {
                        print('-- toca');
                      },
                      child: Container(
                        color: Colors.transparent,
                        width: 25,
                        height: 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.black,
                                  width: 18,
                                  height: 2,
                                ),
                                const SizedBox( height: 4 ),
                                Container(
                                  color: Colors.black,
                                  width: 12,
                                  height: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
              
                    const SizedBox( height: 25 ),
              
                    // NAME
                    const Text(
                      'David Montiel',
                      style: TextStyle(
                        fontSize: 34,
                        color: Color.fromRGBO(51, 70, 100, 1),
                        fontFamily: 'Gilroy-Bold-120',
                      ),
                    ),
              
                    // WORK
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        jobTitles[currentIndex],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(127, 154, 193, 1),
                          fontFamily: 'Gilroy-Bold-120',
                        ),
                      ),
                    ),
              
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('lib/assets/images/person.png'),
                      // fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),

              Container(
                height: 250,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(244, 248, 252, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Can I help you?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(98, 114, 137, 1),
                                fontFamily: 'Gilroy-Bold-120',
                              ),
                            ),
                            Text(
                              'Let\'s work?',
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(51, 70, 100, 1),
                                fontFamily: 'Gilroy-Bold',
                              ),
                            ),
                          ],
                        ),
                                    
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(189, 131, 255, 1),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          width: 150,
                          height: 55,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox( height: 5 ),
                              Text(
                                'Contact me',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Gilroy-Bold-120',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox( height: 20 ),
              
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: links.map((link) {
                          return Row(
                            children: [
                              Container(
                                height: 120,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: link['color'],
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                ),
                                child: GestureDetector(
                                  onTap: link['event'],
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 17, left: 15, bottom: 12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            link['icon'],
                                            color: Colors.white,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                link['text'][0],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: 'Gilroy-Bold',
                                                ),
                                              ),
                                              Text(
                                                link['text'][1],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: 'Gilroy-Bold-120',
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
              
                              const SizedBox( width: 20 ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _background() {
    return [
      // TOP LEFT
      Align(
        alignment: const AlignmentDirectional(-1, -1),
        child: Container(
          width: 130,
          height: 100,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(168, 230, 238, 1)
          ),
        ),
      ),

      // TOP RIGHT
      Align(
        alignment: const AlignmentDirectional(1, -1),
        child: Container(
          width: 200,
          height: 150,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(186, 207, 237, 1)
          ),
        ),
      ),

      // BOTTOM
      Align(
        alignment: const AlignmentDirectional(1, 1),
        child: Container(
          width: double.infinity,
          height: 350,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(160, 188, 236, 1)
          ),
        ),
      ),

      // BLUR
      ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
          ),
        ),
      ),
    ];
  }

  void _updateView() {
    if (!mounted) return;

    setState(() {});
  }

  void _openAboutSection(AboutMeSection section) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => QuitGoBackDrag(
          child: AboutMePage(
            section: section,
          ),
        ),
      ),
    );
  }
}