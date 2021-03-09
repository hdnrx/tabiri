import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AvatarBuilder extends StatelessWidget {
  // 0 - male, 1 - female, 2 - diverse
  final int sex;
  final int age;

  // 0 - blond, orangeRed, lightBrown, darkBrown, black
  final int hairColor;

  final bool portrait;

  AvatarBuilder(
      {@required this.sex,
      @required this.age,
      @required this.hairColor,
      this.portrait = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: avatarPortrait(),
    );
  }

  Widget avatarPortrait() {
    ui.Image img;
    rootBundle.load("assets/images/avatar/test.png").then((bd) {
      Uint8List lst = new Uint8List.view(bd.buffer);
      ui.instantiateImageCodec(lst).then((codec) {
        codec.getNextFrame().then((frameInfo) {
          img = frameInfo.image;
          print("bkImage instantiated: $img");
        });
      });
    });
    print(img);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFF295A56),
          width: 10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: CustomPaint(
        painter: SquarePainter(theImage: img),
      ),
    );
  }
}

class SquarePainter extends CustomPainter {
  final ui.Image theImage;
  SquarePainter({this.theImage});
  @override
  void paint(Canvas canvas, Size size) {
    print(theImage);
    canvas.drawAtlas(
        theImage,
        [
          /* Identity transform */
          RSTransform.fromComponents(
              rotation: 0.0,
              scale: 1.0,
              anchorX: 0.0,
              anchorY: 0.0,
              translateX: 0.0,
              translateY: 0.0)
        ],
        [
          /* A 5x5 source rectangle within the image at position (10, 10) */
          Rect.fromLTWH(10.0, 10.0, 5.0, 5.0)
        ],
        [/* No need for colors */],
        BlendMode.src,
        null /* No need for cullRect */,
        Paint());
  }

  @override
  bool shouldRepaint(SquarePainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(SquarePainter oldDelegate) => false;
}
