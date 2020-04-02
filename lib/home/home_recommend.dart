import 'package:flutter/material.dart';

class HomeRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Color(0xFFF5F5F5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 36,
            height: 1,
            color: Color(0xFF999999),
          ),

          SizedBox(
            width: 6,
          ),

          Image.asset(
            'images/home_like.png',
            width: 16,
            height: 16,
            fit: BoxFit.fill,
          ),

          SizedBox(
            width: 5,
          ),

          Text(
            '菜品推荐',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF555555),
            ),
          ),

          SizedBox(
            width: 6,
          ),

          Container(
            width: 36,
            height: 1,
            color: Color(0xFF999999),
          )
        ],
      ),
    );
  }
}
