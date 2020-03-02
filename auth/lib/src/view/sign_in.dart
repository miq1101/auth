import 'package:auth/src/controller/controller.dart';
import 'package:auth/src/utils/buffer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {


  Animation _animation;
  AnimationController _animationController;
  Controller _controller;
  var facebookLoginResult;

  ///Gets a status if the user was signed in or not

  Future<FacebookLoginStatus> facebookLoginStatus() async {
    facebookLoginResult = await Buffer.facebookLogin.logIn(Buffer.permissions);
    return facebookLoginResult.status;
  }

  ///Shows this dialog if [facebookLoginStatus] returns error

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

  ///Creates 'sign in' button which depending on the [facebookLoginResult.status]
  ///decides how to continue.

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

  /// The function is being called only once at the beginning and creates
  /// those necessary variables that are going to be used in the [build] method.

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
    _controller = Controller();
    super.initState();
  }

  ///This function is being called when the [context] gets deleted from the
  ///widgets' tree.It disposes or cancels all the controllers.

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  ///Creates the UI.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Buffer.colors.primaryColor,
      body: _body(),
    );
  }
}
