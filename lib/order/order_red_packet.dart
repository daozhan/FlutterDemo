import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';

import 'order_coupon_center.dart';

class OrderRedPacket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(PageAnimation(OrderCouponCenter()));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: EdgeInsets.fromLTRB(9, 0, 19, 0),
        height: 40,
        decoration: BoxDecoration(
            color: Color(0xFFFEEAED),
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              'images/order_packet.png',
              width: 19,
              height: 19,
              fit: BoxFit.contain,
            ),

            SizedBox(
              width: 6,
            ),

            Expanded(
              child: Text(
                '您有红包还没有领取',
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF333333)
                ),
              ),
            ),
            Text(
              '查看详情>',
              style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFFEF3E44)
              ),
            )
          ],
        ),
      ),
    );
  }
}
