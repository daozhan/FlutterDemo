import 'package:flutter/material.dart';
import 'package:jiarui_hotel/widget/toast.dart';

class HomeProductBean{
  final String image;
  final String title;
  final String num;
  final String price;
  int quantity = 0;
  bool visible = true;

  getQuantity(){
    return quantity;
  }

  setQuantity(int quantity){
    this.quantity = quantity;
  }
  getVisible(){
    return visible;
  }

  setVisible(bool visible){
    this.visible = visible;
  }

  HomeProductBean(this.image, this.title, this.num, this.price);
}

class HomeProductList extends StatefulWidget {
  @override
  _HomeProductListState createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList>
    with AutomaticKeepAliveClientMixin{
  List<HomeProductBean> _listData = new List(); //列表要展示的数据

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < 6; i++){
      _listData.add(HomeProductBean(
          'https://tse3-mm.cn.bing.net/th?id=OIP.jlrK7F57ZKlaQKeVUvanIgHaF8&w=218&h=174&c=7&o=5&pid=1.7',
          '豌豆尖 约150g 火锅食材 新鲜蔬菜',
          '136',
          '9.90'
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _listData.length,
      itemBuilder: _getProductList,
    );
  }

  Widget _getProductList(context, index){

    void _addQuantity(){
      setState(() {
        _listData[index].setQuantity(_listData[index].getQuantity() + 1);
        _listData[index].setVisible(false);
        Toast.toast(
          context,
          msg: '点击了加号',
        );
      });
    }

    void _minusQuantity(){
      setState(() {
        if(_listData[index].getQuantity() > 1){
          _listData[index].setQuantity(_listData[index].getQuantity() - 1);
        }else{
          _listData[index].setVisible(true);
          _listData[index].setQuantity(0);
        }

        Toast.toast(
          context,
          msg: '点击了减号',
        );
      });
    }

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    _listData[index].image,
                    width: 90,
                    height: 90,
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
                      Text(
                        _listData[index].title,
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                        SizedBox(
                          height: 12,
                        ),

                      Text(
                        '已售'+_listData[index].num,
                        style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 12
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '¥'+_listData[index].price,
                              style: TextStyle(
                                  color: Color(0xFFFF4457),
                                  fontSize: 15
                              ),
                            ),
                          ),
                          Offstage(
                            offstage: _listData[index].getVisible(),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _minusQuantity();
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
                                  _listData[index].getQuantity().toString(),
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
                          ),

                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _addQuantity();
                              });
                            },
                            child: Image.asset(
                              'images/oder_add.png',
                              width: 23,
                              height: 23,
                            ),
                          ),

                          SizedBox(
                            width: 9,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
              child: Divider(
                height: 1.0,
                indent: 0,
                color: Color(0xFFDEDEDE)
              ),
            )
          ],
        ),
      ),
    );
  }
}
