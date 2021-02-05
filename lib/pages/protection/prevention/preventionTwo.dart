import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreventionTwo extends StatelessWidget {
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
    return Row(
      children: [
        Expanded(
          flex: 45,
          child: Image.asset(
            'assets/images/prevention/prevention_2.png',
            fit: BoxFit.contain,
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
              Expanded(
                flex: 90,
                child: textColumn(context),
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

  Widget textColumn(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 34 * heightScaleFactor),
          child: paragraph(
              AppLocalizations.of(context).preventionTwo_text_one_title,
              AppLocalizations.of(context).preventionTwo_text_one_content),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 34 * heightScaleFactor),
          child: paragraph(
              AppLocalizations.of(context).preventionTwo_text_two_title,
              AppLocalizations.of(context).preventionTwo_text_two_content),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 34 * heightScaleFactor),
          child: paragraph(
              AppLocalizations.of(context).preventionTwo_text_three_title,
              AppLocalizations.of(context).preventionTwo_text_three_content),
        ),
      ],
    );
  }

  Widget paragraph(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10 * heightScaleFactor),
          child: Text(
            title,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFF332E27),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          text,
          textScaleFactor: textScaleFactor,
          style: TextStyle(
            fontSize: 28,
            height: 1.5,
            color: Color(0xFF5D584E),
            fontFamily: 'Open Sans',
          ),
        ),
      ],
    );
  }
}
