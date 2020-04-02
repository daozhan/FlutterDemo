import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/my_behavior.dart';
import 'order_page.dart';


class OrderSpecificaDialog extends StatefulWidget {
  List<ProductInfoBean> productinfolist = new List();
  var index;
  OrderSpecificaDialog({
    Key key,
    @required this.productinfolist,
    @required this.index
  }) : super(key : key);
  @override
  _OrderSpecificaDialogState createState() => _OrderSpecificaDialogState(productinfolist, index);
}

class _OrderSpecificaDialogState extends State<OrderSpecificaDialog> {
  List<ProductInfoBean> _productinfolist = new List();
  List<SpecificaBean> _specificalist = new List();
  List<SpecificaItemBean> _specifica_title_items = new List();
  var index;
  int _totalNum = 1;
  _OrderSpecificaDialogState(var productinfolist, var index){
    this._productinfolist = productinfolist;
    this.index = index;
  }

  @override
  void initState() {
    super.initState();
    _specificalist.addAll(_productinfolist[index].specifica_items);
  }


  @override
  Widget build(BuildContext context) {
    // 点击了加号
    void _addQuantity(){
      setState(() {
        _productinfolist[index].setQuantity(_productinfolist[index].getQuantity() + 1);

        // 合计价格
        _totalNum = 0;

      });
    }

    // 点击了减号
    void _minusQuantity(){
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


    return GestureDetector(
      onTap: (){
        return false;
      },
      child: Container(
        height: 450,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 14, 15, 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              _productinfolist[index].image,
                              width: 90,
                              height: 90,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 14,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),

                              Text(
                                '¥'+_productinfolist[index].price,
                                style: TextStyle(
                                    color: Color(0xFFFF4457),
                                    fontSize: 15
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              Text(
                                '已售'+_productinfolist[index].num,
                                style: TextStyle(
                                    color: Color(0xFF9E9E9E),
                                    fontSize: 12
                                ),
                              )
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'images/order_details_cancel.png',
                            width: 22,
                            height: 22,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),

                    Expanded(
                      child: Container(
                        child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _specificalist.length,
                                  itemBuilder: _getSpecificaList
                              ),
                            )
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                                '购买数量',
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14
                                )
                            ),
                          ),

                          Row(
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
                                _addQuantity();
                              });
                            },
                            child: Image.asset(
                              'images/oder_add.png',
                              width: 23,
                              height: 23,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                height: 50,
                color: Color(0xFFFDC137),
                child: Center(
                  child: Text(
                    '确定',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF21272F)
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSpecificaList(context, specifica_index){

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),

                Text(
                  _specificalist[specifica_index].specifica_title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF333333)
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 2.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                    ),
                    itemCount: _specificalist[specifica_index].specifica_title_items.length,
                    itemBuilder: (context, specificaItem_index){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            for(int i = 0; i < _specificalist[specifica_index].specifica_title_items.length; i++){
                              if(i == specificaItem_index){
                                _specificalist[specifica_index].specifica_title_items[specificaItem_index].setSelect(true);
                              }else{
                                _specificalist[specifica_index].specifica_title_items[specificaItem_index].setSelect(false);
                              }
                            }
                          });
                        },
                        child: Container(
                          width: 65,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Color(_specificalist[specifica_index].specifica_title_items[specificaItem_index].getSelect() ? 0xFFFDC137 : 0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Center(
                            child: Text(
                              _specificalist[specifica_index].specifica_title_items[specificaItem_index].specificaItemTitle,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF333333)
                              ),
                            ),
                          ),
                        ),
                      );

                    }
                ),

                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),

          Divider(
            height: 0.5,
            color: Color(0xFFE7E7E7),
          )
        ],
      ),
    );
  }

  // 选择商品规格
  _selectSpecifica(int index){
    setState(() {
      for(int i = 0; i < _specifica_title_items.length; i++){
        if(i == index){
          _specifica_title_items[i].setSelect(true);
        }else{
          _specifica_title_items[i].setSelect(false);
        }
      }
    });
  }

  // 商品规格列表
  Widget _getSpecificaItemList(context, specificaItem_index){
    return GestureDetector(
      onTap: (){
        setState(() {
          for(int i = 0; i < _specifica_title_items.length; i++){
            if(i == specificaItem_index){
              _specifica_title_items[i].setSelect(true);
            }else{
              _specifica_title_items[i].setSelect(false);
            }
          }
        });
      },
      child: Container(
        width: 65,
        height: 28,
        decoration: BoxDecoration(
            color: Color(_specifica_title_items[specificaItem_index].getSelect() ? 0xFFFDC137 : 0xFFE6E6E6),
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Center(
          child: Text(
            _specifica_title_items[specificaItem_index].specificaItemTitle,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFF333333)
            ),
          ),
        ),
      ),
    );

  }
}
