import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:david_portfolio_app/src/view/pages/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Ocultar las barras de sistema
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}