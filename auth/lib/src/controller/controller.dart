import 'package:auth/src/logic/logic.dart';
import 'package:flutter/material.dart';

import '../logic/logic.dart';

class Controller {
  Logic _logic;

  Controller() {
    _logic = Logic();
  }

  ///This method adds a new page deleting the previous one.

  navigateAndReplaceTo(String routeName, BuildContext context) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///This method adds a new page saving the previous one.

  navigateTo(String routeName, BuildContext context) {
    Navigator.pushNamed(context, routeName);
  }

  ///This method requests to the [Logic] to get user's FB info.

  Future<void> getUserFbInfo() async {
    await _logic.getUserFbInfo();
  }
}
