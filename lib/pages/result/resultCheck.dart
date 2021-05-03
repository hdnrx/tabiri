import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/pages/result/result.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

import 'noResult.dart';

class ResultCheck extends StatelessWidget {
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
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/images/result/resultCheck_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                60 * widthScaleFactor,
                60 * widthScaleFactor,
                60 * widthScaleFactor,
                60 * widthScaleFactor),
            child: Column(
              children: [
                Flexible(
                  flex: 10,
                  child: header(context),
                ),
                Expanded(
                  flex: 90,
                  child: body(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// only home and exit icon
  Widget header(BuildContext context) {
    return LogoHeader();
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 30,
          child: SizedBox(),
        ),
        Expanded(
          flex: 40,
          child: Row(
            children: [
              Expanded(
                flex: 33,
                child: SizedBox(),
              ),
              Expanded(
                flex: 34,
                child: content(context),
              ),
              Expanded(
                flex: 33,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 30,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 40,
          child: Text(
            AppLocalizations.of(context).resultCheck_text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              color: Color(0xFF332E27),
              fontSize: 34,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 30,
          child: SizedBox(),
        ),
        Expanded(
          flex: 30,
          child: Row(
            children: [
              Expanded(
                flex: 45,
                child: button(
                  AppLocalizations.of(context).resultCheck_button_no,
                  () => handleNoClick(context),
                  Color(0xFF545454),
                ),
              ),
              Expanded(
                flex: 10,
                child: SizedBox(),
              ),
              Expanded(
                flex: 45,
                child: button(
                  AppLocalizations.of(context).resultCheck_button_yes,
                  () => handleYesClick(context),
                  Color(0xFF418D87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget button(String text, Function buttonFunction, Color color) {
    return RaisedButton(
      onPressed: buttonFunction,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            30 * widthScaleFactor,
            15 * heightScaleFactor,
            30 * widthScaleFactor,
            15 * heightScaleFactor),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }

  void handleNoClick(BuildContext context) {
    Navigator.push(
      context,
      PageRouteWithTransition(
        builder: (context) => NoResult(),
      ),
    );
  }

  void handleYesClick(BuildContext context) {
    Navigator.push(
      context,
      PageRouteWithTransition(
        builder: (context) => Result(),
      ),
    );
  }
}
