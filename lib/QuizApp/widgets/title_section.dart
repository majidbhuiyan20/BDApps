import 'package:flutter/material.dart';
class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key, required this.title, this.showSeeAll = true,
  });
  final String title;
  final bool showSeeAll;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, ),),
        if(showSeeAll)InkWell(
            onTap: (){
              print("User Tapped see all button");
            },
            child: Text("See All", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Color(0Xff230a94) )))
      ],
    );
  }
}