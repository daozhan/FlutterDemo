import 'package:flutter/material.dart';
import 'package:jiarui_hotel/login/login_page.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

import 'mine_list.dart';
import 'mine_order.dart';
import 'mine_order_classify.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarNoBack('我的', Color(0xFFFDC137),context),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(PageAnimation(LoginPage()));
            },
            child: Container(
              height: 100,
              color: Color(0xFFFDC137),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: ClipOval(
                      child: Image.network(
                        'https://tse4-mm.cn.bing.net/th?id=OIP.q53c9FWOXGvw00Xr-a162wAAAA&w=198&h=198&c=7&o=5&pid=1.7',
                        width: 60,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'dao',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF333333)
                        ),
                      ),

                      SizedBox(
                        height: 11,
                      ),

                      Text(
                        '173***6574',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF333333)
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),

          Container(
            height: 10,
            color: Color(0xFFF5F5F5),
          ),

          GestureDetector(
            onTap: (){
              Navigator.of(context).push(PageAnimation(MineOrder()));
            },
            child: Container(
                color: Colors.white,
                height: 45,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),

                    Expanded(
                        child: Text(
                          '我的订单',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF333333)
                          ),
                        )
                    ),

                    Text(
                      '查看全部订单',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF333333)
                      ),
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    Image.asset(
                      'images/consulting_home_return.png',
                      width: 7,
                      height: 13,
                    ),

                    SizedBox(
                      width: 12,
                    ),

                  ],
                )
            ),
          ),

          Divider(
            color: Color(0xFFDCDCDC),
            height: 1,
          ),

          MyOrderClassify(),

          Container(
            height: 10,
            color: Color(0xFFF5F5F5),
          ),

          MineList(
            icon: 'images/me_icon_wallet.png',
            title: '我的钱包',
          ),
          MineList(
            icon: 'images/my_icon_address.png',
            title: '地址管理',
          ),
          MineList(
            icon: 'images/my_icon_card.png',
            title: '我的卡券',
          ),
          MineList(
            icon: 'images/my_icon_set.png',
            title: '设置',
          ),

          SizedBox(
            height: 18,
          ),

          Text(
            '嘉瑞科技提供技术支持',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9E9E9E)
            ),
          )
        ],
      ),
    );
  }
}
