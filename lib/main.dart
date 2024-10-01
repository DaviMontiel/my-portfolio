import 'package:david_portfolio_app/src/controller/language_controller.dart';
import 'package:david_portfolio_app/src/model/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:david_portfolio_app/src/view/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT
  await preferences.init();
  await languageController.init();

  // UP BAR TRANSPARENT
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  // DEVICE ORIENTATION
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: languageController,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        home: const WelcomePage(),
      ),
    );
  }
}