import 'package:flutter/material.dart';
import 'package:jiarui_hotel/home/home_search.dart';
import 'package:jiarui_hotel/utils/my_behavior.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';
import 'package:jiarui_hotel/widget/toast.dart';

import 'order_cart_dialog.dart';
import 'order_red_packet.dart';
import 'order_specifica_dialog.dart';

class CategoriesBean{
  final String title;
  bool isSelect;

  getSelect(){
    return this.isSelect;
  }
  setSelect(bool isSelect){
    this.isSelect = isSelect;
  }

  CategoriesBean(this.title, this.isSelect);
}

// 商品
class ProductInfoBean{
  final String image;
  final String title;
  final String num;
  final String price;
  final List<SpecificaBean> specifica_items;
  final int isSpecifica;
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


  ProductInfoBean(this.image, this.title, this.num, this.price, this.isSpecifica, this.specifica_items);

}

class SpecificaBean{
  final String specifica_title;
  final List<SpecificaItemBean> specifica_title_items;

  SpecificaBean(this.specifica_title, this.specifica_title_items);
}

// 商品规格
class SpecificaItemBean{
  final String specificaItemTitle;
  bool isSelect = false;
  setSelect(bool isSelect){
    this.isSelect = isSelect;
  }

  getSelect(){
    return this.isSelect;
  }

  SpecificaItemBean(this.specificaItemTitle);
}


class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with AutomaticKeepAliveClientMixin{
  List<CategoriesBean> _categorieslist = new List();
  List<ProductInfoBean> _productinfolist = new List();
  List<SpecificaBean> _specificalist = new List();
  List<SpecificaBean> _specificalist2 = new List();
  List<SpecificaItemBean> _specificaItemlist = new List();
  List<SpecificaItemBean> _specificaItemlist2 = new List();
  List<SpecificaItemBean> _specificaItemlist3 = new List();
  // 分类标题
  String _categoriesTitle = '';

  // 合计数量
  int _totalNum = 0;
  double _totalPrice = 0;
  // 显示购物车
  bool _showCart = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _categorieslist.add(CategoriesBean('香肠火腿', true));
    _categorieslist.add(CategoriesBean('根茎类', false));
    _categorieslist.add(CategoriesBean('茄果类', false));
    _categorieslist.add(CategoriesBean('葱姜蒜', false));
    _categorieslist.add(CategoriesBean('豆类', false));
    _categorieslist.add(CategoriesBean('菌类', false));
    _categorieslist.add(CategoriesBean('特菜', false));
    _categorieslist.add(CategoriesBean('豆类', false));
    _categorieslist.add(CategoriesBean('菌类', false));

    _categoriesTitle = _categorieslist[0].title;

    _setDataSausage();

    _specificaItemlist.add(SpecificaItemBean('大份'));
    _specificaItemlist.add(SpecificaItemBean('小份'));
    _specificalist.add(SpecificaBean('分量', _specificaItemlist));

//    _specificaItemlist.clear();
    _specificaItemlist2.add(SpecificaItemBean('超辣'));
    _specificaItemlist2.add(SpecificaItemBean('中辣'));
    _specificaItemlist2.add(SpecificaItemBean('微辣'));

    _specificaItemlist3.add(SpecificaItemBean('超甜'));
    _specificaItemlist3.add(SpecificaItemBean('中甜'));
    _specificaItemlist3.add(SpecificaItemBean('微甜'));

    _specificalist.add(SpecificaBean('辣度', _specificaItemlist2));

    _specificalist2.addAll(_specificalist);

  }

  // 添加香肠数据
  void _setDataSausage(){
    _productinfolist.clear();
    _productinfolist.add(ProductInfoBean(
        'https://tse2-mm.cn.bing.net/th?id=OIP.2_-5YZXp4tjYA6nirrPFsgAAAA&w=155&h=155&c=7&o=5&pid=1.7',
        '德式火腿肠香肠 火腿培根',
        '125',
        '30.56',
        0,
        _specificalist
    ));
    _productinfolist.add(ProductInfoBean(
        'https://tse2-mm.cn.bing.net/th?id=OIP.PHpmuqnDEaGEZpbmbU2jYgHaHa&w=199&h=199&c=7&o=5&pid=1.7',
        '波尼亚熏烤火腿 西式香肠',
        '125',
        '49.50',
        1,
        _specificalist
    ));
    _productinfolist.add(ProductInfoBean(
        'https://tse1-mm.cn.bing.net/th?id=OIP.IpgMEoj-PZTNh5i5dsMkWAAAAA&w=226&h=214&c=7&o=5&pid=1.7',
        '德式火腿肠香肠 火腿培根',
        '125',
        '29.00',
        0,
        _specificalist
    ));
    _productinfolist.add(ProductInfoBean(
        'https://tse3-mm.cn.bing.net/th?id=OIP.m7SemUwF7GVRD_kcwWcLHwHaHa&w=188&h=186&c=7&o=5&pid=1.7',
        '波尼亚熏烤火腿 西式香肠',
        '125',
        '49.00',
        1,
        _specificalist2
    ));
  }
  // 添加数据
  void _setData(ProductInfoBean productBean){
    _productinfolist.clear();
    for(int i = 0; i < 5; i++){
      _productinfolist.add(ProductInfoBean(
          productBean.image,
          productBean.title,
          productBean.num,
          productBean.price,
          productBean.isSpecifica,
          productBean.specifica_items
      ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBarNoBack('点餐', Colors.white, context),
        body: Stack(
          alignment: const FractionalOffset(0, 1),
          children: <Widget>[
            RefreshIndicator(
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: AlignmentDirectional(0, -1),
                        height: double.infinity,
                        margin: EdgeInsets.fromLTRB(0, 45, 0, 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: SingleChildScrollView(
                                child: Container(
                                  width: 85,
                                  color: Colors.green,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: _categorieslist.length,
                                      itemBuilder: _getCategoriesList
                                  ),
                                ),
                              )
                            ),

                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                                    child: ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: SingleChildScrollView(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: _productinfolist.length,
                                            itemBuilder: _getProductInfoList
                                        ),
                                      )
                                    ),
                                  ),

                                  Column(
                                    children: <Widget>[
                                      OrderRedPacket(),

                                      Container(
                                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        color: Colors.white,
                                        height: 30,
                                        child: Align(
                                          alignment: AlignmentDirectional.centerStart,
                                          child: Text(
                                            _categoriesTitle,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF666666)
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                      ),

                      HomeSearch(),
                    ],
                  ),
                ),
                onRefresh: _onRefresh
            ),

            Offstage(
              offstage: _showCart,
              child: Stack(
                alignment: const FractionalOffset(0, 1),
                children: <Widget>[
                  GestureDetector(
                    onTap: _showCartDialog,
                    child: Container(
                      color: Colors.black54.withOpacity(0.5),
                      height: double.infinity,
                    ),
                  ),
                  OrderCartDialog(
                    productinfolist: _productinfolist,
                  )
                ],
              ),
            ),

            Container(
              color: Colors.transparent,
              child:  Stack(
                alignment: const FractionalOffset(0, 1),
                children: <Widget>[
                  Container(
                    height: 70,
                    color: Colors.transparent,
                  ),

                  Container(
                    color: Color(0xFF444444),
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 76,
                        ),

                        Expanded(
                            child: Stack(
                              children: <Widget>[
                                Text(
                                  '暂未选购任何商品~',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF939393)
                                  ),
                                ),
                                Offstage(
                                  offstage: _totalNum == 0 ? true : false,
                                  child: Container(
                                    color: Color(0xFF444444),
                                    height: 50,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 9,
                                        ),

                                        Expanded(
                                          child: Text(
                                            '总计：¥'+_totalPrice.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFFFEFEFE)
                                            ),
                                          )
                                        ),
                                        Expanded(
                                          child: Text(
                                            '（不含运费）',
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Color(0xFF9E9E9E)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),

                        Container(
                          width: 98,
                          color: Color(_totalNum == 0 ? 0xFF575757 : 0xFFFDC137),
                          child: Center(
                            child: Text(
                              '去结算',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(_totalNum == 0 ? 0xFF949494 : 0xFF21272F)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Positioned(
                      left: 16,
                      bottom: 12,
                      child: GestureDetector(
                        onTap: _showCartDialog,
                        child: Container(
                          width: 53,
                          height: 53,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                              color: Color(0xFF444444),
                              borderRadius: BorderRadius.circular(50.0)
                          ),
                          child: Stack(
                            alignment: const FractionalOffset(1, 0),
                            children: <Widget>[
                              Image.asset(
                                _totalNum == 0 ? 'images/order_car_n.png' : 'images/orer_car_s.png',
                                width: 52,
                                height: 52,
                                fit: BoxFit.fill,
                              ),
                              Offstage(
                                offstage: _totalNum == 0 ? true : false,
                                child: Container(
                                  width: 17,
                                  height: 17,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF4457),
                                      borderRadius: BorderRadius.circular(50.0)
                                  ),
                                  child: Center(
                                    child: Text(
                                      _totalNum.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        )
    );

  }

  // 显示购物车
  void _showCartDialog(){
    setState(() {
      if(_totalNum == 0){
        _showCart = true;
      }else{
        _showCart = _showCart ? false : true;
      }
    });
  }

  // 选择规格
  void _selectSpecificaDialog(int index){
    showModalBottomSheet(
      context: context,
      builder: (builder){
        return OrderSpecificaDialog(
          productinfolist: _productinfolist,
          index: index,
        );
      }
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

  // 商品分类布局
  Widget _getCategoriesList(context, index){
    String _categoriesImage;
    String _categoriesNum;
    String _categoriesPrice;
    int _isSpecifica;
    bool _different = true;

    // 选择分类
    _selectCategories(){
      setState(() {
        for(int i = 0; i < _categorieslist.length; i++){
          if(i == index){
            _categorieslist[i].setSelect(true);
            _categoriesTitle = _categorieslist[index].title;
          }else{
            _categorieslist[i].setSelect(false);
          }

          switch(_categorieslist[index].title){
            case '香肠火腿':
              _different = false;
              _setDataSausage();
              break;
            case '根茎类':
              _categoriesImage = 'https://tse2-mm.cn.bing.net/th?id=OIP.uUWizxBQoepXvF_IC3J5eQHaGM&w=247&h=198&c=7&o=5&pid=1.7';
              _categoriesNum = '125';
              _categoriesPrice = '58.40';
              _isSpecifica = 1;
              break;
            case '茄果类':
              _categoriesImage = 'https://tse2-mm.cn.bing.net/th?id=OIP.hm32Ss4CTD4WTxxdNNtrWQHaFd&w=247&h=182&c=7&o=5&pid=1.7';
              _categoriesNum = '125';
              _categoriesPrice = '15.90';
              _isSpecifica = 0;
              break;
            case '葱姜蒜':
              _categoriesImage = 'https://tse2-mm.cn.bing.net/th?id=OIP.IBzNPmqY4_uvr9EZEQzF2QHaHa&w=189&h=188&c=7&o=5&pid=1.7';
              _categoriesNum = '125';
              _categoriesPrice = '23.90';
              _isSpecifica = 1;
              break;
            case '豆类':
              _categoriesImage = 'https://tse2-mm.cn.bing.net/th?id=OIP.3kMiP3Bj6Cs_hVZ6lgv6fAHaFj&w=282&h=209&c=7&o=5&pid=1.7';
              _categoriesNum = '125';
              _categoriesPrice = '95.90';
              break;
            case '菌类':
              _categoriesImage = 'https://tse2-mm.cn.bing.net/th?id=OIP.WhEtxucT5YGtB-SgIYpyswHaE8&w=288&h=192&c=7&o=5&pid=1.7';
              _categoriesNum = '125';
              _categoriesPrice = '76.90';
              _isSpecifica = 0;
              break;
            case '特菜':
              _categoriesImage = 'https://tse4-mm.cn.bing.net/th?id=OIP.bzZqL0BvIfbx4TddLZ5L7QAAAA&w=226&h=169&c=7&o=5&pid=1.7';
              _categoriesNum = '125';
              _categoriesPrice = '61.90';
              _isSpecifica = 1;
              break;
          }

          if(_different){
            _setData(ProductInfoBean(
                _categoriesImage,
                _categorieslist[index].title,
                _categoriesNum,
                _categoriesPrice,
                _isSpecifica,
                _specificalist
            ));
          }

        }
      });
    }

    return GestureDetector(
      onTap: _selectCategories,
      child: Container(
        height: 50,
        width: 85,
        color: Colors.white,
        child: Center(
          child: Text(
            _categorieslist[index].title,
            style: TextStyle(
              fontSize: _categorieslist[index].getSelect() ? 14 : 13,
              color: Color(_categorieslist[index].getSelect() ? 0xFF333333 : 0xFF9E9E9E)
            ),
          ),
        ),
      ),
    );
  }

  // 商品详情布局
  Widget _getProductInfoList(context, index){

    // 点击了加号
    void _addQuantity(){
      setState(() {
        _productinfolist[index].setQuantity(_productinfolist[index].getQuantity() + 1);
        _productinfolist[index].setVisible(false);

        // 合计价格
        _totalNum = 0;
        _totalPrice = 0;
        for(int i = 0; i < _productinfolist.length; i++){
          _totalNum = _totalNum + _productinfolist[i].getQuantity();
          _totalPrice =_totalPrice +  _productinfolist[i].getQuantity()*double.parse(_productinfolist[i].price);
        }

      });
    }

    // 点击了减号
    void _minusQuantity(){
      setState(() {
        if(_productinfolist[index].getQuantity() > 1){
          _productinfolist[index].setQuantity(_productinfolist[index].getQuantity() - 1);
        }else{
          _productinfolist[index].setVisible(true);
          _productinfolist[index].setQuantity(0);
        }

        _totalNum = 0;
        _totalPrice = 0;
        for(int i = 0; i < _productinfolist.length; i++){
          _totalNum = _totalNum + _productinfolist[i].getQuantity();
          _totalPrice =_totalPrice +  _productinfolist[i].getQuantity()*double.parse(_productinfolist[i].price);
        }
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
                  width: 10,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _productinfolist[index].title,
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
                        '已售'+_productinfolist[index].num,
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
                              '¥'+_productinfolist[index].price,
                              style: TextStyle(
                                  color: Color(0xFFFF4457),
                                  fontSize: 15
                              ),
                            ),
                          ),

                          Offstage(
                            offstage: _productinfolist[index].getVisible(),
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
                                  width: 10,
                                ),

                                Text(
                                  _productinfolist[index].getQuantity().toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF333333)
                                  ),
                                ),

                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),

                         Offstage(
                           offstage: _productinfolist[index].isSpecifica == 1 ? true : false,
                           child: GestureDetector(
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
                         ),

                         Offstage(
                           offstage: _productinfolist[index].isSpecifica == 1 ? false : true,
                           child: GestureDetector(
                             onTap: (){
                               setState(() {
                                 _selectSpecificaDialog(index);
                               });
                             },
                             child: Container(
                               width: 54,
                               height: 25,
                               decoration: BoxDecoration(
                                 color: Color(0xFFFDC137),
                                 borderRadius: BorderRadius.circular(25.0)
                               ),
                               child: Center(
                                 child: Text(
                                   '选规格',
                                   style: TextStyle(
                                       fontSize: 13,
                                       color: Color(0xFF333333)
                                   ),
                               ),
                               ),
                             ),
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
