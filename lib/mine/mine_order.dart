import 'package:flutter/material.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';
import 'mine_order_list.dart';

class MineOrder extends StatefulWidget {
  @override
  _MineOrderState createState() => _MineOrderState();
}

class _MineOrderState extends State<MineOrder> with SingleTickerProviderStateMixin {
  var _tabController;
  var tabs = <Tab>[];

  @override
  void initState() {
    super.initState();
    tabs = <Tab>[
      Tab(text: "全部",),
      Tab(text: "待付款",),
      Tab(text: "待配送",),
      Tab(text: "待收货",),
      Tab(text: "待自提",),
    ];
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarTab(
        '订单详情',
        context,
        _tabController,
        tabs,
        0xFFFFB815,
        true
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MineOrderList(),
          MineOrderList(),
          MineOrderList(),
          MineOrderList(),
          MineOrderList(),
        ],
      ),
    );
  }
}
