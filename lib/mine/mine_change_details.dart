import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/my_behavior.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

class MineChangDetailsBean{
  final String title;
  final String time;
  final String price;
  final int type;// 1:增加 2:减少

  MineChangDetailsBean(this.title, this.time, this.price, this.type);
}

class MineChangeDetails extends StatefulWidget {
  @override
  _MineChangeDetailsState createState() => _MineChangeDetailsState();
}

class _MineChangeDetailsState extends State<MineChangeDetails> {
  List<MineChangDetailsBean> _mineChangDetailsList = new List();

  @override
  void initState() {
    super.initState();

    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '20.50', 1)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '20.50', 1)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '20.50', 1)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '20.50', 1)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '20.50', 1)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '20.50', 1)
    );
    _mineChangDetailsList.add(
      MineChangDetailsBean('商品购买', '2017-09-07 09:49', '19.50', 2)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('零钱明细', context),
      body: RefreshIndicator(
        child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xFFF0F0F0),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _mineChangDetailsList.length,
                    itemBuilder: _mineChangDetails
                ),
              ),
            )
        ),
        onRefresh: _onRefresh
      ),
    );
  }

  // 下拉刷新方法,为list重新赋值
  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
      });
    });
  }

  Widget _mineChangDetails(context, index){
    return Container(
      height: 60,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 11,
                      ),

                      Expanded(
                        child: Text(
                          _mineChangDetailsList[index].title,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF333333)
                          ),
                        ),
                      ),

                      Text(
                        _mineChangDetailsList[index].time,
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFB2B2B2)
                        ),
                      ),

                      SizedBox(
                        height: 11,
                      ),
                    ],
                  ),
                ),

                Text(
                  (_mineChangDetailsList[index].type == 1 ? '+' : '-') + _mineChangDetailsList[index].price,
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(_mineChangDetailsList[index].type == 1 ? 0xFFFF971E : 0xFF333333)
                  ),
                ),

                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),

          Divider(
            height: 0.5,
            color: Color(0xFFDBDBDB),
          )
        ],
      ),
    );
  }

}
