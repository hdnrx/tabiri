import 'package:flutter/material.dart';

/// Class for Buttons
/// Changed RaisedButton to ElevatedButton because of deprecation

/// Standard Button with rounded corner
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight textWeight;
  final Function buttonFunction;
  final double textScaleFactor;
  final EdgeInsets padding;
  final Color buttonColor;

  CustomElevatedButton(
      {@required this.text,
      @required this.textSize,
      @required this.buttonFunction,
      this.textScaleFactor = 1.0,
      this.padding = EdgeInsets.zero,
      this.textColor = Colors.black,
      this.textWeight = FontWeight.normal,
      this.buttonColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonFunction,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        primary: buttonColor,
      ),
      child: Padding(
        padding: padding,
        child: FittedBox(
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontWeight: textWeight,
              fontFamily: 'Open Sans',
            ),
          ),
        ),
      ),
    );
  }
}
