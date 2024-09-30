import 'package:flutter/material.dart';

class ExperiencieSectionWidget extends StatelessWidget {
  ExperiencieSectionWidget({super.key});

  final List<Map<String, String>> experience = [
    {
      "company": "Metrica6",
      "years": "2023 - Present",
      "job": "Full Stack Developer",
      "description":
        "Currently, I work as a Mid-Level Full Stack Developer, where I specialize in creating and maintaining servers, as well as developing applications and services for various projects. My responsibilities include:"
        "\n\n  - Application Development: Designing, implementing, and maintaining robust and scalable web applications using modern technologies on both the front-end and back-end. \n\n  - API Creation: Developing Application Programming Interfaces (APIs) that facilitate communication between different services and systems, ensuring their efficiency and security."
        "\n\n  - Database Management: Designing and managing databases, optimizing queries, and ensuring the integrity and security of data."
        "\n\n  - Server Maintenance: Configuring and managing servers to ensure optimal performance, implementing security measures, and managing scaling as needed."
        "\n\n  - Project Collaboration: Working closely with other team members, including designers and project managers, to ensure alignment with project objectives and timely delivery of quality solutions."
        "\n\n  - Problem Resolution: Identifying and resolving technical issues that may arise during the development and maintenance of applications and services."
    },
    {
      'company': 'VivaTech',
      'years': '2021 - 2021',
      'job': 'Computer Systems Technician',
      'description': 'At Vivatech, I worked as a Computer Technician, focusing on the repair of computers, laptops, and tablets. My role involved diagnosing and troubleshooting both software and hardware issues, ensuring that the devices operated efficiently.',
    },
  ];

  @override
  Widget build(BuildContext context) {
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