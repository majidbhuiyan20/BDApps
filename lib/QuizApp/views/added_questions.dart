import 'package:bdapps/QuizApp/views/question_preview.dart';
import 'package:flutter/material.dart';

import '../model/quiz_ques_model.dart';
import '../service/hive_database.dart';

class AddedQuestions extends StatefulWidget {
  const AddedQuestions({super.key});

  @override
  State<AddedQuestions> createState() => _AddedQuestionsState();
}

class _AddedQuestionsState extends State<AddedQuestions> {
  List<QuizQuestion> allQuestions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAllQuestions();

  }

  void loadAllQuestions(){
    allQuestions = HiveDatabase.myQuestions.map((questionJson) => QuizQuestion.fromJson(questionJson)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Added Questions"),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ...List.generate(allQuestions.length, (index) => QuestionPreview(question: allQuestions[index], index: index))
        ]

      )
    );
  }
}
