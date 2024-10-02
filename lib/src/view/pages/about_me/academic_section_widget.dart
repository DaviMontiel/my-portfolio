import 'package:david_portfolio_app/src/controller/language_controller.dart';
import 'package:flutter/material.dart';

class AcademicSectionWidget extends StatelessWidget {
  const AcademicSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> studies = [
      {
        "site": "Udemy",
        "years": "2023",
        "name": 'NestJS Zero to Hero - Modern TS Back-end Development',
      },
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

    return Table(
      columnWidths: const {
        0: IntrinsicColumnWidth(),
      },
      children: [
        for (int f=0; f<studies.length; f++) ...[
          TableRow(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    studies[f]['years'],
                    style: const TextStyle(
                      color: Color.fromRGBO(98, 114, 137, 1),
                      fontFamily: 'Gilroy-Bold-120',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      studies[f]['site'],
                      style: const TextStyle(
                        color: Color.fromRGBO(51, 70, 100, 1),
                        fontFamily: 'Gilroy-Bold-120',
                        fontSize: 18,
                      ),
                    ),
                
                    const SizedBox( height: 10 ),
                
                    Text(
                      studies[f]['name'],
                      style: const TextStyle(
                        color: Color.fromRGBO(98, 114, 137, 1),
                        fontFamily: 'Gilroy-Bold-120',
                        fontSize: 16,
                      ),
                    ),
                
                    if (studies[f]['grade'] != null) ...[
                      const SizedBox( height: 5 ),
                
                      Text(
                        'Nota: ${studies[f]['grade']}',
                        style: const TextStyle(
                          color: Color.fromRGBO(98, 114, 137, 1),
                          fontFamily: 'Gilroy-Bold-120',
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}