import 'dart:convert';
import 'package:auth/src/utils/buffer.dart';
import 'package:http/http.dart';

class Network {
  Network();

  Future<Map> getUserFbInfo() async {
    Response graphResponse = await get(
        '''https://graph.facebook.com/v2.12/me?fields=first_name,last_name,
        gender,birthday,location,hometown,email,friends,
        picture.height(500)&access_token=${Buffer.token}''');
    Map user = json.decode(graphResponse.body);
    return user;
  }

  Future<List<int>> getPhotoFromUrl(String photoUrl) async {
    Response response = await get(photoUrl);
    return response.bodyBytes;
  }
}
