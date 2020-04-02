import 'package:flutter/material.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

import 'mine_list.dart';

class MineWallet extends StatefulWidget {
  @override
  _MineWalletState createState() => _MineWalletState();
}

class _MineWalletState extends State<MineWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('我的钱包', context),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              color: Color(0xFFFFB648),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '余额(元)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                      ),
                    ),

                    SizedBox(
                      height: 28 ,
                    ),

                    Text(
                      '¥1.92',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(
              height: 20,
              color: Color(0xFFF0F0F0),
            ),

            MineList(
              icon: 'images/wallet_icon_charge.png',
              title: '充值',
            ),

            Divider(
              height: 0.5,
              color: Color(0xFFDBDBDB),
            ),
            
            MineList(
              icon: 'images/wallet_icon_detail.png',
              title: '零钱明细',
            ),
          ],
        ),
      ),
    );
  }
}
