import 'package:flutter/material.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

import 'mine_order_list.dart';
import 'mine_order_list_details.dart';

class MineOrderDetails extends StatefulWidget {
  List<MineOrderListBean> mineOrderListDetails = new List();

  MineOrderDetails({Key key, @required this.mineOrderListDetails}) : super(key : key);

  @override
  _MineOrderDetailsState createState() => _MineOrderDetailsState(mineOrderListDetails);
}

class _MineOrderDetailsState extends State<MineOrderDetails> {
  List<MineOrderListBean> _mineOrderListDetails = new List();

  _MineOrderDetailsState(List<MineOrderListBean> mineOrderListDetails){
    _mineOrderListDetails.addAll(mineOrderListDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('订单详情', context),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xFFF0F0F0),
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: FractionalOffset(0, 0.5),
                      children: <Widget>[
                        Image.asset(
                          'images/state_bg.png',
                          height: 73,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 14,
                                ),

                                Image.asset(
                                  'images/me_order_audit.png',
                                  width: 19,
                                  height: 19,
                                  fit: BoxFit.contain,
                                ),

                                SizedBox(
                                  width: 10,
                                ),

                                Text(
                                  '待付款',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF333333)
                                  ),
                                )
                              ],
                            ),

                            Container(
                              margin: EdgeInsets.fromLTRB(43, 10, 0, 0),
                              child: Text(
                                '请尽快付款哦~',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF333333)
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      color: Colors.white,
                      height: 88,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'images/me_order_location.png',
                            width: 19,
                            height: 19,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(
                            width: 14,
                          ),

                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          '收货人：彭道展',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF333333)
                                          ),
                                        ),
                                      ),

                                      Text(
                                        '17346606574',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF333333)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Text(
                                    '收货地址：江西省南昌市青云谱区新地路8号景泰华产业园1号楼',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF333333)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            width: 14,
                          ),

                          Image.asset(
                            'images/order_affirm_arrows.png',
                            width: 6,
                            height: 11,
                            fit: BoxFit.fill,
                          ),

                        ],
                      ),
                    ),

                    Image.asset('images/address_line.png'),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            height: 45,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'images/order_affirm_shop.png',
                                  width: 21,
                                  height: 21,
                                  fit: BoxFit.contain,
                                ),

                                SizedBox(
                                    width: 12
                                ),

                                Text(
                                  '嘉瑞菜馆',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF333333)
                                  ),
                                )
                              ],
                            ),
                          ),

                          Divider(
                            height: 1,
                            color: Color(0xFFEDEDED),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: MineOrderListDetails(
                              mineOrderListDetails: _mineOrderListDetails,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                _priceWidget('商品合计', '¥187.40'),
                                _priceWidget('包装费', '¥0.00'),
                                _priceWidget('配送费', '¥0.00'),
                                _priceWidget('优惠折扣', '-¥10'),

                                SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '合计:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF333333)
                                      ),
                                    ),

                                    Text(
                                      '¥177.40',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFFFF4457)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'images/me_order_indent.png',
                                        width: 14,
                                        height: 16,
                                        fit: BoxFit.contain,
                                      ),

                                      SizedBox(
                                          width: 6
                                      ),

                                      Text(
                                        '订单消息',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF333333)
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Divider(
                                  height: 1,
                                  color: Color(0xFFEDEDED),
                                ),

                                Container(
                                  margin: EdgeInsets.fromLTRB(12, 18, 16, 18),
                                  child: Column(
                                    children: <Widget>[
                                      _priceWidget('订单编号', '28888145080'),
                                      _priceWidget('下单时间', '2018-12-21  9:40:37')
                                    ],
                                  ),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          Container(
            color: Colors.white,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Color(0xFF9E9E9E),
                          width: 1
                      )
                  ),
                  child: Center(
                    child: Text(
                      '取消订单',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF333333)
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),

                Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDC137),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      '立即支付',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF333333)
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _priceWidget(String title, String price){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF333333)
              ),
            ),
          ),

          Text(
            price,
            style: TextStyle(
                fontSize: 14,
                color: Color(0xFF333333)
            ),
          )
        ],
      ),
    );
  }
}

