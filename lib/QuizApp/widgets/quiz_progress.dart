import 'package:flutter/material.dart';
class QuizProgress extends StatefulWidget {
  const QuizProgress({super.key});

  @override
  State<QuizProgress> createState() => _QuizProgressState();
}

class _QuizProgressState extends State<QuizProgress> {
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
                Text("Question", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),),
                Row(
                  children: [
                    Text("6", style: TextStyle(fontSize: 26, color: Colors.pinkAccent, fontWeight: FontWeight.bold),),
                    Text("/20", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: CircularProgressIndicator(
                    value: 0.5,

                    backgroundColor: Colors.grey[300],
                  ),
                ),
                Text("00:25", style: TextStyle( fontSize: 14 ),)
              ],
            )
          ],
        ),
        LinearProgressIndicator(value: 6 / 20,)
      ],
    );
  }
}
