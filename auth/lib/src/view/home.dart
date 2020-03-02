import 'package:auth/src/controller/controller.dart';
import 'package:auth/src/model/fb_user.dart';
import 'package:auth/src/utils/buffer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller _controller;

  Future<FBUser> _getUserFbInfo() async {
    await _controller.getUserFbInfo();
    return Buffer.user;
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Buffer.colors.primaryColor,
      title: Text("User profile", style: Buffer.textStyles.primaryTextStyle),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app, color: Buffer.colors.white),
          onPressed: () {
            _controller.navigateAndReplaceTo("signIn", context);
          },
        )
      ],
    );
  }

  Widget _nameField() {
    return Container(
      margin: EdgeInsets.only(
          left: Buffer.screenWidth / 20, bottom: Buffer.screenHeight / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${Buffer.user.firstName} ${Buffer.user.lastName}",
              style: Buffer.textStyles.primaryTextStyle),
          Text("${Buffer.user.homeTown}",
              style: Buffer.textStyles.secondaryTextStyle),
        ],
      ),
    );
  }

  Widget _photoAndName() {
    return Container(
      height: Buffer.screenHeight / 4,
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
                height: Buffer.screenHeight / 5,
                width: Buffer.screenHeight / 5,
                margin: EdgeInsets.only(
                    left: Buffer.screenWidth / 20,
                    right: Buffer.screenWidth / 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: MemoryImage(Buffer.currentImage),
                      fit: BoxFit.cover),
                )),
            onTap: () {
              _controller.navigateTo("photo", context);
            },
          ),
          _nameField(),
        ],
      ),
    );
  }

  Widget _informationRow(Icon icon, String text) {
    return Container(
      height: Buffer.screenHeight / 15,
      margin: EdgeInsets.only(left: Buffer.screenWidth / 20),
      child: Row(
        children: <Widget>[
          icon,
          Container(
            margin: EdgeInsets.only(left: Buffer.screenWidth / 20),
            child: Text(
              text == "" ? "Not mentioned" : text,
              style: Buffer.textStyles.secondaryTextStyle,
            ),
          )
        ],
      ),
    );
  }

  Widget _gender() {
    Icon gender = Icon(Icons.person, color: Buffer.colors.white);
    return _informationRow(gender, Buffer.user.gender);
  }

  Widget _birthDay() {
    Icon birthDay = Icon(Icons.date_range, color: Buffer.colors.white);
    return _informationRow(birthDay, Buffer.user.birthDay);
  }

  Widget _location() {
    Icon location = Icon(Icons.location_on, color: Buffer.colors.white);
    return _informationRow(location, Buffer.user.location);
  }

  Widget _email() {
    Icon email = Icon(Icons.email, color: Buffer.colors.white);
    return _informationRow(email, Buffer.user.email);
  }

  Widget _friends() {
    Icon friends = Icon(Icons.people_outline, color: Buffer.colors.white);
    return _informationRow(
        friends, "${Buffer.user.friendsCount} (friends count)");
  }

  Widget _body() {
    return Container(
      color: Buffer.colors.primaryColor,
      child: Column(
        children: <Widget>[
          _photoAndName(),
          _gender(),
          _birthDay(),
          _location(),
          _email(),
          _friends(),
        ],
      ),
    );
  }

  @override
  void initState() {
    _controller = Controller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserFbInfo(),
      builder: (context, AsyncSnapshot<FBUser> snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(Buffer.colors.black)),
          );
        }
        return Scaffold(
          appBar: _appBar(),
          body: _body(),
        );
      },
    );
  }
}
