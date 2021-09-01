import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';
import 'package:highlight_text/highlight_text.dart';

class InformationOne extends StatelessWidget {
  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Scaffold(
      body: SafeArea(
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: SizedBox(),
        ),
        Expanded(
          flex: 65,
          child: Row(
            children: [
              Expanded(
                flex: 40,
                child: Image.asset(
                  'assets/images/information/haut_doppel.png',
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                flex: 42,
                child: Column(
                  children: [
                    Expanded(
                      flex: 20,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 60,
                      child: paragraph(context),
                    ),
                    Expanded(
                      flex: 20,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 15,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget paragraph(BuildContext context) {


    var boldstyle = TextStyle( // You can set the general style, like a Text()
        fontSize: 24.0,
        fontFamily: 'Open Sans',
        color: Color(0xFF5D584E),
        height: 1.2,
        fontWeight: FontWeight.bold,
    );

    Map<String, HighlightedWord> words = {
       "weißem Hautkrebs": HighlightedWord(
        onTap: () {
          print("\"weißem Hautkrebs\"");
        },
        textStyle: boldstyle,
      ),
      "schwarzem Hautkrebs": HighlightedWord(
        onTap: () {
          print("schwarzem Hautkrebs");
        },
          textStyle: boldstyle,
      ),
      "häufigste Krebsart": HighlightedWord(
        onTap: () {
          print("häufigste Krebsart");
        },
        textStyle: boldstyle,
      ),
    };

    return CustomParagraph(
      title: AppLocalizations.of(context).informationOne_text_one_title,
      text:  AppLocalizations.of(context).informationOne_text_one_content,
      titleSize: 34,
      textSize: 24,
      textScaleFactor: textScaleFactor,
      titleFontColor: Color(0xFF5D584E),
      textFontColor: Color(0xFF5D584E),
      titleFontWeight: FontWeight.w900,
      textHeight: 1.2,
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
      words: words,
    );
  }
}
