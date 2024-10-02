import 'package:david_portfolio_app/src/controller/language_controller.dart';
import 'package:flutter/material.dart';

class AcademicSectionWidget extends StatelessWidget {
  const AcademicSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> studies = [
      {
        "site": "I.E.S. Politécnico Jesús Marín",
        "years": "2021 - 2023",
        "name": 'Ciclo Formativo de Grado Superior, Desarrollo de aplicaciones Multiplataforma',
        "grade": "9.2",
      },
      {
        'site': 'I.E.S. Politécnico Jesús Marín',
        'years': '2019 - 2021',
        'name': 'Ciclo Formativo de Grado Medio, Sistemas Microinformáticos y Redes',
        "grade": "8.96",
      },
      {
        'site': 'I.E.S. Salvador Ruedas',
        'years': '2015 - 2019',
        'name': 'Educación Secundaria Obligatoria (ESO)',
        "grade": "6.07",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int f=0; f<studies.length; f++)
          ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  studies[f]['years'],
                  style: const TextStyle(
                    color: Color.fromRGBO(98, 114, 137, 1),
                    fontFamily: 'Gilroy-Bold-120',
                    fontSize: 14,
                  ),
                ),

                const SizedBox( width: 20 ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        studies[f]['site'],
                        style: const TextStyle(
                          color: Color.fromRGBO(51, 70, 100, 1),
                          fontFamily: 'Gilroy-Bold-120',
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox( height: 15 ),

                      Text(
                        studies[f]['name'],
                        style: const TextStyle(
                          color: Color.fromRGBO(51, 70, 100, 1),
                          fontFamily: 'Gilroy-Bold-120',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox( height: 30 ),
          ],
      ],
    );
  }
}