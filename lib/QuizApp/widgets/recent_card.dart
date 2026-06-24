import 'package:flutter/material.dart';
class RecentCard extends StatelessWidget {
  const RecentCard({super.key, required this.title, required this.questionCount, required this.isComplete});
  final String title;
  final int questionCount;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Color(0Xfff5f3fb),
      style: ListTileStyle.drawer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Color(0Xfffeeafe),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.label_outline, color: Colors.pinkAccent,)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text("$questionCount Question"),
      trailing: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isComplete ? Colors.green.shade100 : Colors.orange.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(isComplete ? "Completed" : "Incomplete", style: TextStyle(color: isComplete ? Colors.green.shade800 : Colors.orange.shade800, fontSize: 12, fontWeight: FontWeight.w600),)),
    );
  }
}
