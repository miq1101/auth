import 'package:auth/src/controller/controller.dart';
import 'package:auth/src/utils/buffer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Controller _controller;
  FacebookLogin _facebookLogin;
  var facebookLoginResult;
  Future<FacebookLoginStatus> facebookLoginStatus() async {
     facebookLoginResult = await _facebookLogin.logIn([
      'email',
      'user_friends',
      'user_birthday',
      'user_location',
      'user_hometown',
      'user_gender'
    ]);
    return facebookLoginResult.status;
  }

  _showDialog() {
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: Buffer.colors.white,
              content: Container(
                child: Text("Something went wrong",
                    style: TextStyle(fontSize: 16, color: Buffer.colors.black)),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Close",
                    style: TextStyle(fontSize: 14, color: Buffer.colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  Widget _signIn() {
    return Container(
      height: Buffer.screenHeight / 10,
      child: FlatButton(
        child: Image.asset("assets/facebook.png", color: Buffer.colors.white),
        onPressed: () async {
          FacebookLoginStatus status = await facebookLoginStatus();
          if (status == FacebookLoginStatus.error) {
            print(status.toString());
            _showDialog();
          }
          if (status == FacebookLoginStatus.loggedIn) {
            Buffer.token = facebookLoginResult
                .accessToken.token;
            _controller.navigateTo("/", context);
          }
        },
      ),
    );
  }

  Widget _body() {
    return Container(
      height: Buffer.screenHeight,
      width: Buffer.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              height: Buffer.screenHeight / 20,
              child: Text(
                "Sign in with facebook",
                style: TextStyle(fontSize: 18, color: Buffer.colors.white),
              )),
          _signIn(),
        ],
      ),
    );
  }

  @override
  void initState() {
    _facebookLogin = FacebookLogin();
    _controller = Controller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Buffer.screenHeight = MediaQuery.of(context).size.height;
    Buffer.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Buffer.colors.primaryColor,
      body: _body(),
    );
  }
}
