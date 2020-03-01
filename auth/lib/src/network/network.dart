import 'dart:convert';
import 'package:auth/src/model/fb_user.dart';
import 'package:auth/src/utils/buffer.dart';
import 'package:http/http.dart';

class Network {
  Network();

  Future<void> getUserFbInfo() async {
    var graphResponse = await get(
        'https://graph.facebook.com/v2.12/me?fields=first_name,last_name,gender,birthday,location,hometown,email,friends,picture.height(500)&access_token=${Buffer.token}');

    var user = json.decode(graphResponse.body);
    print(user);
    Buffer.user = FBUser.fromJson(user);
  }
}
