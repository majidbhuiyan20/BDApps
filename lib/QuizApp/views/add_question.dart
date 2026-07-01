import 'package:bdapps/QuizApp/widgets/my_textfield.dart';
import 'package:bdapps/QuizApp/widgets/title_section.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  TextEditingController questionTitleController = TextEditingController();
  TextEditingController optionAController = TextEditingController();
  TextEditingController optionBController = TextEditingController();
  TextEditingController optionCController = TextEditingController();
  TextEditingController optionDController = TextEditingController();
  TextEditingController markController = TextEditingController();
  int? currentAnswerIndex;

  void addQuestion(){
    Map<String, dynamic> questionJson = {
      "id": 1,
      "question": questionTitleController.text,
      "options": [
        optionAController.text,
        optionBController.text,
        optionCController.text,
        optionDController.text,
      ],
      "answerIndex": currentAnswerIndex,
      "mark": int.parse(markController.text),
    };
    print(questionJson);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Question'),
      ),
      body: ListView(
        padding:  EdgeInsets.all(16),
        // Question
        children: [
          MyTextField(controller: questionTitleController, label: "Question Title"),
          SizedBox(height: 16,),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1
              )
            ),
            child: Column(
              spacing: 12,
              children: [
                MyTextField(controller: optionAController, label: "Option A"),
                MyTextField(controller: optionBController, label: "Option B"),
                MyTextField(controller: optionCController, label: "Option C"),
                MyTextField(controller: optionDController, label: "Option D"),
              ],
            ),
          ),


          const SizedBox(height: 16),
          TitleSection(title: "Correct Answer", showSeeAll: false,),
          Row(
            children: [
              Expanded(
                child: RadioListTile<int?>(
                  dense: true,
                  value: 0,
                  title: Text("A"),
                  groupValue: currentAnswerIndex,
                  onChanged: (value) =>setState(() {
                    currentAnswerIndex = value;
                  })
                ),
              ),
              Expanded(
                child: RadioListTile<int?>(
                    dense: true,
                  value: 1,
                  title: Text("B"),
                  groupValue: currentAnswerIndex,
                  onChanged: (value)=>setState(() {
                    currentAnswerIndex = value;
                  })
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<int?>(
                  dense: true,
                  value: 2,
                  title: Text("C"),
                  groupValue: currentAnswerIndex,
                  onChanged: (value)=>setState(() {
                    currentAnswerIndex = value;
                  }),
                ),
              ),
              Expanded(
                child: RadioListTile<int?>(
                  dense: true,
                  value: 3,
                  title: Text("D"),
                  groupValue: currentAnswerIndex,
                  onChanged: (value) =>setState(() {
                    currentAnswerIndex = value;
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          MyTextField(controller: markController, label: "Total Mark", showNumberKeyboardOnly: true,),
          SizedBox(height: 16,),
          ElevatedButton(onPressed: (){
            addQuestion();
          }, child: Text("Submit")),
        ],

      )
    );
  }
}
