import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/my_behavior.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';
import 'package:jiarui_hotel/widget/custom_dialog.dart';

class MineShippingAddressBean{
  final String name;
  final String mobile;
  final String address;
  final bool isDefault;

  MineShippingAddressBean(this.name, this.mobile, this.address, this.isDefault);// 是默认地址

}

class MineShippingAddress extends StatefulWidget {
  @override
  _MineShippingAddressState createState() => _MineShippingAddressState();
}

class _MineShippingAddressState extends State<MineShippingAddress> {
  List<MineShippingAddressBean> _mineShippingAddressList = new List();

  @override
  void initState() {
    super.initState();
    _mineShippingAddressList.add(
      MineShippingAddressBean('彭道展', '17346606574', '江西南昌', true)
    );
    _mineShippingAddressList.add(
      MineShippingAddressBean('彭道展', '17346606574', '江西南昌', false)
    );
    _mineShippingAddressList.add(
      MineShippingAddressBean('彭道展', '17346606574', '江西南昌', false)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('收货地址', context),
      body: RefreshIndicator(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: Container(
            color: Color(0xFFF0F0F0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: _mineShippingAddressList.length,
                      itemBuilder: _getmineShippingAddressList
                  ),
                ),

                Container(
                  height: 50,
                  color: Color(0xFFFDC137),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    '添加新地址',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF333333)
                    ),
                  ),
                )

              ],
            ),
          )
        ),
        onRefresh: _onRefresh
      ),
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

  Widget _getmineShippingAddressList(context, index){
    return Column(
      children: <Widget>[
        Container(
          height: 10,
          color: Color(0xFFF0F0F0),
        ),
        
        Container(
            color: Colors.white,
            height: 125,
            padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _mineShippingAddressList[index].name,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF4F4F4F)
                        ),
                      ),
                    ),

                    Text(
                      _mineShippingAddressList[index].mobile,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF4F4F4F)
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 12,
                ),

                Expanded(
                  child: Text(
                    _mineShippingAddressList[index].address,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF5C5C5C)
                    ),
                  ),
                ),

                Divider(
                  height: 0.5,
                  color: Color(0xFFE4E4E4),
                ),

                SizedBox(
                  height: 13,
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _mineShippingAddressList[index].isDefault ? '[默认地址]' : '设为默认地址',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(_mineShippingAddressList[index].isDefault ? 0xFFFFC131 : 0xFF999999)
                        ),
                      ),
                    ),

                    Image.asset(
                      'images/address_edit.png',
                      width: 17,
                      height: 17,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(
                      width: 5,
                    ),

                    Text(
                      '编辑',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF777777)
                      ),
                    ),

                    SizedBox(
                      width: 34,
                    ),


                    Image.asset(
                      'images/address_delete.png',
                      width: 17,
                      height: 17,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(
                      width: 5,
                    ),

                    GestureDetector(
                      onTap: _showDelectDialog,
                      child: Text(
                        '删除',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF777777)
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
        )
      ],
    );
  }

  Widget _showDelectDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return CustomDialog(
            content: '确定删除收货地址吗？',
          );
        }
    );
  }
}
