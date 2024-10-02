import 'package:david_portfolio_app/src/controller/language_controller.dart';
import 'package:david_portfolio_app/src/view/pages/about_me/enums/about_me_section_enum.dart';
import 'package:david_portfolio_app/src/view/pages/about_me/academic_section_widget.dart';
import 'package:david_portfolio_app/src/view/pages/about_me/experience_section_widget.dart';
import 'package:david_portfolio_app/src/view/pages/about_me/hello_section_widget.dart';
import 'package:david_portfolio_app/src/view/pages/about_me/hobbies_section_widget.dart';
import 'package:flutter/material.dart';

class AboutMePage extends StatefulWidget {
  final AboutMeSection section;

  const AboutMePage({super.key, this.section = AboutMeSection.hello});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {

  late AboutMeSection _currentSection;

  @override
  void initState() {
    _currentSection = widget.section;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(125, 201, 211, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 240,
                    floating: false,
                    collapsedHeight: 80,
                    automaticallyImplyLeading: false,
                    backgroundColor: const Color.fromRGBO(125, 201, 211, 1),
                    surfaceTintColor: const Color.fromRGBO(125, 201, 211, 1),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        color: const Color.fromRGBO(125, 201, 211, 1),
                        child: _showMenu(),
                      ),
                    ),
                  ),
            
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _showContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showMenu() {
    final List<Map<String, dynamic>> sections = [
      {
        'type' : AboutMeSection.hello,
        'icon': Icons.person,
        'text': languageController.language.aboutMeSection0,
        'event': () => _openSection(AboutMeSection.hello)
      },
      {
        'type' : AboutMeSection.experience,
        'icon': Icons.cases_outlined,
        'text': languageController.language.aboutMeSection1,
        'event': () => _openSection(AboutMeSection.experience)
      },
      {
        'type' : AboutMeSection.academmic,
        'icon': Icons.menu_book_rounded,
        'text': languageController.language.aboutMeSection2,
        'event': () => _openSection(AboutMeSection.academmic)
      },
      {
        'type' : AboutMeSection.hobbies,
        'icon': Icons.star_rate_rounded,
        'text': languageController.language.aboutMeSection3,
        'event': () => _openSection(AboutMeSection.hobbies)
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GO BACK BTN
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),

          const SizedBox( height: 15 ),

          // TITLE
          Text(
            languageController.language.aboutMeTitle,
            style: const TextStyle(
              fontSize: 34,
              color: Colors.white,
              fontFamily: 'Gilroy-Bold-120',
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: sections.map((section) {
              return GestureDetector(
                onTap: section['event'],
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: section['type'] == _currentSection
                          ? Colors.white
                          : const Color.fromRGBO(151, 212, 220, 1),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Icon(
                        section['icon'],
                        color: section['type'] == _currentSection
                          ? const Color.fromRGBO(151, 212, 220, 1)
                          : const Color.fromRGBO(218, 239, 242, 1),
                        size: 35,
                      ),
                    ),
                
                    const SizedBox( height: 8 ),
                
                    Text(
                      section['text'],
                      style: TextStyle(
                        color: section['type'] == _currentSection
                          ? Colors.white
                          : const Color.fromRGBO(151, 212, 220, 1),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy-Bold-120',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _showContent() {
    Map<AboutMeSection, Widget> contents = {
      AboutMeSection.hello: const HelloSectionWidget(),
      AboutMeSection.experience: const ExperiencieSectionWidget(),
      AboutMeSection.academmic: const AcademicSectionWidget(),
      AboutMeSection.hobbies: const HobbiesSectionWidget(),
    };

    double screenHeight = MediaQuery.of(context).size.height;
    double initialPositionX = 0;
    double initialPositionY = 0;
    return GestureDetector(
      onHorizontalDragStart: (details) {
        initialPositionX = details.globalPosition.dx;
        initialPositionY = details.globalPosition.dy;
      },
      onHorizontalDragEnd: (details) {
        // Calculate the margin of 10% of the screen height
        double verticalThreshold = screenHeight * 0.05;

        // Calculate the displacement
        double deltaY = details.globalPosition.dy - initialPositionY;
        double deltaX = details.globalPosition.dx - initialPositionX;

        // Check if the vertical displacement exceeds the threshold
        if (deltaY.abs() <= verticalThreshold) {
          // If the vertical displacement is within the limit
          if (deltaX > 0) {
            if (_currentSection.index == 0) return;
            _currentSection = AboutMeSection.fromIndex(_currentSection.index-1);
          } else if (deltaX < 0) {
            if (_currentSection.index == contents.length-1) return;
            _currentSection = AboutMeSection.fromIndex(_currentSection.index+1);
          }

          setState(() {});
        }
      },
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(244, 248, 252, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: contents[_currentSection],
      ),
    );
  }

  /*
   *  FUNCTIONS
   */

  void _openSection(AboutMeSection section) {
    _currentSection = section;

    setState(() {});
  }
}