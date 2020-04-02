import 'package:flutter/material.dart';
import 'package:jiarui_hotel/home/home_coupon_list.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';


class OrderCouponCenter extends StatefulWidget {
  @override
  _OrderCouponCenterState createState() => _OrderCouponCenterState();
}

class _OrderCouponCenterState extends State<OrderCouponCenter> {
  List<HomeCouponBena> _listData = new List();

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < 5; i++){
      _listData.add(HomeCouponBena(
          '全场通用优惠券',
          '10',
          '2018.02.03',
          '2018.03.15',
          '100'
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: MyAppBar('领券中心', context),
      body: RefreshIndicator(
        child: SingleChildScrollView(
          child: Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _listData.length,
                itemBuilder: _getOrderCouponList
            ),
          ),
        ),
        onRefresh: (){}
      ),
    );
  }

  Widget _getOrderCouponList(context, index){
    return Container(
      margin: EdgeInsets.fromLTRB(15, 17, 15, 0),
      height: 85,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'images/home_card_ls.png',
                      height: 85,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Image.asset(
                        'images/home_card_m.png',
                        height: 85,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 17,
                    ),

                    Text(
                      '¥'+_listData[index].price,
                      style: TextStyle(
                          color: Color(0xFFFF4457),
                          fontSize: 27
                      ),
                    ),

                    SizedBox(
                      width: 17,
                    ),

                    Container(
                      width: 1,
                      color: Color(0xFFDEDEDE),
                      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    ),

                    SizedBox(
                      width: 12,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _listData[index].title,
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15
                          ),
                        ),

                        SizedBox(
                          height: 27,
                        ),

                        Text(
                          _listData[index].start_time+_listData[index].end_time,
                          style: TextStyle(
                              color: Color(0xFFB2B2B2),
                              fontSize: 11
                          ),
                        ),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),

          Stack(
            children: <Widget>[
              Image.asset(
                'images/home_card_rs.png',
                height: double.infinity,
                fit: BoxFit.fill,
              ),

              Container(
                height: double.infinity,
                width: 103,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '满'+_listData[index].satisfy_price+'元',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                      ),

                      SizedBox(
                        height: 7,
                      ),

                      Text(
                        '可用',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                      ),

                      SizedBox(
                        height: 7,
                      ),

                      Container(
                        width: 67,
                        height: 19,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9.0)
                        ),
                        child: Center(
                          child: Text(
                            '立即领取',
                            style: TextStyle(
                                color: Color(0xFFFF4457),
                                fontSize: 11
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
