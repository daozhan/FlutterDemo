import 'package:flutter/material.dart';
import 'package:jiarui_hotel/home/search_page.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(PageAnimation(SearchPage()));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 5, 12, 5),
        child: Material(
          color: Color(0xfff7f7f7),
          borderRadius: BorderRadius.circular(17.0),
          child: Container(
            height: 35,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 24,
                ),
                Image.asset(
                  'images/search_icon.png',
                  width: 13,
                  height: 13,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '新品上架快来品尝吧~',
                  style: TextStyle(
                      color: Color(0xffa6a6a6),
                      fontSize: 13
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
