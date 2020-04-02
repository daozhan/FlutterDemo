import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';

import 'home_coupon.dart';

class HomeClassify extends StatefulWidget {
  @override
  _HomeClassifyState createState() => _HomeClassifyState();
}

class _HomeClassifyState extends State<HomeClassify> {
  List _listData = new List();

  @override
  void initState() {
    super.initState();
    _listData = [
      {
        "image": 'images/home_icon_one.png',
        "title": '外卖',
      },
      {
        "image": 'images/home_icon_two.png',
        "title": '充值有礼',
      },
      {
        "image": 'images/home_icon_three.png',
        "title": '我的订单',
      },
      {
        "image": 'images/home_icon_four.png',
        "title": '我的卡券',
      },
      {
        "image": 'images/home_icon_five.png',
        "title": '扫码点单',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio:0.7
            ),
            itemCount: _listData.length,
            itemBuilder: _getClassifyList
        ),
      ),
    );
  }

  Widget _getClassifyList(context, index){
    return GestureDetector(
      onTap: (){
        setState(() {
          switch(index){
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              Navigator.of(context).push(PageAnimation(HomeCoupon()));
              break;
            case 4:
              break;
          }
        });
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 7),
              child: Image.asset(
                _listData[index]['image'],
                width: 50,
                height: 50,
              ),
            ),
            Text(_listData[index]['title'])
          ],
        ),
      ),
    );
  }
}
