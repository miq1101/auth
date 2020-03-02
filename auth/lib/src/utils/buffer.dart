import 'package:auth/src/model/fb_user.dart';
import 'package:auth/src/styles/colors.dart';
import 'package:auth/src/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

///Creating static variables.

class Buffer {
  static double screenHeight;
  static double screenWidth;
  static FacebookLogin facebookLogin;
  static AppColors colors;
  static AppTextStyles textStyles;
  static FBUser user;
  static String token;
  static List<String> permissions;
  static MemoryImage currentImage;

  Buffer() {
    screenHeight = 0.0;
    screenWidth = 0.0;
    facebookLogin = FacebookLogin();
    colors = AppColors();
    textStyles = AppTextStyles();
    user = FBUser();
    token = "";
    permissions = [
      'email',
      'user_friends',
      'user_birthday',
      'user_location',
      'user_hometown',
      'user_gender'
    ];
  }
}
