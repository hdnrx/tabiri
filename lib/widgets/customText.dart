import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

/// Collection of Widgets to show Text

/// Standard Paragraph
/// includes Title + Text
/// Needs sufficient space
class CustomParagraph extends StatelessWidget {
  final String title;
  final String text;
  final double textScaleFactor;
  final double titleSize;
  final double textSize;
  final Color titleFontColor;
  final Color textFontColor;
  final FontWeight titleFontWeight;
  final FontWeight textFontWeight;
  final double titleLetterSpacing;
  final double textHeight;
  final Map<String, HighlightedWord> words;

  ///padding between title and text
  final EdgeInsets padding;

  CustomParagraph({
    @required this.title,
    @required this.text,
    this.textScaleFactor = 1.0,
    @required this.titleSize,
    @required this.textSize,
    this.textFontColor = Colors.black,
    this.titleFontColor = Colors.black,
    this.titleFontWeight = FontWeight.normal,
    this.textFontWeight = FontWeight.normal,
    this.titleLetterSpacing = 1.0,
    this.textHeight = 1.0,
    this.padding = const EdgeInsets.only(bottom: 28),
    this.words,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 0,
          child: Padding(
            padding: padding,
            child: Text(
              title,
              textScaleFactor: textScaleFactor,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: titleSize,
                fontFamily: 'Open Sans',
                color: titleFontColor,
                letterSpacing: titleLetterSpacing,
                fontWeight: titleFontWeight,
              ),
            ),
          ),
        ),
        Flexible(
          child: TextHighlight(
            text: this.text,
            words: this.words as LinkedHashMap<String, HighlightedWord>,
            textScaleFactor: textScaleFactor,
            textStyle: TextStyle(
              fontSize: textSize,
              fontFamily: 'Open Sans',
              color: textFontColor,
              height: textHeight,
              fontWeight: textFontWeight,
            ),
          ),
        ),
      ],
    );
  }
}

/// Paragraph for Texts with highlighted words
/// Needs sufficient space
class CustomRichParagraph extends StatelessWidget {
  final String title;
  final double textScaleFactor;
  final double titleSize;
  final double textSize;
  final Color titleFontColor;
  final Color textFontColor;
  final FontWeight titleFontWeight;
  final FontWeight textFontWeight;
  final double titleLetterSpacing;
  final double textHeight;

  ///padding between title and text
  final EdgeInsets padding;

  /// the Text parts, represented as a List<InlineSpan> of Strings
  final List children;

  CustomRichParagraph({
    @required this.children,
    @required this.title,
    this.textScaleFactor = 1.0,
    @required this.titleSize,
    @required this.textSize,
    this.titleFontColor = Colors.black,
    this.textFontColor = Colors.black,
    this.titleFontWeight = FontWeight.normal,
    this.textFontWeight = FontWeight.normal,
    this.titleLetterSpacing = 1.0,
    this.textHeight = 1.0,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 0,
          child: Padding(
            padding: padding,
            child: Text(
              title,
              textScaleFactor: textScaleFactor,
              style: TextStyle(
                fontSize: titleSize,
                fontFamily: 'Open Sans',
                fontWeight: titleFontWeight,
                color: titleFontColor,
              ),
            ),
          ),
        ),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: textSize,
                fontFamily: 'Open Sans',
                height: textHeight,
                color: textFontColor,
              ),
              children: children,
            ),
            textScaleFactor: textScaleFactor,
          ),
        ),
      ],
    );
  }
}
