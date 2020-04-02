import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';
import 'package:jiarui_hotel/widget/app_button.dart';

import 'mine_payment_suc.dart';

class MinePaymentMode extends StatefulWidget {
  @override
  _MinePaymentModeState createState() => _MinePaymentModeState();
}

class _MinePaymentModeState extends State<MinePaymentMode> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('支付方式', context),
      body: Container(
        color: Color(0xFFF5F5F5),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '订单金额',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF333333)
                      ),
                    ),
                  ),

                  Text(
                    '¥566',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFF13130)
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 40,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '支付方式',
                style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF999999)
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                setState(() {
                  isSelect = isSelect ? false : true;
                });
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'images/pay_wechat.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(
                      width: 12,
                    ),

                    Expanded(
                      child: Text(
                        '微信支付',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF333333)
                        ),
                      ),
                    ),

                    Image.asset(
                      isSelect ? 'images/order_affirm_right.png' : 'images/order_affirm_n.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(PageAnimation(MinePaymentSuc()));
              },
              child: MyAppButton(
                title: '确认支付',
              ),
            )
          ],
        ),
      ),
    );
  }
}
