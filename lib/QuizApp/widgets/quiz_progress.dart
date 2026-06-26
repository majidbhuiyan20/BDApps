import 'package:bdapps/QuizApp/widgets/quiz_timer.dart';
import 'package:flutter/material.dart';

class QuizProgress extends StatelessWidget {
  const QuizProgress({super.key, required this.currentProgress, required this.totalCount});
  final int currentProgress;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Question",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      currentProgress.toString(),
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "/$totalCount",
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            QuizTimer()
          ],
        ),
        LinearProgressIndicator(
          value: totalCount > 0 ? currentProgress / totalCount : 0,
        )
      ],
    );
  }
}


