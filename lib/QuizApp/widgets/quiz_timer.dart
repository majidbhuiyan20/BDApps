import 'dart:async';
import 'package:flutter/material.dart';

class QuizTimer extends StatefulWidget {
  const QuizTimer({super.key});

  @override
  State<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  int remainingSecond = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    // Cancel any existing timer
    _timer?.cancel();
    
    // Use Timer.periodic instead of recursive calls to avoid StackOverflow
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (remainingSecond > 0) {
            remainingSecond--;
          } else {
            _timer?.cancel();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: CircularProgressIndicator(
            value: remainingSecond / 30,
            strokeWidth: 6,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              remainingSecond < 10 ? Colors.redAccent : const Color(0xFF4A00E0),
            ),
          ),
        ),
        Text(
          "00:${remainingSecond.toString().padLeft(2, '0')}",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: remainingSecond < 10 ? Colors.redAccent : Colors.black87,
          ),
        )
      ],
    );
  }
}
