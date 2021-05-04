import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';

class PreventionOne extends StatelessWidget {
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
            'assets/images/prevention/prevention_1.png',
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
                flex: 30,
                child: SizedBox(),
              ),
              Expanded(
                flex: 60,
                child: paragraph(
                    AppLocalizations.of(context).preventionOne_text_one_title,
                    AppLocalizations.of(context)
                        .preventionOne_text_one_content),
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
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
      titleFontColor: Color(0xFF332E27),
      textFontColor: Color(0xFF5D584E),
    );
  }
}
