import 'package:flutter/material.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

class MinePaymentSuc extends StatefulWidget {
  @override
  _MinePaymentSucState createState() => _MinePaymentSucState();
}

class _MinePaymentSucState extends State<MinePaymentSuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('订单支付成功', context),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.fromLTRB(0, 160, 0, 26),
              child: Image.asset(
                'images/pay_for_sucess.png',
                width: 140,
                height: 93,
                fit: BoxFit.fill,
              ),
            ),

            Text(
              '支付成功',
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF333333)
              ),
            ),

            SizedBox(
              height: 80,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 41,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21.0),
                      border: Border.all(
                          color: Color(0xFFFDC137),
                          width: 1
                      )
                  ),
                  child: Center(
                    child: Text(
                      '继续购物',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFDC137)
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 25,
                ),

                Container(
                  width: 120,
                  height: 41,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21.0),
                      border: Border.all(
                          color: Color(0xFF333333),
                          width: 1
                      )
                  ),
                  child: Center(
                    child: Text(
                      '查看订单',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF333333)
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
