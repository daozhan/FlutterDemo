import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jiarui_hotel/home/search_history.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // 搜索内容字数
  bool _searchNum = false;

  List<String> _listData = new List();

  @override
  void initState() {
    super.initState();
    _listData..add('泰山仙草蜜整箱')
      ..add('仙草蜜粉')
      ..add('仙草蜜原料')
      ..add('仙草蜜果冻')
      ..add('仙草蜜饮料')
      ..add('仙草蜜盒装')
      ..add('仙草蜜惠尔康')
      ..add('仙草蜜粉 夏季')
      ..add('仙草蜜整箱');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
              height: 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 18, 0),
                      padding: EdgeInsets.fromLTRB(17, 0, 10, 0),
                      height: 32,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: '请输入关键词搜索',
                                  hintStyle: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 14
                                  ),
                                  border: InputBorder.none
                              ),
                              onChanged: (text){
                                setState(() {
                                  _searchNum = text.length > 0 ? true : false;
                                });
                              },
                            ),
                          ),

                          Offstage(
                            offstage: _searchNum ? false : true,
                            child: Image.asset(
                              'images/order_details_cancel.png',
                              width: 14,
                              height: 14,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Text(
                    _searchNum ? '搜索' : '取消',
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14
                    ),
                  ),

                  SizedBox(
                    width: 16,
                  )
                ],
              ),
            ),

            Container(
              height: 0.5,
              color: Color(0xFFE0E0E0),
            ),

            Expanded(
              child: Stack(
                alignment: FractionalOffset(0, 0),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '热门搜索',
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14
                          ),
                        ),

                        SizedBox(
                          height: 12,
                        ),

                        SearchHistory()

                      ],
                    ),
                  ),

                  Offstage(
                    offstage: _searchNum ? false : true,
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _listData.length,
                          itemBuilder: _getSearchList,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _getSearchList(context, index){
    return Container(
      color: Colors.white,
      height: 45,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),

                Expanded(
                  child: Text(
                    _listData[index],
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14
                    ),
                  ),
                ),

                Image.asset(
                  'images/search_icon.png',
                  width: 14,
                  height: 14,
                  fit: BoxFit.fill,
                ),

                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),

          Divider(
            height: 0.5,
            color: Color(0xFFEDEDED),
          )
        ],
      ),
    );
  }
}
