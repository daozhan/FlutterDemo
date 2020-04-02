import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';

import 'home_shop_details.dart';

class HomeShop extends StatefulWidget {
  @override
  _HomeShopState createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(PageAnimation(HomeShopDetails()));
      },
      child: Container(
        height: 100,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 11, 15, 11),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  'https://tse4-mm.cn.bing.net/th?id=OIP.LxD3VPpOqRK0XTH5eUu5FQHaFj&w=251&h=188&c=7&o=5&pid=1.7',
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),


              SizedBox(
                width: 10,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 4,
                    ),

                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '嘉瑞菜馆（航空路店）',
                            style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Text(
                            '192m',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 11,
                            )
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    Text(
                        '营业时间：09：00-24：00',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 10,
                        )
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: <Widget>[
                        Image.asset(
                          'images/home_sale_location.png',
                          width: 10,
                          height: 12,
                          fit: BoxFit.fill,
                        ),
                        Text(
                            '南昌市青云谱区昌南工业园航空路8号',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 13,
                            )
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
