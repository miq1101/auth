import 'package:auth/src/utils/buffer.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles();
  TextStyle primaryTextStyle =
      TextStyle(fontSize: 22, color: Buffer.colors.white);
  TextStyle secondaryTextStyle =
      TextStyle(fontSize: 16, color: Buffer.colors.white);
  TextStyle errorTextStyle =
      TextStyle(fontSize: 16, color: Buffer.colors.black);
}
