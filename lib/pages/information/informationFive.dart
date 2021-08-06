import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';

class InformationFive extends StatelessWidget {
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 15,
          child: Text(
                  AppLocalizations.of(context).informationFive_text_title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'OpenSans',
                    letterSpacing: 0.5,
                    fontSize: 20,
              ),
          ),
        ),
        Expanded(
            flex: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 20,
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Image.asset('images/ABCDrules/Skinspot_change_different.png',
                      fit: BoxFit.contain,
                      ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Image.asset('images/ABCDrules/Skinspot_change_color.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Image.asset('images/ABCDrules/Skinspot_change_pain.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: SizedBox(),
                ),
              ],
            )
        ),
        Expanded(
          flex: 20,
          child: Row(
            children: [
              Expanded(
                flex: 20,
                child: SizedBox(),
              ),
              Expanded(
                flex: 20,
                child: Text(
                  AppLocalizations.of(context).informationFive_text_1,
                  style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Text(
                  AppLocalizations.of(context).informationFive_text_2,
                  style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Text(
                  AppLocalizations.of(context).informationFive_text_3,
                  style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: SizedBox(),
              ),
            ],
          )
        ),
        Expanded(
          flex: 10,
          child: Text(
            AppLocalizations.of(context).informationFive_text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget paragraph(BuildContext context) {
    return CustomRichParagraph(
      title: AppLocalizations.of(context).informationFive_text_title,
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
      textScaleFactor: textScaleFactor,
      titleSize: 34,
      titleFontWeight: FontWeight.w900,
      titleFontColor: Color(0xFF5D584E),
      textSize: 24,
      textHeight: 1.5,
      textFontColor: Color(0xFF5D584E),
      children: <InlineSpan>[
        TextSpan(
            text:
                AppLocalizations.of(context).informationFive_text),
      ],
    );
  }
}
