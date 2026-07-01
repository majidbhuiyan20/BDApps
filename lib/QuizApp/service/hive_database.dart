import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatabase {
  static Box? hiveStorage;

  static Future<void> initialize()async{
    await Hive.initFlutter();
    hiveStorage = await Hive.openBox('QuizShell');
  }

  static Box  get box{
    if(hiveStorage == null){
      throw Exception('Hive storage not initialized');
    }else{
      return hiveStorage!;
    }
  }


  // Read all Questions
  static List get myQuestions => box.get("myQuestions") ?? [];

  // Save all questions
  static Future<void> saveAllQuestions(List questions)async{
    await box.put("myQuestions", questions);

  }

  // Create new questions
  static Future<void> addQuestion(Map<String, dynamic> question)async{
    List existingQuestions = myQuestions;
    existingQuestions.add(question);
    await saveAllQuestions(existingQuestions);
  }

  // Update an existing question
  static Future<void> updateQuestion( Map<String, dynamic> question ) async {
    List existingQuestions = myQuestions;
    int index = existingQuestions.indexWhere((q) => q['id'] == question['id']);
    if (index != -1) {
      existingQuestions[index] = question;
      await saveAllQuestions(existingQuestions);
    }
  }

  // Delete a questions
  static Future<void> deleteQuestion(int questionId) async {
    List existingQuestions = myQuestions;
    existingQuestions.removeWhere((q) => q['id'] == questionId);
    await saveAllQuestions(existingQuestions);
  }
}