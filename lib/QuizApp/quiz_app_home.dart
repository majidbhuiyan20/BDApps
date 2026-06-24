import 'package:bdapps/QuizApp/widgets/category_card.dart';
import 'package:bdapps/QuizApp/widgets/recent_card.dart';
import 'package:bdapps/QuizApp/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'widgets/quiz_banner.dart';

class QuizAppHome extends StatefulWidget {
  const QuizAppHome({super.key});

  @override
  State<QuizAppHome> createState() => _QuizAppHomeState();
}

class _QuizAppHomeState extends State<QuizAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  Row(
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
              
                        ),child: const Row(
                        spacing: 12,
                        children: [
                          CircleAvatar(
                              backgroundColor: Color(0Xfff4e2fa),
                              foregroundColor: Colors.pinkAccent,
                              child: Icon(Icons.diamond_outlined,  color: Colors.pinkAccent,)),
                          Text("200", style: TextStyle(color: Color(0Xff220c87), fontSize: 16, fontWeight: FontWeight.bold),)
              
                        ],
                      ),
                      )
                    ],
                  ),
                  const QuizBanner(),
                  TitleSection(title: 'Subjects',),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     spacing: 16,
                     children: [
                       CategoryCard(title: "Math", imageFileName: "math.png", onTap: (){}),
                       CategoryCard(title: "Chemistry", imageFileName: "chemistry.png", onTap: (){}),
                       CategoryCard(title: "Biology", imageFileName: "biology.png", onTap: (){}),
                       CategoryCard(title: "Computer", imageFileName: "computer.png", onTap: (){}),
                     ],
                   ),
                 ),
                  TitleSection(title: 'Recent',showSeeAll: false,),
                  RecentCard(title: "Math", questionCount: 10, isComplete: true,),
                  RecentCard(title: "English", questionCount: 43, isComplete: false,),
                  RecentCard(title: "Bangla", questionCount: 32, isComplete: true),
                  RecentCard(title: "Chemistry", questionCount: 32, isComplete: true),
              
                ],
              ),
            ),
          )
      ),
    );
  }
}


