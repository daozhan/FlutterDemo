import 'package:flutter/material.dart';

class HomeCouponBena {
  final String title;
  final String price;
  final String start_time;
  final String end_time;
  final String satisfy_price;

  HomeCouponBena(this.title, this.price, this.start_time, this.end_time, this.satisfy_price);
}

class HomeCouponList extends StatefulWidget {
  @override
  _HomeCouponListState createState() => _HomeCouponListState();
}

class _HomeCouponListState extends State<HomeCouponList> {
  List<HomeCouponBena> _listData = new List();

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < 5; i++){
      _listData.add(HomeCouponBena(
          '百果园青云谱区广州路店...',
          '10',
          '2018.02.03',
          '2018.03.15',
          '100'
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          color: Color(0xFFF5F5F5),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _listData.length,
            itemBuilder: _getHomeCouponList,
          ),
        ),
      ),
      onRefresh: _onRefresh
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

  Widget _getHomeCouponList(context, index){
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child:Container(
            height: 85,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'images/card_bg_white.png',
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),

                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 13,
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '¥'+_listData[index].price,
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Color(0xFFFF4457)
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              Text(
                                '满'+_listData[index].satisfy_price+'元可用',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF333333)
                                ),
                              )
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                _listData[index].title,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF333333)
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              Text(
                                _listData[index].start_time+'-'+_listData[index].end_time,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF999999)
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Image.asset(
                      'images/card_bg_yellow.png',
                      height: double.infinity,
                      width: 89,
                      fit: BoxFit.fill,
                    ),

                    Container(
                      width: 89,
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          '去使用',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF333333)
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
