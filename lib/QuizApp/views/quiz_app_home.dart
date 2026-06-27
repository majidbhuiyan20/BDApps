import 'package:bdapps/QuizApp/model/quiz_ques_model.dart';
import 'package:bdapps/QuizApp/widgets/category_card.dart';
import 'package:bdapps/QuizApp/widgets/recent_card.dart';
import 'package:bdapps/QuizApp/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/home_page_header.dart';
import '../widgets/quiz_banner.dart';

class QuizAppHome extends StatefulWidget {
  const QuizAppHome({super.key});

  @override
  State<QuizAppHome> createState() => _QuizAppHomeState();
}

class _QuizAppHomeState extends State<QuizAppHome> {
  int? totalScore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScore();
  }
  Future<void> getScore() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    totalScore = pref.getInt('score');
    setState(() {

    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
            onRefresh: ()async=>await getScore(),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                HomePageHeader(totalScore: totalScore,),
                const SizedBox(height: 16),
                const QuizBanner(),
                const SizedBox(height: 16),
                TitleSection(title: 'Subjects',),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 16,
                    children: [
                      CategoryCard(title: "Math", imageFileName: "math.png"),
                      CategoryCard(title: "Chemistry", imageFileName: "chemistry.png"),
                      CategoryCard(title: "Biology", imageFileName: "biology.png"),
                      CategoryCard(title: "Computer", imageFileName: "computer.png"),
                      CategoryCard(title: "Physics", imageFileName: "math.png"),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TitleSection(title: 'Recent',showSeeAll: false,),
                const SizedBox(height: 16),
                RecentCard(title: "Math", questionCount: 10, isComplete: true,),
                const SizedBox(height: 16),
                RecentCard(title: "English", questionCount: 43, isComplete: false,),
                const SizedBox(height: 16),
                RecentCard(title: "Bangla", questionCount: 32, isComplete: true),
              ],
            )
          )
      ),
    );
  }
}




