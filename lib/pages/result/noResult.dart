import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/pages/result/result.dart';
import 'package:tabiri_2/widgets/customButton.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

import '../../dataManager.dart';
import '../endScreen.dart';
import '../home.dart';

class NoResult extends StatelessWidget {
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
                image: AssetImage(
                    'assets/images/result/result_background_one.png'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                30 * widthScaleFactor,
                30 * widthScaleFactor,
                30 * widthScaleFactor,
                30 * heightScaleFactor),
            child: Column(
              children: [
                Expanded(
                  flex: 15,
                  child: header(context),
                ),
                Expanded(
                  flex: 75,
                  child: layout(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return ResultHeader(
      title: AppLocalizations.of(context).noResult_title,
      dividerLineColor: Color(0xFF418D87),
    );
  }

  Widget layout(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 90,
          child: Row(
            children: [
              Expanded(
                flex: 30,
                child: SizedBox(),
              ),
              Expanded(
                flex: 40,
                child: content(context),
              ),
              Expanded(
                flex: 30,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: buttonRow(context),
        ),
      ],
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
          flex: 25,
          child: paragraph(context),
        ),
        Expanded(
          flex: 55,
          child: Image.asset('assets/images/result/unknownRisk.png'),
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
      color: Color(0xFF3E2A1E),
    );
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 28,
          fontFamily: 'Open Sans',
          height: 1.5,
          color: Color(0xFF3E2A1E),
        ),
        children: [
          TextSpan(text: AppLocalizations.of(context).noResult_text_partOne),
          TextSpan(
              text: AppLocalizations.of(context).noResult_text_highlightOne,
              style: highlight),
          TextSpan(text: AppLocalizations.of(context).noResult_text_partTwo),
        ],
      ),
      textScaleFactor: textScaleFactor,
    );
  }

  Widget buttonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: button(
            AppLocalizations.of(context).noResult_button,
            () => Navigator.push(
              context,
              PageRouteWithTransition(
                builder: (context) => Result(),
              ),
            ),
            Colors.white,
            Color(0xFF332E27),
          ),
        ),
        Flexible(
          child: button(
            AppLocalizations.of(context).button_continue,
            () => handleContinue(context),
            Color(0xFF35736E),
            Colors.white,
          ),
        ),
      ],
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
      padding: EdgeInsets.fromLTRB(
          30 * widthScaleFactor,
          10 * heightScaleFactor,
          30 * widthScaleFactor,
          10 * heightScaleFactor),
    );
    return RaisedButton(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
      onPressed: () => buttonFunction(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            30 * widthScaleFactor,
            10 * heightScaleFactor,
            30 * widthScaleFactor,
            10 * heightScaleFactor),
        child: FittedBox(
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Open Sans',
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  void handleContinue(BuildContext context) {
    /// if user did not play all paths
    if (DataManager().protectionPathComplete == false ||
        DataManager().informationPathComplete == false) {
      DataManager.instance.avatarPathComplete = true;
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => Home(),
        ),
      );
    } else {
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => EndScreen(),
        ),
      );
    }
  }
}
