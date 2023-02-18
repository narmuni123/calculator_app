import 'package:calculator_app/constant/themes.dart';
import 'package:calculator_app/screens/calculator_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}
