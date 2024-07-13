import 'package:flutter/material.dart';
import 'package:sabjiwallah/constants/colors.dart';
import 'package:sabjiwallah/pages/intro_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.richBlack
      ),
    );
  }
}
