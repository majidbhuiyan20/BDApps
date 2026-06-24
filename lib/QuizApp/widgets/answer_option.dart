import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption({super.key, required this.option, required this.serial, required this.isSelected});
  final String option;
  final String serial;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? Color(0Xffe2dff2): Color(0Xfff5f5f5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Color(0Xff3e2788) : Colors.transparent,
          width: 1
        ),
      ),
      child: Row(
        spacing: 12,
        children: [
          CircleAvatar(
            backgroundColor: Color(0Xff3e2788).withValues(alpha: 0.15),
            child: Text(serial, style: TextStyle(color: isSelected ? Color(0Xff3e2788) : Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
          ),
          Text(option, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isSelected ? Color(0Xff3e2788) : Colors.black),)
        ],
      ),
    );
  }
}
