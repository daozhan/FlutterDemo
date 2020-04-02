import 'package:flutter/material.dart';
import 'package:jiarui_hotel/home/home_coupon.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';

import 'mine_change_details.dart';
import 'mine_recharge.dart';
import 'mine_shipping_address.dart';
import 'mine_wallet.dart';

class MineList extends StatefulWidget {
  final String icon;
  final String title;

  const MineList({Key key, this.icon, this.title}) : super(key: key);

  @override
  _MineListState createState() => _MineListState(icon, title);
}

class _MineListState extends State<MineList> {
  final String icon;
  final String title;

  _MineListState(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          switch(title){
            case '我的钱包':
              Navigator.of(context).push(PageAnimation(MineWallet()));
              break;
            case '地址管理':
              Navigator.of(context).push(PageAnimation(MineShippingAddress()));
              break;
            case '我的卡券':
              Navigator.of(context).push(PageAnimation(HomeCoupon()));
              break;
            case '设置':
              break;
            case '充值':
              Navigator.of(context).push(PageAnimation(MineRecharge()));
              break;
            case '零钱明细':
              Navigator.of(context).push(PageAnimation(MineChangeDetails()));
              break;
          }
        });
      },

      child: Container(
        height: 48,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 12,
            ),

            Image.asset(
              icon,
              width: 18,
              height: 18,
            ),

            SizedBox(
              width: 9,
            ),

            Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF333333)
                  ),
                )
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
        ),
      ),
    );
  }
}

