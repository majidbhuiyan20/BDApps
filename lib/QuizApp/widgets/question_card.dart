import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key, required this.question,
  });
  final String question;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0Xfffbddf7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: Colors.pinkAccent,
            width:1
        ),
      ),
      child: Text(question, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
    );
  }
}