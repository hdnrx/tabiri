import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreeningThree extends StatelessWidget {
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
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 95,
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
              Expanded(flex: 5, child: SizedBox()),
              Expanded(
                flex: 40,
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 90,
                      child: textColumn(context),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 10, child: SizedBox()),
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
                child: Image.asset(
                  'assets/images/screening/doctor_1.png',
                ),
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
          padding: EdgeInsets.only(bottom: 40 * heightScaleFactor),
          child: Text(
              AppLocalizations.of(context).screeningThree_text_one_partOne,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Open Sans',
                color: Color(0xFF332E27),
              ),
          ),
        )     ,


      ],
    );
  }
}
