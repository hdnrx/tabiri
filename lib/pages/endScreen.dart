import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/widgets/customButton.dart';
import 'package:tabiri_2/widgets/customText.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

class EndScreen extends StatelessWidget {
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
            Expanded(
              flex: 15,
              child: Padding(
                padding: EdgeInsets.fromLTRB(60 * widthScaleFactor,
                    50 * widthScaleFactor, 60 * widthScaleFactor, 0),
                child: header(context),
              ),
            ),
            Expanded(
              flex: 10,
              child: SizedBox(),
            ),
            Expanded(
              flex: 75,
              child: Padding(
                padding: EdgeInsets.fromLTRB(60 * widthScaleFactor, 0,
                    60 * widthScaleFactor, 60 * widthScaleFactor),
                child: content(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return LogoHeader();
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
                  'assets/images/home/placeholder.png',
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
                      child: button("Zurück zum Anfang", () => handleExit(context)),
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
    return CustomParagraph(
      title: AppLocalizations.of(context).endScreen_title,
      text: AppLocalizations.of(context).endScreen_text,
      titleSize: 34,
      textSize: 24,
      textScaleFactor: textScaleFactor,
      titleFontColor: Color(0xFF5D584E),
      textFontColor: Color(0xFF5D584E),
      titleFontWeight: FontWeight.w900,
      textHeight: 1.2,
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
    );
  }

  Widget button(String text, Function buttonFunction) {
    return CustomElevatedButton(
      text: text,
      textSize: 32,
      //textColor: textColor,
      buttonFunction: buttonFunction,
      textScaleFactor: textScaleFactor,
  //    buttonColor: backgroundColor,
      textWeight: FontWeight.w600,
      padding: EdgeInsets.fromLTRB(
          60 * widthScaleFactor,
          15 * heightScaleFactor,
          60 * widthScaleFactor,
          15 * heightScaleFactor),
    );
  }

  /// reset data and go back to title screen
  void handleAgain(BuildContext context) {
    DataManager.instance.reset();
    Navigator.push(
      context,
      PageRouteWithTransition(
        builder: (context) => Home(),
      ),
    );
  }

  /// same as handleAgain
  void handleExit(BuildContext context) {
    DataManager.instance.reset();
    Navigator.push(
      context,
      PageRouteWithTransition(
        builder: (context) => Home(),
      ),
    );
  }
}
