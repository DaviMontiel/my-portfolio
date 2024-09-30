import 'package:flutter/material.dart';

class HelloSectionWidget extends StatelessWidget {
  const HelloSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
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