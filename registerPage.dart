import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp4/loading_dialog.dart';
import 'package:flutterapp4/main.dart';
import 'package:flutterapp4/msg_dialog.dart';
import 'home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'fire_base_auth.dart';

import 'fire_base_auth.dart';
import 'loading_dialog.dart';
import 'msg_dialog.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: RegisterPage(),
    );
  }
}


class RegisterPage extends StatefulWidget{
  @override
  _RegisterPage createState()=> _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  bool _showPass = false;
  TextEditingController _email = new TextEditingController();
  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

  var _wrongemail = "Email không hợp lệ";
  var _wrongphone = "Số điện thoại không hợp lệ";
  var _wronguser = "Tài khoản không hợp lệ";
  var _wrongpass = "Mật khẩu phải trên 6 kí tự";

  var _emailInvalid = false;
  var _userInvalid = false;
  var _passInvalid = false;
  var _phoneInvalid = false;

 var _fireAuth = FireAuth();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30,0,30,20),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
                  child: Container(
                      width: 60,
                      height: 70,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[400],
                      ),
                      child: FlutterLogo()
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text("Welcome To\nFood App",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                    ),),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: _email,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: _emailInvalid ? _wrongemail : null ,
                        labelStyle: TextStyle(color: Colors.grey[400],fontSize: 15,)
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: _phone,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        labelText: 'PHONE',
                        errorText: _phoneInvalid ? _wrongphone : null ,
                        labelStyle: TextStyle(color: Colors.grey[400],fontSize: 15,)
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: _user,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        labelText: 'USERNAME',
                        errorText: _userInvalid ? _wronguser : null ,
                        labelStyle: TextStyle(color: Colors.grey[400],fontSize: 15,)
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextField(
                        controller: _pass,
                        obscureText: !_showPass,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            errorText: _passInvalid ? _wrongpass : null,
                            labelStyle: TextStyle(color: Colors.grey[400],fontSize: 15,)
                        ),
                      ),
                      // padding
                      GestureDetector(
                        onTap: onToggleShowPass,
                        child: Text(
                          _showPass ? "HIDE":"SHOW",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),),
                      )

                    ],
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    color: Colors.blue,
                    onPressed: signUpButton,
                    child: Text("SIGN UP"),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  void signUp(String email, String pass, String phone, String name,Function onSuccess,
      Function(String) onRegisterError){
    _fireAuth.signUp(email, pass, name, phone, onSuccess,onRegisterError);
  }
  void signUpButton() {
    setState(() {

      if(_email.text.length < 6 || !_email.text.contains("@")){
        _emailInvalid = true;
      }else{
        _emailInvalid = false;
      }

      if(_phone.text.length > 0 && _phone.text.length < 8){
        _phoneInvalid = true;
      }else{
        _phoneInvalid = false;
      }

      if( _user.text.length < 6 || _user.text.contains("@")){
        _userInvalid = true;
      }else{
        _userInvalid = false;
      }

      if(_pass.text.length < 6){
        _passInvalid = true;
      }else{
        _passInvalid = false;
      }


      if(!_userInvalid && !_passInvalid && !_phoneInvalid ){

        //loading.. dialog
        LoadingDialog.showLoadingDialog(context, 'Loading...');

        signUp( _email.text ,_pass.text, _phone.text, _user.text,(){
          LoadingDialog.hideLoadingDialog(context);

          Navigator.push(
              context, MaterialPageRoute(builder: gotoLoginPage));

        },(msg){
          //Show msg dialog
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, 'Sign-Up', msg);
        });

      }


    });
  }
  Widget gotoLoginPage(BuildContext context){
    return LoginPage();
  }


  void onToggleShowPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }
}