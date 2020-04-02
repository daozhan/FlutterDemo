import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home/home_page.dart';
import 'mine/mine_page.dart';
import 'order/order_page.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '点餐', '我的'];

  final pageController = PageController();
  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }
  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xfffe9f0a)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }
  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }


  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [getTabImage('images/bottom_icon_home_n.png'), getTabImage('images/bottom_icon_home_s.png')],
      [getTabImage('images/bottom_icon_class_n.png'), getTabImage('images/bottom_icon_class_s.png')],
      [getTabImage('images/bottom_icon_mer_n.png'), getTabImage('images/bottom_icon_me_s.png')]
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new HomePage(),
      new OrderPage(),
      new MinePage(),
    ];
  }

  void onPageChanged(int index) {
    setState(() {
      _tabIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    //初始化数据
    initData();
    return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: _pageList,
          physics: NeverScrollableScrollPhysics(), // 禁止滑动
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
          ],
          type: BottomNavigationBarType.fixed,
          //默认选中首页
          currentIndex: _tabIndex,
          backgroundColor: Colors.white,
          iconSize: 24.0,
          //点击事件
          onTap: (index) {
            setState(() {
//              _tabIndex = index;
              pageController.jumpToPage(index);
            });
          },
        ));
  }
}

