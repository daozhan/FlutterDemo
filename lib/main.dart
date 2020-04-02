import 'package:flutter/material.dart';
import 'index_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '嘉瑞菜馆',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFFF9E1D),
          hintColor: Color(0xFFDCDCDC)
        ),
        home: IndexPage(),
      ),
    );
  }
}
