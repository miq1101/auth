import 'dart:convert';
import 'package:auth/src/utils/buffer.dart';
import 'package:http/http.dart';

class Network {
  String _token;
  Network(){
    _token = Buffer.token;
  }

  ///If the [facebookLoginResult.status] shows logged in,this method gets
  ///the user info from FB

  Future<Map> getUserFbInfo() async {
    Response graphResponse = await get(
        '''https://graph.facebook.com/v2.12/me?fields=first_name,last_name,
        gender,birthday,location,hometown,email,friends,
        picture.height(500)&access_token=$_token''');
    Map user = json.decode(graphResponse.body);
    return user;
  }

  ///This method gets FB profile image via URL.

  Future<List<int>> getPhotoFromUrl(String photoUrl) async {
    Response response = await get(photoUrl);
    return response.bodyBytes;
  }
}
