import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customButton.dart';
import 'package:tabiri_2/widgets/routes.dart';

import '../../home.dart';

class ScreeningOne extends StatelessWidget {
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
          flex: 85,
          child: Row(
            children: [
              Expanded(
                flex: 15,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
                child: Column(
                  children: [
                    Expanded(
                      flex: 80,
                      child: picture(),
                    ),
                    Expanded(
                      flex: 20,
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
                flex: 40,
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 70,
                      child: textColumn(context),
                    ),
                    Flexible(
                      flex: 10,
                      child: button(AppLocalizations.of(context).screeningOne_buttonText_ABCD, () => handleABCD(context)),
                    ),
                    Flexible(
                      flex: 10,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),

              Expanded
                (
                  flex: 10,
                  child: SizedBox(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget button(String text, Function buttonFunction) {
    return CustomElevatedButton(
      text: text,
      textSize: 32,
      textColor: Color(0xFF332E27),
      buttonFunction: buttonFunction,
      textScaleFactor: textScaleFactor,
      padding: EdgeInsets.fromLTRB(
          30 * widthScaleFactor,
          10 * heightScaleFactor,
          30 * widthScaleFactor,
          10 * heightScaleFactor),
    );
  }
  Widget buttonPopUp(String text, Function buttonFunction) {
    return RaisedButton(
      color: Color(0xFF295A56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
      onPressed: () => buttonFunction(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            80 * widthScaleFactor,
            10 * heightScaleFactor,
            80 * widthScaleFactor,
            10 * heightScaleFactor),
        child: FittedBox(
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Open Sans',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget picture() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 80,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF759A67),
                      width: 10,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 20,
              child: SizedBox(),
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              flex: 10,
              child: SizedBox(),
            ),
            Expanded(
              flex: 90,
              child: Center(
                child: Image.asset('assets/images/screening/Self_control.png'),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget textColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 50 * heightScaleFactor),
          child: Text(
            AppLocalizations.of(context).screeningOne_text_one_title,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              fontSize: 34,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w900,
              color: Color(0xFF332E27),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40 * heightScaleFactor),
          child: pointOne(context),
        ),
      ],
    );
  }

  Widget pointOne(BuildContext context) {
    TextStyle highlight = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 28,
      fontFamily: 'Open Sans',
      height: 1.70,
      color: Color(0xFF5D584E),
    );
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 28,
          fontFamily: 'Open Sans',
          height: 1.70,
          color: Color(0xFF5D584E),
        ),
        children: [
          TextSpan(
              text:
                  AppLocalizations.of(context).screeningOne_text_one_partOne),
        ],
      ),
      textScaleFactor: textScaleFactor,
    );
  }



void handleABCD(BuildContext context) {

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
              40 * widthScaleFactor,
              100 * heightScaleFactor,
              40 * widthScaleFactor,
              100 * heightScaleFactor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: [
                Expanded(
                  flex: 20,
                  child: SizedBox()
                ),
                Expanded(
                  flex: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 10,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 80,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 10,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 90,
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Open Sans',
                                    height: 1.70,
                                    color: Color(0xFF5D584E),
                                  ),
                                  children: [
                                    TextSpan(
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text:
                                        AppLocalizations.of(context).informationFour_title
                                    ),
                                    TextSpan(
                                        text:
                                        AppLocalizations.of(context).informationFour_A_title),
                                    TextSpan(
                                        text: AppLocalizations.of(context).informationFour_B_title),
                                    TextSpan(
                                        text:
                                        AppLocalizations.of(context).informationFour_C_title),
                                    TextSpan(
                                        text:
                                        AppLocalizations.of(context).informationFour_D_title),
                                  ],
                                ),
                                textScaleFactor: textScaleFactor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: buttonPopUp(
                    AppLocalizations.of(context).avatarOne_popup_button,
                        () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ));


  }

  }

