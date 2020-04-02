import 'package:flutter/material.dart';
import 'package:jiarui_hotel/widget/app_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int phoneNum = 0;
  int psdNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBarLogin('忘记密码', context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(30, 40, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '您好,',
                style: TextStyle(
                    fontSize: 38,
                    color: Color(0xFF999999)
                ),
              ),

              SizedBox(
                height: 18,
              ),

              Row(
                children: <Widget>[
                  Text(
                    '欢迎来到嘉瑞菜馆，立即  ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF999999)
                    ),
                  ),

                  Text(
                    '注册',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFFFF9E1D)
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 70,
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '请输入手机号',
                ),
                onChanged: (text){
                  setState(() {
                    text.length > 0 ? phoneNum = 1 : phoneNum = 0;
                  });
                },
              ),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '请输入密码',
                ),
                onChanged: (text){
                  setState(() {
                    text.length > 0 ? psdNum = 1 : psdNum = 0;
                  });
                },
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                children: <Widget>[
                  Image.asset(
                    'images/order_affirm_s.png',
                   width: 15,
                   height: 15,
                  ),

                  SizedBox(
                    width: 11,
                  ),

                  Text(
                    '同意',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF999999)
                    ),
                  ),

                  Text(
                    '《嘉瑞菜馆用户服务协议》',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFFF9E1D)
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '验证码登录',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF999999)
                      ),
                    ),
                  ),

                  ClipRRect(
                    child: Container(
                      width: 100,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Color(phoneNum + psdNum == 2 ? 0xFFFBA40B : 0xFFDCDCDC),
                        child: Text(
                          "登录",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  )
                ],
              ),

              SizedBox(
                height: 100,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/share_qq.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),

                  SizedBox(
                    width: 40,
                  ),

                  Image.asset(
                    'images/share_weixin.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
