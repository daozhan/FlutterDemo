import 'package:flutter/material.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

import 'home_shop_details_banner.dart';

class HomeShopDetails extends StatefulWidget {
  @override
  _HomeShopDetailsState createState() => _HomeShopDetailsState();
}

class _HomeShopDetailsState extends State<HomeShopDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('商家介绍', context),
      body: Container(
        color: Color(0xFFF0F0F0),
        child: Column(
          children: <Widget>[
            HomeShopDetailsBanner(),
            Container(
              height: 10,
              color: Color(0xFFF0F0F0),
            ),
            Container(
              height: 45,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 13,
                  ),

                  Image.asset(
                    'images/home_sale_location.png',
                    width: 15,
                    height: 16,
                    fit: BoxFit.fill,
                  ),

                  SizedBox(
                    width: 9,
                  ),

                  Expanded(
                    child: Text(
                      '南昌市青云谱区广州路28号',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333)
                      ),
                    ),
                  ),

                  Image.asset(
                    'images/home_phone.png',
                    width: 17,
                    height: 19,
                    fit: BoxFit.fill,
                  ),

                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ),

            Container(
              height: 10,
              color: Color(0xFFF0F0F0),
            ),

            Container(
              height: 45,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 13,
                  ),

                  Image.asset(
                    'images/home_time.png',
                    width: 15,
                    height: 15,
                    fit: BoxFit.fill,
                  ),

                  SizedBox(
                    width: 9,
                  ),

                  Expanded(
                    child: Text(
                      '营业时间：09:30-20:00',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333)
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 10,
              color: Color(0xFFF0F0F0),
            ),

            Container(
              height: 45,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 13,
                  ),

                  Image.asset(
                    'images/home_service.png',
                    width: 15,
                    height: 15,
                    fit: BoxFit.fill,
                  ),

                  SizedBox(
                    width: 9,
                  ),

                  Text(
                    '商家服务:',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333)
                    ),
                  ),

                  SizedBox(
                    width: 5,
                  ),

                  Image.asset(
                    'images/home_order.png',
                    width: 18,
                    height: 18,
                    fit: BoxFit.fill,
                  ),

                  Text(
                    '跨天预订',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333)
                    ),
                  ),

                  SizedBox(
                    width: 15,
                  ),

                  Image.asset(
                    'images/home_sale_get.png',
                    width: 18,
                    height: 18,
                    fit: BoxFit.fill,
                  ),

                  Text(
                    '到店自取',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333)
                    ),
                  ),

                ],
              ),
            ),

            Container(
              height: 10,
              color: Color(0xFFF0F0F0),
            ),

          ],
        ),
      ),
    );
  }
}
