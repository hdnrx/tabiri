import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';

class InformationFour extends StatelessWidget {
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
          flex: 15,
          child: SizedBox(),
        ),
        Expanded(
          flex: 6,
          child: Text(
            AppLocalizations.of(context).informationFour_text_title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Text(
            AppLocalizations.of(context).informationFour_A_title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 28,
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
                  flex: 30,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Image.asset('images/ABCDrules/Skinspot_A.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Text(
                    AppLocalizations.of(context).informationFour_A_text,
                    style: TextStyle(
                      color: Colors.black,
                      //fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 28
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: SizedBox(),
                ),
            ],
            )
        ),Expanded(
            flex: 10,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 30,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 10,
                  child: Text(
                    AppLocalizations.of(context).informationFour_A_title,
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
                  flex: 10,
                  child: Text(
                    AppLocalizations.of(context).informationFour_B_title,
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
                  flex: 10,
                  child: Text(
                    AppLocalizations.of(context).informationFour_C_title,
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
                  flex: 10,
                  child: Text(
                    AppLocalizations.of(context).informationFour_D_title,
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
                  flex: 30,
                  child: SizedBox(),
                ),
              ],
            )
        ),

        Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 30,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.asset('images/ABCDrules/Skinspot_A.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.asset('images/ABCDrules/Skinspot_B.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.asset('images/ABCDrules/Skinspot_C.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.asset('images/ABCDrules/Skinspot_D.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: SizedBox(),
                ),
              ],
            )
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
      fontSize: 22,
      fontFamily: 'Open Sans',
      height: 1.5,
      color: Color(0xFF5D584E),
    );
    return CustomRichParagraph(
      title: AppLocalizations.of(context).informationFour_text_title,
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
      textScaleFactor: textScaleFactor,
      titleSize: 34,
      titleFontWeight: FontWeight.w900,
      titleFontColor: Color(0xFF5D584E),
      textSize: 22,
      textHeight: 1.5,
      textFontColor: Color(0xFF5D584E),
      children: <InlineSpan>[

        TextSpan(
            text:
                AppLocalizations.of(context).informationFour_text_title),
      ],
    );
  }
}
