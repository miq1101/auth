import 'package:auth/src/model/fb_user.dart';
import 'package:auth/src/styles/colors.dart';

class Buffer {
  static double screenHeight;
  static double screenWidth;
  static AppColors colors;
  static FBUser user;
  static String token;

  Buffer(){
    screenHeight = 0.0;
    screenWidth = 0.0;
    colors = AppColors();
    user = FBUser();
    token = "";
  }
}