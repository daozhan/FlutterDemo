import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';

import 'mine_order.dart';


class MyOrderClassify extends StatefulWidget {
  @override
  _MyOrderClassifyState createState() => _MyOrderClassifyState();
}

class _MyOrderClassifyState extends State<MyOrderClassify> {
  List _listData = new List();

  @override
  void initState() {
    super.initState();
    _listData = [
      {
        "image": 'images/me_order_icon_one.png',
        "title": '待付款',
      },
      {
        "image": 'images/me_order_icon_two.png',
        "title": '待配送',
      },
      {
        "image": 'images/me_order_icon_three.png',
        "title": '待收货',
      },
      {
        "image": 'images/me_order_icon_four.png',
        "title": '待自提',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio:1.3
          ),
          itemCount: _listData.length,
          itemBuilder: _getClassifyList
      ),
    );
  }

  Widget _getClassifyList(context, index){
    return GestureDetector(
      onTap: (){
        setState(() {
          switch(index){
            case 0:
              Navigator.of(context).push(PageAnimation(MineOrder()));
              break;
            case 1:
              Navigator.of(context).push(PageAnimation(MineOrder()));
              break;
            case 2:
              Navigator.of(context).push(PageAnimation(MineOrder()));
              break;
            case 3:
              Navigator.of(context).push(PageAnimation(MineOrder()));
              break;
          }
        });
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 7),
              child: Image.asset(
                _listData[index]['image'],
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              _listData[index]['title'],
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF333333)
              ),
            )
          ],
        ),
      ),
    );
  }
}
