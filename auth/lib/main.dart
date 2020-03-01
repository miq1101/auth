import 'package:auth/src/utils/buffer.dart';
import 'package:auth/src/view/sign_in.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  Buffer();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignIn(),
  ));
}