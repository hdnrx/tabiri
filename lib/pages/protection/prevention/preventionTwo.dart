import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';

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
          flex: 35,
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
          flex: 15,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget textColumn(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 30,
          child: paragraph(
              AppLocalizations.of(context).preventionTwo_text_one_title,
              AppLocalizations.of(context).preventionTwo_text_one_content),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Flexible(
          flex: 30,
          child: paragraph(
              AppLocalizations.of(context).preventionTwo_text_two_title,
              AppLocalizations.of(context).preventionTwo_text_two_content),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Flexible(
          flex: 30,
          child: paragraph(
              AppLocalizations.of(context).preventionTwo_text_three_title,
              AppLocalizations.of(context).preventionTwo_text_three_content),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget paragraph(String title, String text) {
    return CustomParagraph(
      title: title,
      text: text,
      titleSize: 28,
      textSize: 28,
      textScaleFactor: textScaleFactor,
      titleFontWeight: FontWeight.w900,
      textHeight: 1.5,
      padding: EdgeInsets.only(bottom: 10 * heightScaleFactor),
      titleFontColor: Color(0xFF332E27),
      textFontColor: Color(0xFF5D584E),
    );
  }
}
