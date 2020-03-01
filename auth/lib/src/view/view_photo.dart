import 'package:auth/src/utils/buffer.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Buffer.colors.primaryColor,
        height: Buffer.screenHeight,
        width: Buffer.screenWidth,
        child: PhotoView(imageProvider: NetworkImage(Buffer.user.photoUrl,scale: 1.0),
          //minScale: 0.2,
        ),
      ),
    );
  }
}
