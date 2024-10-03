import 'package:flutter/material.dart';

class HobbiesSectionWidget extends StatefulWidget {
  const HobbiesSectionWidget({super.key});

  @override
  State<HobbiesSectionWidget> createState() => _HobbiesSectionWidgetState();
}

class _HobbiesSectionWidgetState extends State<HobbiesSectionWidget> {

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '+--------------------------------------+\n'
            '|      Aptitudes del Desarrollador     |\n'
            '|---------------------------- ---------|\n'
            '| • Desarrollo ágil                    |\n'
            '| • Frameworks                         |\n'
            '| • Diseño UI/UX                       |\n'
            '| • Programación                       |\n'
            '| • Pruebas de software                |\n'
            '| • Control de versiones (Git, GitHub) |\n'
            '| • Integración continua (CI/CD)       |\n'
            '| • APIs (RESTful, GraphQL)            |\n'
            '| • Bases de datos (SQL, NoSQL)        |\n'
            '| • Solución de problemas              |\n'
            '| • Colaboración                       |\n'
            '| • Adaptabilidad                      |\n'
            '| • Metodologías (TDD)                 |\n'
            '| • Seguridad                          |\n'
            '|--------------------------------------|\n'
            '|    [ Cerrar ]   [ Guardar Cambios ]  |\n'
            '+--------------------------------------+',
            style: TextStyle(
              color: Color.fromRGBO(51, 70, 100, 1),
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
    );
  }
}