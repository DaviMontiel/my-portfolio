import 'package:david_portfolio_app/src/controller/language_controller.dart';
import 'package:flutter/material.dart';

class HobbiesSectionWidget extends StatefulWidget {
  const HobbiesSectionWidget({super.key});

  @override
  State<HobbiesSectionWidget> createState() => _HobbiesSectionWidgetState();
}

class _HobbiesSectionWidgetState extends State<HobbiesSectionWidget> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            languageController.language.skillsText0,
            style: const TextStyle(
              color: Color.fromRGBO(51, 70, 100, 1),
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
    );
  }
}