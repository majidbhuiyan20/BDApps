import 'package:bdapps/QuizApp/model/quiz_ques_model.dart';
import 'package:hive/hive.dart';

class QuestionStorage {
  String keyQuestions = 'questions';
  Box box = Hive.box('quiz_box');

  Future<void> getQuestion(Map<String, dynamic> questionJson)async {
    QuizQuestion question = QuizQuestion.fromJson(questionJson);
    box.add(questionJson);
  }

  Future<void> addQuestion(Map<String, dynamic> questionJson)async {
    QuizQuestion question = QuizQuestion.fromJson(questionJson);
    box.add(questionJson);
  }
}