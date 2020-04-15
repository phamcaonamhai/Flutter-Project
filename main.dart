import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'registerPage.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'fire_base_auth.dart';
import 'loading_dialog.dart';
import 'msg_dialog.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  _LoginState createState()=> _LoginState();
}

class _LoginState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  var _wronguser = "Tài khoản không hợp lệ";
  var _wrongpass = "Mật khẩu phải trên 6 kí tự";
  var _userInvalid = false;
  var _passInvalid = false;
  var _fireAuth = FireAuth();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
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
                // image.asset
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
                    onPressed: signInButton,
                    child: Text("SIGN IN"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0 , 40),
                  child: RichText(
                    text: TextSpan(
                      text: "New User?",
                      style: TextStyle(
                        color: Colors.grey[400],fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => registerPage()
                                ));
                              },
                              text:" Sigup for a new account",style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                              ),
                        ),
                      ]
                    )
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String pass,Function onSuccess,Function(String) onSignInError ){
    _fireAuth.signIn(email, pass, onSuccess, onSignInError);
  }

  void signInButton() {
    setState(() {

      if( _email.text.length < 6 || !_email.text.contains("@")){
        _userInvalid = true;
      }else{
        _userInvalid = false;
      }

      if(_pass.text.length < 6){
        _passInvalid = true;
      }else{
        _passInvalid = false;
      }

      if(!_userInvalid && !_passInvalid ){

        LoadingDialog.showLoadingDialog(context, "Loading...");

        signIn(_email.text, _pass.text,(){
          LoadingDialog.hideLoadingDialog(context);
          Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        }, (msg){
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, 'Sign-In', msg);
        });


      }

    });
  }
  Widget gotoHome(BuildContext context){
    return HomePage();
  }

  Widget registerPage(){
    return RegisterPage();
  }

  void onToggleShowPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }
}