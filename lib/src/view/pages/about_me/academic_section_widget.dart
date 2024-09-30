import 'package:flutter/material.dart';

class AcademicSectionWidget extends StatelessWidget {
  const AcademicSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Academic',
          style: TextStyle(
            color: Color.fromRGBO(51, 70, 100, 1),
            fontFamily: 'Gilroy-Bold-120',
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}