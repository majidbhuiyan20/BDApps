import 'package:bdapps/QuizApp/data/biology_question.dart';
import 'package:bdapps/QuizApp/data/chemistry_question.dart';
import 'package:bdapps/QuizApp/widgets/answer_option.dart';
import 'package:bdapps/QuizApp/widgets/question_card.dart';
import 'package:bdapps/QuizApp/widgets/quiz_progress.dart';
import 'package:flutter/material.dart';

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
  void submitAnswer(){
    //todo: selectedAnswerIndex != null
    if(selectedAnswerIndex == null){
      return;
    }
    //todo: check isSelectedAnswer == questionData.answerIndex
    correctAnswer = (selectedAnswerIndex == questions[progress].answerIndex);
    //todo: If incorrect show correct answer
    showCorrectAnswer = true;
    answerSubmitted = true;
    //todo: if Correct mark++
    obtainedMark = obtainedMark + questions[progress].mark!;
    setState(() {

    });
    

  }
  void prepareNextQuestion(){
     correctAnswer = false;
     selectedAnswerIndex = null;
     showCorrectAnswer = false;
     answerSubmitted = false;
     setState(() {

     });
     if(progress < questions.length)
     {
       progress++;
     }
     else{
       print("All Questions is completed");
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
    // TODO: implement initState
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
            color: Color(0Xfff6f4fc),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Color(0Xff2200a6),
              width: 1
            )
          ),
          child: Text("Score: ${obtainedMark.toString()}", style: TextStyle(
            color: Color(0Xff2200a6),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),),
        ),
      )],),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            Expanded(child: SizedBox()),
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
                  backgroundColor: MaterialStatePropertyAll(Color(0Xff2200a6)),
                  fixedSize: MaterialStatePropertyAll(
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
                  style: TextStyle(
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
