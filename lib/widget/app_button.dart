import 'package:flutter/material.dart';

class MyAppButton extends StatelessWidget {
  String title;

  MyAppButton({Key key, @required this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.fromLTRB(15, 46, 15, 0),
      decoration: BoxDecoration(
          color: Color(0xFFFDC137),
          borderRadius: BorderRadius.circular(22.0)
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 17,
              color: Color(0xFF333333)
          ),
        ),
      ),
    );
  }
}
