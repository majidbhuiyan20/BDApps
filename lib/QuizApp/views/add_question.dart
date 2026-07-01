import 'package:bdapps/QuizApp/service/hive_database.dart';
import 'package:bdapps/QuizApp/widgets/my_textfield.dart';
import 'package:bdapps/QuizApp/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'added_questions.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final TextEditingController questionTitleController = TextEditingController();
  final TextEditingController optionAController = TextEditingController();
  final TextEditingController optionBController = TextEditingController();
  final TextEditingController optionCController = TextEditingController();
  final TextEditingController optionDController = TextEditingController();
  final TextEditingController markController = TextEditingController();
  int? currentAnswerIndex;

  void addQuestion() {
    // Validation
    if (questionTitleController.text.trim().isEmpty ||
        optionAController.text.trim().isEmpty ||
        optionBController.text.trim().isEmpty ||
        optionCController.text.trim().isEmpty ||
        optionDController.text.trim().isEmpty ||
        markController.text.trim().isEmpty ||
        currentAnswerIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields and select the correct answer"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    Map<String, dynamic> questionJson = {
      "id": DateTime.now().millisecondsSinceEpoch,
      "question": questionTitleController.text.trim(),
      "options": [
        optionAController.text.trim(),
        optionBController.text.trim(),
        optionCController.text.trim(),
        optionDController.text.trim(),
      ],
      "answerIndex": currentAnswerIndex,
      "mark": int.tryParse(markController.text.trim()) ?? 0,
    };

    HiveDatabase.addQuestion(questionJson);
    resetForm();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Success"),
        content: const Text("Question added successfully!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: Color(0xFF4A00E0), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void resetForm() {
    questionTitleController.clear();
    optionAController.clear();
    optionBController.clear();
    optionCController.clear();
    optionDController.clear();
    markController.clear();
    setState(() {
      currentAnswerIndex = null;
    });
  }

  @override
  void dispose() {
    questionTitleController.dispose();
    optionAController.dispose();
    optionBController.dispose();
    optionCController.dispose();
    optionDController.dispose();
    markController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        title: const Text('Add Question', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TitleSection(title: "Question Title", showSeeAll: false),
          const SizedBox(height: 12),
          MyTextField(
            controller: questionTitleController,
            label: "Enter question here...",
          ),
          const SizedBox(height: 24),
          
          const TitleSection(title: "Options", showSeeAll: false),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                MyTextField(controller: optionAController, label: "Option A"),
                const SizedBox(height: 12),
                MyTextField(controller: optionBController, label: "Option B"),
                const SizedBox(height: 12),
                MyTextField(controller: optionCController, label: "Option C"),
                const SizedBox(height: 12),
                MyTextField(controller: optionDController, label: "Option D"),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const TitleSection(title: "Select Correct Answer", showSeeAll: false),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildRadioOption("A", 0),
                    _buildRadioOption("B", 1),
                  ],
                ),
                Row(
                  children: [
                    _buildRadioOption("C", 2),
                    _buildRadioOption("D", 3),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          const TitleSection(title: "Scoring", showSeeAll: false),
          const SizedBox(height: 12),
          MyTextField(
            controller: markController,
            label: "Points (e.g., 10)",
            showNumberKeyboardOnly: true,
          ),
          
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: addQuestion,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A00E0),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 58),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              elevation: 2,
            ),
            child: const Text("Add Question", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddedQuestions()));
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 58),
              side: const BorderSide(color: Color(0xFF4A00E0), width: 1.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
            child: const Text("View All Questions", style: TextStyle(color: Color(0xFF4A00E0), fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String label, int value) {
    return Expanded(
      child: RadioListTile<int>(
        value: value,
        groupValue: currentAnswerIndex,
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        activeColor: const Color(0xFF4A00E0),
        onChanged: (newValue) {
          setState(() {
            currentAnswerIndex = newValue;
          });
        },
      ),
    );
  }
}
