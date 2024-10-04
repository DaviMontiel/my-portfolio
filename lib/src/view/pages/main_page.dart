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
  bool showingSecondLastName = false;
  String userName = '';

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
        userName += '|';
      } else {
        userName = userName.substring(0, userName.length-1);
      }

      setState(() {});
    }
  }

  Future<void> _typeName() async {
    int currentNameIndex = 0;
    String name = 'David Montiel';

    userName += ' ';
    for (int f=0; f<name.length; f++) {
      await Future.delayed(const Duration(milliseconds: 250));

      userName = userName.substring(0, userName.length-1);
      userName += '${name[currentNameIndex]}|';
      currentNameIndex++;

      setState(() {});
    }

    userName = userName.substring(0, userName.length-1);
  }

  Future<void> _typeKeys() async {
    visibleKeys[1] = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 700));
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
                            if (!visibleKeys[0]) return;

                            String secondLastName = ' Nieto';
                            if (showingSecondLastName) {
                              userName = userName.substring(0, userName.length - secondLastName.length);
                            } else {
                              userName += secondLastName;
                            }

                            showingSecondLastName = !showingSecondLastName;
                            setState(() {});
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
                        const Text(
                          '',
                          style: TextStyle(
                            fontSize: 34,
                            color: Color.fromRGBO(51, 70, 100, 1),
                            fontFamily: 'Gilroy-Bold-120',
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                if (visibleKeys[0]) ...[
                                  const TextSpan(
                                    text: '{',
                                    style: TextStyle(
                                      fontSize: 34,
                                      color: Color.fromRGBO(21, 95, 255, 1),
                                      fontFamily: 'Gilroy-Bold-120',
                                    ),
                                  ),
                                ],
                                TextSpan(
                                  text: userName,
                                  style: const TextStyle(
                                    fontSize: 34,
                                    color: Color.fromRGBO(51, 70, 100, 1),
                                    fontFamily: 'Gilroy-Bold-120',
                                  ),
                                ),
                                if (visibleKeys[1]) ...[
                                  const TextSpan(
                                    text: '}',
                                    style: TextStyle(
                                      fontSize: 34,
                                      color: Color.fromRGBO(21, 95, 255, 1),
                                      fontFamily: 'Gilroy-Bold-120',
                                    ),
                                  ),
                                ],
                              ],
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
                          onTap: _showContactToMePopup,
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

  void _showContactToMePopup() {
    List<Map<String, dynamic>> methods = [
      {
        'icon': 'lib/assets/images/app_whatsapp.png',
        'color': const Color.fromARGB(255, 164, 255, 128),
        'text': 'WhatsApp',
        'event': () => externalController.openUrl('https://wa.me/+034633054283'),
      },
      {
        'icon': 'lib/assets/images/app_mail.png',
        'color': const Color.fromARGB(255, 253, 166, 166),
        'text': languageController.language.manPageContactMail,
        'event': () => externalController.openUrl('mailto:davidmontielnieto1@gmail.es'),
        'space': 30.0,
      },
      {
        'icon': 'lib/assets/images/app_tel.png',
        'color': const Color.fromARGB(255, 196, 222, 255),
        'text': languageController.language.manPageContactTel,
        'event': () => externalController.makePhoneCall('+34633054283'),
        'space': 30.0,
      },
    ];

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          height: 140,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              // LINE
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 219, 219, 219),
                    width: 2,
                  ),
                ),
              ),

              const Expanded(
                child: SizedBox(),
              ),

              // CONTENT
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int f=0; f<methods.length; f++) ...[
                      GestureDetector(
                        onTap: methods[f]['event'],
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: methods[f]['color'],
                                ),
                                child: Center(
                                  child: Image.asset(
                                    methods[f]['icon'],
                                    width: 40,
                                  ),
                                ),
                              ),
                                          
                              const SizedBox( height: 10 ),
                                          
                              Text(
                                methods[f]['text'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 153, 153, 153),
                                  fontFamily: 'Gilroy-Bold-120',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox( width: methods[f]['space'] ?? 25.0 ),
                    ],
                  ],
                ),
              ),

              const SizedBox( height: 10 ),
            ],
          ),
        );
      },
    );
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