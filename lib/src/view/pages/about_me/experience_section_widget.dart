import 'package:david_portfolio_app/src/controller/language_controller.dart';
import 'package:flutter/material.dart';

class ExperiencieSectionWidget extends StatelessWidget {
  const ExperiencieSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> experience = [
      {
        "company": "Metrica6",
        "years": "2023 - ${languageController.language.experienceYearPresent}",
        "job": languageController.language.experienceJob0Title,
        "description": languageController.language.experienceJob0Content,
      },
      {
        'company': 'VivaTech',
        'years': '2021 - 2021',
        'job': languageController.language.experienceJob1Title,
        'description': languageController.language.experienceJob1Content,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int f=0; f<experience.length; f++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experience[f]['company']!,
                style: const TextStyle(
                  color: Color.fromRGBO(51, 70, 100, 1),
                  fontFamily: 'Gilroy-Bold-120',
                  fontSize: 18,
                ),
              ),
              Text(
                experience[f]['years']!,
                style: const TextStyle(
                  color: Color.fromRGBO(98, 114, 137, 1),
                  fontFamily: 'Gilroy-Bold-120',
                  fontSize: 14,
                ),
              ),

              const SizedBox( height: 20 ),

              Text(
                experience[f]['job']!,
                style: const TextStyle(
                  color: Color.fromRGBO(51, 70, 100, 1),
                  fontFamily: 'Gilroy-Bold-120',
                  fontSize: 22,
                ),
              ),

              const SizedBox( height: 10 ),

              Text(
                experience[f]['description']!,
                style: const TextStyle(
                  color: Color.fromRGBO(98, 114, 137, 1),
                  fontFamily: 'Gilroy-Bold-120',
                  fontSize: 14,
                ),
              ),

              if (f != experience.length-1)
                const Column(
                  children: [
                    SizedBox(height: 35),
                    Divider(color: Colors.grey),
                  ],
                ),

              const SizedBox(height: 35),
            ],
          ),
      ],
    );
  }
}