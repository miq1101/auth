import 'dart:ui';
import 'package:auth/src/utils/buffer.dart';
import 'package:auth/src/view/home.dart';
import 'package:auth/src/view/sign_in.dart';
import 'package:auth/src/view/view_photo.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  Buffer();
  runApp(Center(child: FbAuth()));
}

class FbAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///Get width and height of the screen to provide responsive UI.
    Buffer.screenHeight = MediaQueryData.fromWindow(window).size.height;
    Buffer.screenWidth = MediaQueryData.fromWindow(window).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "signIn",
      routes: {
        "/": (context) => Home(),
        "signIn": (context) => SignIn(),
        "photo": (context) => ViewPhoto(),
      },
    );
  }
}
