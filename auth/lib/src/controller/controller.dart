import 'package:auth/src/logic/logic.dart';
import 'package:flutter/material.dart';


class Controller{
  Logic _logic;

  Controller(){
    _logic = Logic();
  }

  navigateTo(String routeName,BuildContext context){
    Navigator.pushNamed(context, routeName);
  }

  Future<void> getUserFbInfo()async{
    await _logic.getUserFbInfo();
  }
}