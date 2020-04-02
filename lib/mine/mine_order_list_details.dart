import 'package:flutter/material.dart';

import 'mine_order_list.dart';

class MineOrderListDetails extends StatelessWidget {
  List<MineOrderListBean> mineOrderListDetails = new List();

  MineOrderListDetails({Key key, @required this.mineOrderListDetails}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: mineOrderListDetails.length,
      itemBuilder: (context, _mineOrderListDetailsIndex){
        return Container(
          child: Column(
            children: <Widget>[
              Divider(
                height: 1,
                color: Color(0xFFEDEDED),
              ),

              SizedBox(
                height: 16,
              ),

              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFDEDEDE), width: 0.5),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        mineOrderListDetails[_mineOrderListDetailsIndex].image,
                        width: 70,
                        height: 70,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 17,
                  ),

                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            mineOrderListDetails[_mineOrderListDetailsIndex].title,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF333333)
                            ),
                          ),

                          SizedBox(
                            height: 11,
                          ),

                          Text(
                            mineOrderListDetails[_mineOrderListDetailsIndex].specifica,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF999999)
                            ),
                          ),

                          SizedBox(
                            height: 16,
                          ),


                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '¥'+mineOrderListDetails[_mineOrderListDetailsIndex].price,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFFF4457)
                                  ),
                                ),
                              ),

                              Text(
                                'x'+mineOrderListDetails[_mineOrderListDetailsIndex].num,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF666666)
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                  )

                ],
              ),

              SizedBox(
                height: 24,
              ),
            ],
          ),
        );
      },
    );
  }
}
