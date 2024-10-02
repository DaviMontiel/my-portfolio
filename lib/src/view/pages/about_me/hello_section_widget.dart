import 'package:flutter/material.dart';

class HelloSectionWidget extends StatelessWidget {
  const HelloSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
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

        SizedBox( height: 15 ),

        Text(
          'Un apasionado desarrollador de software con experiencia en el desarrollo de aplicaciones nativas y sistemas informaticos. Nací en Málaga (España) y desde joven me interesé por la tecnología y la programación.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color.fromRGBO(98, 114, 137, 1),
            fontFamily: 'Gilroy-Bold',
            fontSize: 16,
          ),
        ),

        SizedBox( height: 15 ),

        Text(
          'He trabajado en varios proyectos, desde aplicaciones para mejorar la movilidad urbana hasta plataformas para la gestión de datos. Me encanta aprender sobre nuevas tecnologías y enfrentar desafíos que me permitan crecer profesionalmente.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color.fromRGBO(98, 114, 137, 1),
            fontFamily: 'Gilroy-Bold',
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}