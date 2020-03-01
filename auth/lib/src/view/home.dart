import 'package:auth/src/controller/controller.dart';
import 'package:auth/src/model/fb_user.dart';
import 'package:auth/src/utils/buffer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller _controller;

  Future<FBUser> _getUserFbInfo()async{
    print("######################");
    await _controller.getUserFbInfo();
    return Buffer.user;
  }

  @override
  void initState() {
    _controller = Controller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserFbInfo(),
      builder: (context, AsyncSnapshot<FBUser> snapshot) {
        if(snapshot.data == null){
          return Center(
            child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Buffer.colors.black,
                )
            ),
          );
        }
        return Scaffold();
      },
    );
  }
}
