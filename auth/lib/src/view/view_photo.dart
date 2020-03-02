import 'package:auth/src/utils/buffer.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPhoto extends StatelessWidget {

  ///When clicking on the image in the home page opens it in full screen size.
  ///It also zooms in and out

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Buffer.colors.primaryColor,
        height: Buffer.screenHeight,
        width: Buffer.screenWidth,
        child: PhotoView(imageProvider: MemoryImage(Buffer.currentImage)),
      ),
    );
  }
}
