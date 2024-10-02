import 'package:david_portfolio_app/src/controller/external_controller.dart';
import 'package:flutter/material.dart';

class HelloSectionWidget extends StatelessWidget {
  const HelloSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            '¡Hola, Soy David!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(51, 70, 100, 1),
              fontFamily: 'Gilroy-Bold-120',
              fontSize: 24,
            ),
          ),
        ),

        const SizedBox( height: 15 ),

        const Text(
          'Un apasionado desarrollador de software con experiencia en el desarrollo de aplicaciones nativas y sistemas informaticos. Nací en Málaga (España) y desde joven me interesé por la tecnología y la programación.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color.fromRGBO(98, 114, 137, 1),
            fontFamily: 'Gilroy-Bold',
            fontSize: 16,
          ),
        ),

        const SizedBox( height: 15 ),

        const Text(
          'He trabajado en varios proyectos, siendo el Coordinador principal y Desarrollador Full Stack. Me encanta aprender sobre nuevas tecnologías y enfrentar desafíos que me permitan crecer profesionalmente.',
          textAlign: TextAlign.justify,
          style: TextStyle(
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