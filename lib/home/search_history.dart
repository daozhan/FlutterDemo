import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  List<String> _historyList = new List();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10, //主轴上子控件的间距
      runSpacing: 10, //交叉轴上子控件之间的间距
      children: HistoryList(), //要显示的子控件集合
    );
  }

  // 搜索历史
  List<Widget> HistoryList() => List.generate(5, (index){
    _historyList.add('红心火龙果');
    _historyList.add('土鸡蛋');
    _historyList.add('牛肉粒');
    _historyList.add('花生油');
    _historyList.add('法式面包');

    return Container(
      padding: EdgeInsets.fromLTRB(11, 8, 11, 7),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Text(
        _historyList[index],
        style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 12
        ),
      ),
    );
  });
}
