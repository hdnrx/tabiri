import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../calculationModel.dart';

class ResultTwo extends StatelessWidget {
  final Function handleContinue;
  final Function handleBack;

  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  ResultTwo({this.handleContinue, this.handleBack});
  @override
  Widget build(BuildContext context) {
    heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/result/result_background_two.png'),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(30 * widthScaleFactor,
            30 * widthScaleFactor, 30 * widthScaleFactor, 0),
        child: layout(context),
      ),
    );
  }

  Widget layout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 15,
          child: SizedBox(),
        ),
        Expanded(
          flex: 70,
          child: content(context),
        ),
        Expanded(
          flex: 15,
          child: buttonColumn(),
        ),
      ],
    );
  }

  Widget content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 8,
          child: Text(
            AppLocalizations.of(context).resultTwo_title,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              color: Color(0xFF332E27),
              fontSize: 42,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Expanded(
          flex: 14,
          child: scoreRow(AppLocalizations.of(context).resultTwo_text_one,
              CalculationModel().getGenderPoints()),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Expanded(
          flex: 14,
          child: scoreRow(AppLocalizations.of(context).resultTwo_text_two,
              CalculationModel().getAgePoints()),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Expanded(
          flex: 14,
          child: scoreRow(AppLocalizations.of(context).resultTwo_text_three,
              CalculationModel().getHairPoints()),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Expanded(
          flex: 14,
          child: scoreRow(AppLocalizations.of(context).resultTwo_text_four,
              CalculationModel().getSunburnPoints()),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Expanded(
          flex: 14,
          child: scoreRow(AppLocalizations.of(context).resultTwo_text_five,
              CalculationModel().getBirthmarkPoints()),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Expanded(
          flex: 14,
          child: scoreRow(AppLocalizations.of(context).resultTwo_text_six,
              CalculationModel().getFamilySicknessPoints()),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget scoreRow(String title, int pointCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 35,
          child: Text(
            title,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              color: Color(0xFF332E27),
              fontSize: 34,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Expanded(
          flex: 65,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            children: List.generate(
              pointCount,
              (index) {
                return Container(
                  height: 60 * heightScaleFactor,
                  width: 60 * widthScaleFactor,
                  margin: EdgeInsets.fromLTRB(0, 0, 30 * widthScaleFactor, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC2474B),
                    border: Border.all(
                        color: Color(0xFF821B1E), width: 3 * textScaleFactor),
                  ),
                );
              },
              growable: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 59,
          child: SizedBox(),
        ),
        Flexible(
          flex: 20,
          child: IconButton(
            onPressed: handleBack,
            icon: Image.asset('assets/images/result/upButton.png'),
            iconSize: 80 * textScaleFactor,
            padding: EdgeInsets.fromLTRB(
                0, 0, 60 * widthScaleFactor, 60 * heightScaleFactor),
            autofocus: true,
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Flexible(
          flex: 20,
          child: IconButton(
            onPressed: handleContinue,
            icon: Image.asset('assets/images/result/downButton.png'),
            iconSize: 80 * textScaleFactor,
            padding: EdgeInsets.fromLTRB(
                0, 0, 60 * widthScaleFactor, 60 * heightScaleFactor),
            autofocus: true,
          ),
        ),
      ],
    );
  }
}
