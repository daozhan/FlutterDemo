import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/my_behavior.dart';

import 'order_page.dart';

class OrderCartDialog extends StatefulWidget {
  List<ProductInfoBean> productinfolist = new List();
  OrderCartDialog({
    Key key,
    @required this.productinfolist,
  }) : super(key : key);

  @override
  _OrderCartDialogState createState() => _OrderCartDialogState(productinfolist);
}

class _OrderCartDialogState extends State<OrderCartDialog> {
  List<ProductInfoBean> _productinfolist = new List();

  int _totalNum = 1;

  _OrderCartDialogState(var productinfolist){
    this._productinfolist = productinfolist;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        return false;
      },
      child: Container(
        height: 300,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFDBDBDB),
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))
                  ),
                  height: 40,
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '已选商品',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9E9E9E)
                          ),
                        ),
                      ),

                      Text(
                        '清空购物车',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF9E9E9E)
                        ),
                      )
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _productinfolist.length,
                              itemBuilder: _getCartList
                          ),
                        )
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  // 点击了加号
  void _addQuantity(int index){
    setState(() {
      _productinfolist[index].setQuantity(_productinfolist[index].getQuantity() + 1);

      // 合计价格
      _totalNum = 0;

    });
  }

  // 点击了减号
  void _minusQuantity(int index){
    setState(() {
      if(_productinfolist[index].getQuantity() > 1){
        _productinfolist[index].setQuantity(_productinfolist[index].getQuantity() - 1);
      }else{
        _productinfolist[index].setQuantity(0);
      }

      // 合计价格
      _totalNum = 0;

    });
  }

  Widget _getCartList(context, index){
    return Container(
      height: 68,
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _productinfolist[index].title,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333)
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Text(
                  '¥'+_productinfolist[index].price,
                  style: TextStyle(
                      color: Color(0xFFFF4457),
                      fontSize: 15
                  ),
                ),

                SizedBox(
                  width: 30,
                ),

                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _minusQuantity(index);
                        });
                      },
                      child: Image.asset(
                        'images/order_minus.png',
                        width: 23,
                        height: 23,
                      ),
                    ),

                    SizedBox(
                      width: 16,
                    ),

                    Text(
                      _productinfolist[index].getQuantity().toString(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF333333)
                      ),
                    ),

                    SizedBox(
                      width: 16,
                    )
                  ],
                ),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      _addQuantity(index);
                    });
                  },
                  child: Image.asset(
                    'images/oder_add.png',
                    width: 23,
                    height: 23,
                  ),
                )
              ],
            )
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
