import 'package:bdapps/QuizApp/widgets/answer_option.dart';
import 'package:bdapps/QuizApp/widgets/question_card.dart';
import 'package:bdapps/QuizApp/widgets/quiz_progress.dart';
import 'package:flutter/material.dart';

import '../model/quiz_ques_model.dart';
import '../utils/numeric_serial_to_abc.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

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


  QuizQuestion questionData = QuizQuestion(
    id: 1,
    question: "Which of the following is not a programming language?",
    options: ["Majid", "Toma", "Python", "Bhuiyan"],
    answerIndex: 2,
  );
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
    correctAnswer = (selectedAnswerIndex == questionData.answerIndex);
    //todo: If incorrect show correct answer
    showCorrectAnswer = true;
    answerSubmitted = true;
    //todo: if Correct mark++
    obtainedMark = obtainedMark + questionData.mark!;
    //todo: update progress
    progress++;
    setState(() {

    });
    

  }
  void prepareNextQuestion(){
    questionData = QuizQuestion(
      id: 2,
      question: "What is the national flower of Bangladesh",
      options: ["Rose", "Lily", "Toma", "Lotus"],
      answerIndex: 1,
    );
     correctAnswer = false;
     showCorrectAnswer = false;
     answerSubmitted = false;
     setState(() {

     });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 22,
          children: [
            QuizProgress(currentProgress: progress+1, totalCount: 5 ,),
            Column(
              spacing: 12,
              children: [
                QuestionCard(question: questionData.question),
                Column(
                  spacing: 12,
                  children: List.generate(
                    questionData.options.length,
                    (currentIndex) => AnswerOption(
                      option: questionData.options[currentIndex],
                      serial: numericSerialToABC(currentIndex),
                      isSelected: currentIndex == selectedAnswerIndex,
                      onTap:answerSubmitted? null : () => setAnswer(currentIndex),
                      showCorrectAnswer: questionData.answerIndex == currentIndex && showCorrectAnswer,
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
