import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';
import 'package:tabiri_2/widgets/header.dart';

class AvatarFour extends StatelessWidget {
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
        child: Column(
          children: [
            Flexible(
              flex: 16,
              child: header(context),
            ),
            Expanded(
              flex: 84,
              child: content(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return StandardHeader(
      title: AppLocalizations.of(context).avatarFour_title,
      dividerLineColor: Color(0xFF418D87),
    );
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 80,
          child: Row(
            children: [
              Expanded(
                flex: 23,
                child: Column(
                  children: [
                    Expanded(
                      flex: 75,
                      child: Image.asset('assets/images/avatar/redhead.png'),
                    ),
                    Expanded(
                      flex: 15,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 35,
                child: Column(
                  children: [
                    Expanded(
                      flex: 75,
                      child: paragraphOne(context),
                    ),
                    Expanded(
                      flex: 15,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
                child: Column(
                  children: [
                    Expanded(
                      flex: 50,
                      child: paragraphTwo(context),
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 45,
                      child: Image.asset('assets/images/avatar/birthmark.png'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget paragraphOne(BuildContext context) {
    TextStyle highlight = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 28,
      fontFamily: 'Open Sans',
      height: 1.5,
      color: Colors.black,
    );
    return CustomRichParagraph(
      title: AppLocalizations.of(context).avatarFour_text_one_title,
      titleSize: 28,
      textScaleFactor: textScaleFactor,
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
      titleFontWeight: FontWeight.w900,
      titleFontColor: Color(0xFF48443C),
      textSize: 28,
      textHeight: 1.5,
      textFontColor: Color(0xFF5D584E),
      children: <InlineSpan>[
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_one_partOne),
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_one_highlightOne,
            style: highlight),
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_one_partTwo),
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_one_highlightTwo,
            style: highlight),
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_one_partThree),
      ],
    );
  }

  Widget paragraphTwo(BuildContext context) {
    TextStyle highlight = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 28,
      fontFamily: 'Open Sans',
      height: 1.5,
      color: Colors.black,
    );
    return CustomRichParagraph(
      title: AppLocalizations.of(context).avatarFour_text_two_title,
      titleSize: 28,
      textScaleFactor: textScaleFactor,
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
      titleFontWeight: FontWeight.w900,
      titleFontColor: Color(0xFF48443C),
      textSize: 28,
      textHeight: 1.5,
      textFontColor: Color(0xFF5D584E),
      children: <InlineSpan>[
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_two_partOne),
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_two_highlightOne,
            style: highlight),
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_two_partTwo),
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_two_highlightTwo,
            style: highlight),
        TextSpan(
            text: AppLocalizations.of(context).avatarFour_text_two_partThree),
      ],
    );
  }
}
