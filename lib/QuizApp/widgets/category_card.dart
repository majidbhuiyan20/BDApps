import 'package:bdapps/QuizApp/views/quiz_page.dart';
import 'package:flutter/material.dart';

import '../views/quiz_app_home.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.imageFileName,
  });

  final String title;
  final String imageFileName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizPage(category: title,)));
      },
      child: Container(
        height: 120,
        width: 180,
        decoration: BoxDecoration(
            color: Color(0Xfffeeafe),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/category/$imageFileName', height: 84),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0Xff230a94))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
