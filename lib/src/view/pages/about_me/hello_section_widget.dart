import 'package:david_portfolio_app/src/controller/external_controller.dart';
import 'package:david_portfolio_app/src/controller/language_controller.dart';
import 'package:flutter/material.dart';

class HelloSectionWidget extends StatelessWidget {
  const HelloSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            languageController.language.helloTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(51, 70, 100, 1),
              fontFamily: 'Gilroy-Bold-120',
              fontSize: 24,
            ),
          ),
        ),

        const SizedBox( height: 15 ),

        Text(
          languageController.language.helloText0,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color.fromRGBO(98, 114, 137, 1),
            fontFamily: 'Gilroy-Bold',
            fontSize: 16,
          ),
        ),

        const SizedBox( height: 15 ),

        Text(
          languageController.language.helloText1,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: Color.fromRGBO(98, 114, 137, 1),
            fontFamily: 'Gilroy-Bold',
            fontSize: 16,
          ),
        ),

        const SizedBox( height: 15 ),

        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  externalController.openUrl('https://github.com/DaviMontiel');
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 192, 192, 192),
                      width: 1.5,
                    ),
                  ),
                  child: Image.asset(
                    'lib/assets/images/github_logo.png',
                  ),
                ),
              ),
            ),

            const SizedBox( width: 10 ),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  externalController.openUrl('https://www.linkedin.com/in/david-montiel-nieto-95890329b/');
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 192, 192, 192),
                      width: 1.5,
                    ),
                  ),
                  child: Image.asset(
                    'lib/assets/images/linkedin_logo.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}