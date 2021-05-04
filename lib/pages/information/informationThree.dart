import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';

class InformationThree extends StatelessWidget {
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
                flex: 50,
                child: Image.asset(
                  'assets/images/information/haut_doppel_dark.png',
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                flex: 32,
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 90,
                      child: paragraph(context),
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
    TextStyle highlight = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 28,
      fontFamily: 'Open Sans',
      height: 1.5,
      color: Color(0xFF5D584E),
    );
    return CustomRichParagraph(
      title: AppLocalizations.of(context).informationThree_text_one_title,
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
      textScaleFactor: textScaleFactor,
      titleSize: 34,
      titleFontWeight: FontWeight.w900,
      titleFontColor: Color(0xFF5D584E),
      textSize: 28,
      textHeight: 1.5,
      textFontColor: Color(0xFF5D584E),
      children: <InlineSpan>[
        TextSpan(
            text:
                AppLocalizations.of(context).informationThree_text_one_partOne),
        TextSpan(
            text: AppLocalizations.of(context)
                .informationThree_text_one_highlightOne,
            style: highlight),
        TextSpan(
            text:
                AppLocalizations.of(context).informationThree_text_one_partTwo),
        TextSpan(
            text: AppLocalizations.of(context)
                .informationThree_text_one_highlightTwo,
            style: highlight),
        TextSpan(
            text: AppLocalizations.of(context)
                .informationThree_text_one_partThree),
      ],
    );
  }
}
