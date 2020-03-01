import 'package:auth/src/network/network.dart';

class Logic{
  Network _network;

  Logic(){
    _network = Network();
  }

  Future<void> getUserFbInfo()async{
    await _network.getUserFbInfo();
  }

}