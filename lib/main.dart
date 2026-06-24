import 'package:flutter/material.dart';
import 'QuizApp/views/quiz_app_home.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Profile',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
        brightness: Brightness.light,
      ),
      home:  QuizAppHome(),
    );
  }
}
