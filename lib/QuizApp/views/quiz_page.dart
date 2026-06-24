import 'package:bdapps/QuizApp/widgets/answer_option.dart';
import 'package:bdapps/QuizApp/widgets/question_card.dart';
import 'package:bdapps/QuizApp/widgets/quiz_progress.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          spacing: 22,
          children: [
            QuizProgress(),
            Column(
              spacing: 12,
              children: [
                QuestionCard(question: "Which of the following is not a programming language?",),
                AnswerOption(option: 'Majid', serial: 'a', isSelected: false,),
                AnswerOption(option: 'Toma', serial: 'b', isSelected: false,),
                AnswerOption(option: 'Python', serial: 'c', isSelected: true,),
                AnswerOption(option: 'Bhuiyan', serial: 'd', isSelected: false,),
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0Xff2200a6)),
                    fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 56)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  ),

                  onPressed: (){},
                  child: Text("Next", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}


