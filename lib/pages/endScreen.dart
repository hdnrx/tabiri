import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/widgets/customButton.dart';
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
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                flex: 30,
                child: SizedBox(),
              ),
              Expanded(
                flex: 40,
                child: paragraph(AppLocalizations.of(context).endScreen_text),
              ),
              Expanded(
                flex: 30,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: button(AppLocalizations.of(context).endScreen_button_again,
              () => handleAgain(context), Colors.white, Colors.black),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: button(AppLocalizations.of(context).button_exit,
              () => handleExit(context), Colors.red, Colors.white),
        ),
      ],
    );
  }

  Widget paragraph(String text) {
    return Text(
      text,
      textScaleFactor: textScaleFactor,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        wordSpacing: 1.02,
        height: 2,
        fontSize: 34,
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget button(String text, Function buttonFunction, Color backgroundColor,
      Color textColor) {
    return CustomElevatedButton(
      text: text,
      textSize: 32,
      textColor: textColor,
      buttonFunction: buttonFunction,
      textScaleFactor: textScaleFactor,
      buttonColor: backgroundColor,
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
