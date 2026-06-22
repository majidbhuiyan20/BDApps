import 'package:flutter/material.dart';

class QuizAppHome extends StatefulWidget {
  const QuizAppHome({super.key});

  @override
  State<QuizAppHome> createState() => _QuizAppHomeState();
}

class _QuizAppHomeState extends State<QuizAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.pinkAccent,
                        width: 2
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/images/majid.png'))
                    ),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
