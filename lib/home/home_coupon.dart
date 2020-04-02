import 'package:flutter/material.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

import 'home_coupon_list.dart';

class HomeCoupon extends StatefulWidget {
  @override
  _HomeCouponState createState() => _HomeCouponState();
}

class _HomeCouponState extends State<HomeCoupon> with SingleTickerProviderStateMixin {
  var _tabController;
  var tabs = <Tab>[];

  @override
  void initState() {
    super.initState();
    tabs = <Tab>[
      Tab(text: "未使用",),
      Tab(text: "已使用(5)",),
      Tab(text: "已过期(2)",),
    ];
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarTab(
        '优惠券',
        context,
        _tabController,
        tabs,
        0xFFFF4457,
        false
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomeCouponList(),
          HomeCouponList(),
          HomeCouponList()
        ],
      ),
    );
  }
}
