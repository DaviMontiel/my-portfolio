import 'dart:async';
import 'dart:ui';
import 'package:david_portfolio_app/src/controller/external_controller.dart';
import 'package:david_portfolio_app/src/controller/language_controller.dart';

import 'package:david_portfolio_app/src/view/pages/about_me/enums/about_me_section_enum.dart';
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

  List<bool> visibleKeys = [false, false];
  String displayedText = '';

  int currentIndex = 0;
  double opacity = 1.0;
  late String currentLanguage;


  @override
  void initState() {
    currentLanguage = languageController.locale.languageCode;
    super.initState();

    _startTypingName();
    Future.delayed(const Duration(seconds: 3), _updateText);
  }

  void _startTypingName() async {
    await _type_(blinks: 4);
    await _typeName();
    await _type_(blinks: 6);
    await _typeKeys();
  }

  Future<void> _type_({required int blinks}) async {
    for (int f=0; f<blinks; f++) {
      await Future.delayed(const Duration(milliseconds: 500));

      if (f % 2 == 0) {
        displayedText += '|';
      } else {
        displayedText = displayedText.substring(0, displayedText.length-1);
      }

      setState(() {});
    }
  }

  Future<void> _typeName() async {
    int currentNameIndex = 0;
    String text = 'David Montiel';

    displayedText += ' ';
    for (int f=0; f<text.length; f++) {
      await Future.delayed(const Duration(milliseconds: 250));

      displayedText = displayedText.substring(0, displayedText.length-1);
      displayedText += '${text[currentNameIndex]}|';
      currentNameIndex++;

      setState(() {});
    }

    displayedText = displayedText.substring(0, displayedText.length-1);
  }

  Future<void> _typeKeys() async {
    visibleKeys[1] = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 1000));
    visibleKeys[0] = true;
    setState(() {});
  }

  void _updateText() {
    opacity = 0.0;
    _updateView();

    Future.delayed(const Duration(milliseconds: 500), () {
      currentIndex = (currentIndex + 1) % 3;
      opacity = 1.0;

      _updateView();

      Future.delayed(const Duration(seconds: 5), _updateText);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> links = [
      {
        'icon': Icons.quick_contacts_mail_outlined,
        'text': [languageController.language.manPageText3_0, languageController.language.manPageText3_1],
        'color': const Color.fromRGBO(241, 152, 189, 1),
        'event': () => _openAboutSection(AboutMeSection.hello)
      },
      {
        'icon': Icons.work_outlined,
        'text': [languageController.language.manPageText2_0, languageController.language.manPageText2_1],
        'color': const Color.fromRGBO(125, 201, 211, 1),
        'event': () => _openAboutSection(AboutMeSection.experience)
      },
      {
        'icon': Icons.wechat_rounded,
        'text': [languageController.language.manPageText4_0, languageController.language.manPageText4_1],
        'color': const Color.fromRGBO(158, 182, 239, 1),
        'event': () => _openAboutSection(AboutMeSection.hello)
      },
    ];

    List<String> jobTitles = [
      languageController.language.job0,
      languageController.language.job1,
      languageController.language.job2,
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
                padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MENU BTN
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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

                        PopupMenuButton<String>(
                          menuPadding: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          onSelected: (value) async {
                            currentLanguage = value;
                            await languageController.changeLanguage(value);

                            setState(() {});
                          },
                          itemBuilder: (context) => languageController.getSupportedLocales().map((locale) {
                            return PopupMenuItem<String>(
                              value: locale.languageCode,
                              child: Center(
                                child: Image.asset(
                                  'lib/assets/images/${locale.languageCode}_flag.png',
                                  width: 35,
                                ),
                              ),
                            );
                          }).toList(),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Image.asset('lib/assets/images/${currentLanguage}_flag.png', width: 35),
                          ),
                        )
                      ],
                    ),
              
                    const SizedBox( height: 5 ),
              
                    // NAME
                    Row(
                      children: [
                        Visibility(
                          visible: visibleKeys[0],
                          child: const Text(
                            '{',
                            style: TextStyle(
                              fontSize: 34,
                              color: Color.fromRGBO(21, 95, 255, 1),
                              fontFamily: 'Gilroy-Bold-120',
                            ),
                          ),
                        ),
                        Text(
                          displayedText,
                          style: const TextStyle(
                            fontSize: 34,
                            color: Color.fromRGBO(51, 70, 100, 1),
                            fontFamily: 'Gilroy-Bold-120',
                          ),
                        ),
                        Visibility(
                          visible: visibleKeys[1],
                          child: const Text(
                            '}',
                            style: TextStyle(
                              fontSize: 34,
                              color: Color.fromRGBO(21, 95, 255, 1),
                              fontFamily: 'Gilroy-Bold-120',
                            ),
                          ),
                        ),
                      ],
                    ),
              
                    // WORK
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(milliseconds: 200),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              languageController.language.manPageText0,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(98, 114, 137, 1),
                                fontFamily: 'Gilroy-Bold-120',
                              ),
                            ),
                            Text(
                              languageController.language.manPageText1,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(51, 70, 100, 1),
                                fontFamily: 'Gilroy-Bold',
                              ),
                            ),
                          ],
                        ),
                                    
                        GestureDetector(
                          onTap: () => externalController.makePhoneCall('633054283'),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(189, 131, 255, 1),
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                            ),
                            width: 150,
                            height: 55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox( height: 5 ),
                                Text(
                                  languageController.language.manPageBtn0,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Gilroy-Bold-120',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox( height: 20 ),
              
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (int f=0; f<links.length; f++) ...[
                            Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: links[f]['color'],
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: GestureDetector(
                                    onTap: links[f]['event'],
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 17, left: 15, bottom: 12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              links[f]['icon'],
                                              color: Colors.white,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  links[f]['text'][0],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontFamily: 'Gilroy-Bold',
                                                  ),
                                                ),
                                                Text(
                                                  links[f]['text'][1],
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
                              ],
                            ),

                            if (f != links.length - 1) const SizedBox(width: 20),
                          ]
                        ],
                        // children: links.map((link) {
                          // return 
              
                        //       const SizedBox( width: 20 ),
                        //     ],
                        //   );
                        // }).toList(),
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