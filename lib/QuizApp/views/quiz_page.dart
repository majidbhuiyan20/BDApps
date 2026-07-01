import 'package:bdapps/QuizApp/data/biology_question.dart';
import 'package:bdapps/QuizApp/data/chemistry_question.dart';
import 'package:bdapps/QuizApp/widgets/answer_option.dart';
import 'package:bdapps/QuizApp/widgets/question_card.dart';
import 'package:bdapps/QuizApp/widgets/quiz_progress.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/computer_question.dart';
import '../data/math_question.dart';
import '../model/quiz_ques_model.dart';
import '../utils/numeric_serial_to_abc.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.category});
  final String category;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int? selectedAnswerIndex;
  bool correctAnswer = false;
  bool showCorrectAnswer = false;
  bool answerSubmitted = false;
  int obtainedMark = 0;
  int progress = 0;

  List<QuizQuestion> questions = [];
  void setAnswer(int index) {
    if (selectedAnswerIndex == index) {
      selectedAnswerIndex = null;
    } else {
      selectedAnswerIndex = index;
    }
    setState(() {});
  }
  Future<void> submitAnswer() async {
    if(selectedAnswerIndex == null){
      return;
    }
    correctAnswer = (selectedAnswerIndex == questions[progress].answerIndex);
    showCorrectAnswer = true;
    answerSubmitted = true;
    if(correctAnswer){
      int markToAdd = questions[progress].mark ?? 0;
      obtainedMark = obtainedMark + markToAdd;
      SharedPreferences pref = await SharedPreferences.getInstance();
      int currentTotalScore  = pref.getInt("score") ?? 0;
      await pref.setInt("score", currentTotalScore + markToAdd);
    }
    setState(() {

    });
    

  }
  void prepareNextQuestion(){
     if(progress < questions.length - 1)
     {
       setState(() {
         progress++;
         correctAnswer = false;
         selectedAnswerIndex = null;
         showCorrectAnswer = false;
         answerSubmitted = false;
       });
     }
     else{
       // Handle completion
       showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: const Text("Quiz Completed!"),
           content: Text("Your score: $obtainedMark"),
           actions: [
             TextButton(
               onPressed: () => Navigator.pop(context),
               child: const Text("OK"),
             )
           ],
         )
       );
       print("All Questions completed");
     }
  }

  void loadAllQuestionsOfThisCategory(){
    List<QuizQuestion> allQuestionOfThisCategory = [];
    if(widget.category == "Math"){
      allQuestionOfThisCategory = mathQuestions;
    }
    else if(widget.category == "Chemistry"){
      allQuestionOfThisCategory = chemistryQuestions;
    }
    else if(widget.category == "Biology"){
      allQuestionOfThisCategory = biologyQuestions;
    }
    else if(widget.category == "Computer"){
      allQuestionOfThisCategory = computerQuestions;
    }
    setState(() {
      questions = List<QuizQuestion>.from(allQuestionOfThisCategory)..shuffle();
    });
  }
  @override
  void initState() {
    loadAllQuestionsOfThisCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("${widget.category} Quiz"), actions: [Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0Xfff6f4fc),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0Xff2200a6),
              width: 1
            )
          ),
          child: Text("Score: ${obtainedMark.toString()}", style: const TextStyle(
            color: Color(0Xff2200a6),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),),
        ),
      )],),
      body:questions.isEmpty ? const Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_outlined, size: 100,), 
          Text("No Question Found", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
        ],
      ),) : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 22,
          children: [
            QuizProgress(currentProgress: progress+1, totalCount: questions.length ,),
            Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionCard(question: questions[progress].question),
                Column(
                  spacing: 12,
                  children: List.generate(
                    questions[progress].options.length,
                    (currentIndex) => AnswerOption(
                      option: questions[progress].options[currentIndex],
                      serial: numericSerialToABC(currentIndex),
                      isSelected: currentIndex == selectedAnswerIndex,
                      onTap:answerSubmitted? null : () => setAnswer(currentIndex),
                      showCorrectAnswer: questions[progress].answerIndex == currentIndex && showCorrectAnswer,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            if(answerSubmitted)
              Text(correctAnswer ? "Correct Answer" : "Incorrect Answer", style: TextStyle(
              color: correctAnswer ? Colors.green : Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Color(0Xff2200a6)),
                  fixedSize: const MaterialStatePropertyAll(
                    Size(double.maxFinite, 56),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

                onPressed: answerSubmitted ? prepareNextQuestion :  submitAnswer,
                child: Text(
                  answerSubmitted ?
                  "Next" : "Submit",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
