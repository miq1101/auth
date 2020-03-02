import 'package:auth/src/model/fb_user.dart';
import 'package:auth/src/styles/colors.dart';
import 'package:auth/src/styles/text_styles.dart';

class Buffer {
  static double screenHeight;
  static double screenWidth;
  static AppColors colors;
  static AppTextStyles textStyles;
  static FBUser user;
  static String token;
  static List<String> permissions;
  static List<int> currentImage;

  Buffer() {
    screenHeight = 0.0;
    screenWidth = 0.0;
    colors = AppColors();
    textStyles = AppTextStyles();
    user = FBUser();
    token = "";
    currentImage = List();
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
