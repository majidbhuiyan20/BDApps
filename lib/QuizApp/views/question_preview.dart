import 'package:bdapps/QuizApp/model/quiz_ques_model.dart';
import 'package:bdapps/QuizApp/service/hive_database.dart';
import 'package:flutter/material.dart';

class QuestionPreview extends StatelessWidget {
  const QuestionPreview({super.key, required this.question, required this.index});

  final QuizQuestion question;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Q${index+1} : ${question.question}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8,),
          ...List.generate(question.options.length, (optionIndex){
            bool isCorrect = optionIndex == question.answerIndex;
            return Padding(padding: EdgeInsets.symmetric(vertical: 4), child: Text("${String.fromCharCode(65 + optionIndex)}. ${question.options[optionIndex]} ${isCorrect ? "(Correct Answer)" : ""}", style: TextStyle(fontSize: 14, color: isCorrect ? Colors.green : Colors.black),));

          }),
          Divider(),
          
          Align(
              alignment: Alignment.center,
              child: Text("Mark: ${question.mark}"))
        ],
      ),
    );
  }
}
