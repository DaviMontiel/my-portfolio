import 'package:david_portfolio_app/src/controller/external_controller.dart';
import 'package:david_portfolio_app/src/controller/language_controller.dart';
import 'package:flutter/material.dart';

class ExperiencieSectionWidget extends StatelessWidget {
  const ExperiencieSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> experience = [
      {
        "company": "Metrica6",
        "years": "2023 - ${languageController.language.experienceYearPresent}",
        "job": languageController.language.experienceJob0Title,
        "description": languageController.language.experienceJob0Content,
        "apps": [
          {
            "icon": "lib/assets/images/app_quick.png",
            "name": "Quick",
            "text": languageController.language.experienceJob0App0Content,
            "link": "https://play.google.com/store/apps/details?id=com.metrica6.quick",
          },
          {
            "icon": "lib/assets/images/app_waisense.png",
            "name": "Waisense",
            "text": languageController.language.experienceJob0App1Content,
            "link": "https://play.google.com/store/apps/details?id=com.metrica6.waisenseapp",
          },
        ]
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
              if (f != 0) const SizedBox(height: 30),

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
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color.fromRGBO(98, 114, 137, 1),
                  fontFamily: 'Gilroy-Bold-120',
                  fontSize: 16,
                ),
              ),

              // const SizedBox(height: 15),

              if (experience[f]['apps'] != null)
              for (int d=0; d<experience[f]['apps'].length; d++)
                Column(
                  children: [
                    if (d != experience[f]['apps'][d].length-1)
                      const SizedBox(height: 15),

                    GestureDetector(
                      onTap: () {
                        externalController.openUrl(experience[f]['apps'][d]['link']);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            color: const Color.fromARGB(255, 219, 219, 219),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(right: 10, bottom: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 192, 192, 192),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Image.asset(
                                    experience[f]['apps'][d]['icon'],
                                    width: 70,
                                  ),
                                ),
                      
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 45,
                                        child: Text(
                                          experience[f]['apps'][d]['name'],
                                          style: const TextStyle(
                                            color: Color.fromRGBO(51, 70, 100, 1),
                                            fontFamily: 'Gilroy-Bold-120',
                                            fontSize: 26
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                      
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    experience[f]['apps'][d]['text'],
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(98, 114, 137, 1),
                                      fontFamily: 'Gilroy-Bold-120',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              if (f != experience.length-1)
                const SizedBox(
                  width: 35,
                  child: Column(
                    children: [
                      SizedBox(height: 35, width: 10),
                      Divider(color: Colors.grey),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}