import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

/**
 *设置Bar
 */
AppBar MyAppBar(String title,BuildContext context) {
  return AppBar(
    title: Container(
      height: 45,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            child: Container(
              alignment: FractionalOffset.centerLeft,
              child: Image.asset('images/tab_icon_return.png', width: 17, height: 17,),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          Align(
            alignment: FractionalOffset.center,
            child: Text(title, style: TextStyle(
                color: Color(0xFF333333), fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    elevation: 1,
  );
}

/**
 *设置Bar
 */
AppBar MyAppBarLogin(String title,BuildContext context) {
  return AppBar(
    title: Container(
      height: 45,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            child: Container(
              alignment: FractionalOffset.centerLeft,
              child: Image.asset('images/tab_icon_return.png', width: 17, height: 17,),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          Align(
            alignment: FractionalOffset.centerRight,
            child: Text(title, style: TextStyle(
                color: Color(0xFF999999), fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    elevation: 1,
  );
}

AppBar MyAppBarTab(String title, BuildContext context, TabController _tabController, List<Widget> tabs, int _color, bool _isScrollable) {
  return AppBar(
    title: Container(
      height: 45,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            child: Container(
              alignment: FractionalOffset.centerLeft,
              child: Image.asset('images/tab_icon_return.png', width: 17, height: 17,),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          Align(
            alignment: FractionalOffset.center,
            child: Text(title, style: TextStyle(
                color: Color(0xFF333333), fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    elevation: 1,
    bottom: TabBar(
      isScrollable: _isScrollable,
      controller: _tabController,
      indicatorColor: Color(_color),
      indicatorPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      labelColor: Color(_color),
      unselectedLabelColor: Color(0xFF666666),
      tabs: tabs,
    ),
  );
}

/**
 *设置Bar
 */
AppBar MyAppBarNoBack(String title ,Color color ,BuildContext context) {
  return AppBar(
    title: Container(
      height: 45,

      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            child: Text(title, style: TextStyle(
                color: Color(0xFF333333), fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: color,
    automaticallyImplyLeading: false,
    elevation: 0,
  );
}
// 设置沉浸式状态栏
void setimmersive(Color BarColor) {
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: BarColor);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  }
}
