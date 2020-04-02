import 'package:flutter/material.dart';
import 'package:jiarui_hotel/utils/page_animation.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

import 'mine_payment_mode.dart';

class RechargeBean{
  final String money;
  final String gift_money;
  bool isSelect = false;

  getSelect(){
    return this.isSelect;
  }
  setSelect(bool isSelect){
    this.isSelect = isSelect;
  }

  RechargeBean(this.money, this.gift_money);
}


class MineRecharge extends StatefulWidget {
  @override
  _MineRechargeState createState() => _MineRechargeState();
}

class _MineRechargeState extends State<MineRecharge> {
  List<RechargeBean> _rechargeList = new List();

  int _selectNum = 0;
  
  @override
  void initState() {
    super.initState();

    for(int i = 1; i < 7; i++){
      _rechargeList.add(RechargeBean(
          (i * 100).toString(),
          (i * 10).toString()
      ));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('充值', context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(12, 25, 12, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '充值金额:',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF666666)
                ),
              ),

              Container(
                height: 45,
                margin: EdgeInsets.fromLTRB(0, 24, 0, 42),
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '请输入充值金额，最低1元',
                      hintStyle: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 15
                      ),
                      border: InputBorder.none
                  ),
                ),
              ),

              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 19,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1.5
                  ),
                  itemCount: _rechargeList.length,
                  itemBuilder: _getRechargeList
              ),

              GestureDetector(
                onTap: _clickConfirm,
                child: Container(
                  height: 45,
                  margin: EdgeInsets.fromLTRB(0, 46, 0, 0),
                  decoration: BoxDecoration(
                      color: Color(_selectNum > 0 ? 0xFFFDC137 : 0xFFA9A9A9),
                      borderRadius: BorderRadius.circular(22.0)
                  ),
                  child: Center(
                    child: Text(
                      '确定',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(_selectNum > 0 ? 0xFF333333 : 0xFFFFFFFF)
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // 点击确定
  void _clickConfirm(){
    Navigator.of(context).push(PageAnimation(MinePaymentMode()));
  }
  
  Widget _getRechargeList(context, index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectNum = 0;
          for(int i = 0; i < _rechargeList.length; i++){
            if(index == i) {
              if(_rechargeList[i].getSelect()){
                _rechargeList[i].setSelect(false);
              }else{
                _rechargeList[i].setSelect(true);
              }
            }else{
              _rechargeList[i].setSelect(false);
            }
            if(_rechargeList[i].getSelect()){
              _selectNum++;
            }
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
                color: Color(_rechargeList[index].getSelect() ? 0xFFFF971E : 0xFFDCDCDC),
                width: 1
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _rechargeList[index].money + '元',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF333333)
                ),
              ),

              SizedBox(
                height: 5,
              ),

              Text(
                '赠送'+_rechargeList[index].gift_money+'元',
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFF971E)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
