import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jiarui_hotel/utils/date_format_base.dart';
import 'package:jiarui_hotel/utils/my_behavior.dart';
import 'package:jiarui_hotel/utils/translations.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:jiarui_hotel/widget/my_refresh.dart';

import 'dart:async';
import 'home_banner.dart';
import 'home_classify_list.dart';
import 'home_product_list.dart';
import 'home_recommend.dart';
import 'home_search.dart';
import 'home_shop.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loadMore = true;
  List list = new List(); //列表要展示的数据

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBarNoBack('嘉瑞菜馆',Colors.white,context),
      body: MyRefresh(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  HomeSearch(),
                  HomeBanner(),
                  HomeClassify(),
                  Container(
                    height: 10,
                    color: Color(0xFFF5F5F5),
                  ),
                  HomeShop(),
                  HomeRecommend(),
                  HomeProductList(),
                ],
              ),
            ),
          ),
        ),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            setState(() {
            });
          });
        },
        loadMore: _loadMore
            ? () async {
          await new Future.delayed(const Duration(seconds: 1), () {
          });
        }
            : null,
      )
    );
  }

  void getHttp()async{
    try{
      FormData formData = new FormData.from({
        "user_id": "3c903bPsBclf3JBeTbQv|jia|GeOpnYH7I95JoO7fIi|jia|2w",
      });
      Response response;
      response = await Dio().post(
          "http://yxg.0791jr.com/app.php?m=App&c=index&a=index",
          data: formData
      );
      return print(response);
    }catch(e){
      return print(e);
    }
  }
}






