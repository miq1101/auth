import 'package:auth/src/controller/controller.dart';
import 'package:auth/src/utils/buffer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  GlobalKey _globalKey;
  Animation _animation;
  AnimationController _animationController;
  Controller _controller;
  FacebookLogin _facebookLogin;
  var facebookLoginResult;
  Future<FacebookLoginStatus> facebookLoginStatus() async {
    facebookLoginResult = await _facebookLogin.logIn(Buffer.permissions);
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
                    style: Buffer.textStyles.errorTextStyle),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Close",
                    style: Buffer.textStyles.errorTextStyle,
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
      margin: EdgeInsets.only(bottom: _animation.value),
      child: FlatButton(
        child: Image.asset("assets/facebook.png", color: Buffer.colors.white),
        onPressed: () async {
          FacebookLoginStatus status = await facebookLoginStatus();
          if (status == FacebookLoginStatus.error) {
            _showDialog();
          }
          if (status == FacebookLoginStatus.loggedIn) {
            Buffer.token = facebookLoginResult.accessToken.token;
            _controller.navigateAndReplaceTo("/", context);
          }
        },
      ),
    );
  }

  Widget _body() {
    return Container(
      height: Buffer.screenHeight,
      width: Buffer.screenWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
              height: Buffer.screenHeight / 20,
              margin: EdgeInsets.only(bottom: Buffer.screenHeight / 1.5),
              child: Text(
                "Sign in with facebook",
                style: Buffer.textStyles.primaryTextStyle,
              )),
          _signIn(),
        ],
      ),
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation =
        Tween(begin: Buffer.screenHeight, end: Buffer.screenHeight * 0.45)
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.bounceOut))
              ..addListener(() {
                setState(() {});
              });
    _animationController.forward();
    _facebookLogin = FacebookLogin();
    _controller = Controller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Buffer.colors.primaryColor,
      body: _body(),
    );
  }
}
