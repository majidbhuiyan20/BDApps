import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageHeader extends StatelessWidget  {
  const HomePageHeader({
    super.key, required this.totalScore,
  });

  final int? totalScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.pinkAccent,
                  width: 2
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(image: AssetImage('assets/images/majid.png'))
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hi, Majid B.', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16,),),
              Text('Flutter Developer', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black26.withOpacity(0.5)),)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0Xfff6f4fc),
            borderRadius: BorderRadius.circular(16),

          ),child: Row(
          spacing: 12,
          children: [
            const CircleAvatar(
                backgroundColor: Color(0Xfff4e2fa),
                foregroundColor: Colors.pinkAccent,
                child: Icon(Icons.diamond_outlined,  color: Colors.pinkAccent,)),
            Text(totalScore == null ? "0" : totalScore.toString(), style: const TextStyle(color: Color(0Xff220c87), fontSize: 16, fontWeight: FontWeight.bold),)

          ],
        ),
        )
      ],
    );
  }
}