import 'package:auth/src/model/fb_user.dart';
import 'package:auth/src/network/network.dart';
import 'package:auth/src/utils/buffer.dart';

class Logic {
  Network _network;

  Logic() {
    _network = Network();
  }

  ///This method requests user info from the network,processes it and keeps in
  ///[FBUser]'s object

  Future<void> getUserFbInfo() async {
    Map user = await _network.getUserFbInfo();
    Buffer.user = FBUser.fromJson(user);
    String photoUrl = user["picture"]["data"]["url"];
    Buffer.currentImage = await _network.getPhotoFromUrl(photoUrl);
  }
}
