import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/my_behavior.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';

import 'mine_order_details.dart';
import 'mine_order_list_details.dart';

class MineOrderBean {
  final List<MineOrderListBean> mine_order_list;
  final String status;

  MineOrderBean(this.mine_order_list, this.status);
}

class MineOrderListBean {
  final String image;
  final String title;
  final String specifica;
  final String price;
  final String num;

  MineOrderListBean(this.image, this.title, this.specifica, this.price, this.num);
}



class MineOrderList extends StatefulWidget {
  @override
  _MineOrderListState createState() => _MineOrderListState();
}

class _MineOrderListState extends State<MineOrderList> {
  List<MineOrderBean> _mineOrderList = new List();
  List<MineOrderListBean> _mineOrderListData = new List();
  List<MineOrderListBean> _mineOrderListData2 = new List();

  @override
  void initState() {
    super.initState();
    _mineOrderListData.add(MineOrderListBean(
      'https://tse1-mm.cn.bing.net/th?id=OIP.iJx9hK3kbZ2e2u75kfRf-QHaHa&w=198&h=198&c=7&o=5&pid=1.7',
      '越南红心火龙果',
      '常规+加辣',
      '9.90',
      '2'
    ));
    _mineOrderListData.add(MineOrderListBean(
      'https://tse1-mm.cn.bing.net/th?id=OIP.oQ2dU0Td6Ty5ZoXJZg65_AHaF7&w=228&h=182&c=7&o=5&pid=1.7',
      '德国火腿',
      '常规+加辣',
      '19.90',
      '4'
    ));

    _mineOrderListData2.add(MineOrderListBean(
        'https://tse4-mm.cn.bing.net/th?id=OIP.X8i1wgmhHRJQ4RCc0ExoIAHaFz&w=228&h=179&c=7&o=5&pid=1.7',
        '豆类',
        '常规+加辣',
        '19.90',
        '4'
    ));

    for(int i = 0; i < 5; i++){
      if(i == 0){
        _mineOrderList.add(MineOrderBean(
          _mineOrderListData2,
          '待付款',
        ));
      }else{
        _mineOrderList.add(MineOrderBean(
          _mineOrderListData,
          '待付款',
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Container(
              color: Color(0xFFF5F5F5),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _mineOrderList.length,
                itemBuilder: _getMineOrderList,
              ),
            ),
          )
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

  Widget _getMineOrderList(context, _mineOrderListIndex){
    List<MineOrderListBean> _mineOrderListDetails = new List();
    _mineOrderListDetails.clear();
    _mineOrderListDetails.addAll(_mineOrderList[_mineOrderListIndex].mine_order_list);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(PageAnimation(MineOrderDetails(
          mineOrderListDetails: _mineOrderListDetails,
        )));
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: EdgeInsets.fromLTRB(15, 14, 13, 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/order_affirm_shop.png',
                  width: 21,
                  height: 19,
                  fit: BoxFit.contain,
                ),

                SizedBox(
                  width: 12,
                ),

                Expanded(
                  child: Text(
                    '嘉瑞菜馆',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF333333)
                    ),
                  ),
                ),

                Text(
                  _mineOrderList[_mineOrderListIndex].status,
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF333333)
                  ),
                )
              ],
            ),

            SizedBox(
              height: 12,
            ),

            MineOrderListDetails(
              mineOrderListDetails: _mineOrderListDetails,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Color(0xFF9E9E9E),
                      width: 1
                    )
                  ),
                  child: Center(
                    child: Text(
                      '取消订单',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF333333)
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),

                Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDC137),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      '立即支付',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF333333)
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
