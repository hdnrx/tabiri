import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreeningFive extends StatelessWidget {
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
        flex: 10,
        child:  SizedBox(),
        ),
        Expanded(
          flex: 20,
          child:  Padding(
            padding: EdgeInsets.only(bottom: 50 * heightScaleFactor),
            child: Text(
              AppLocalizations.of(context).screeningFive_text_one_title,
              textScaleFactor: textScaleFactor,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.normal,
                color: Color(0xFF332E27),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 10,
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
              Expanded(flex: 6, child: SizedBox()),
              Expanded(
                flex: 50,
                child: Column(
                  children: [
                    Expanded(
                      flex: 80,
                      child: textColumn(context),
                    ),
                    Expanded(
                      flex: 20,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 10,
                  child: SizedBox()),
            ],
          ),
        ),
      ],
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
                child: Image.asset('assets/images/screening/doubt.png'),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget textColumn(BuildContext context) {
    return RichText(
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
                  AppLocalizations.of(context).screeningFive_text_one_partOne
              ),
          TextSpan(
              text:
                  AppLocalizations.of(context).screeningFive_text_one_partTwo),
          TextSpan(
              text: AppLocalizations.of(context).screeningFive_text_one_partThree),
          TextSpan(
              text:
                  AppLocalizations.of(context).screeningFive_text_one_partFour),
        ],
      ),
      textScaleFactor: textScaleFactor,
    );
  }




}
