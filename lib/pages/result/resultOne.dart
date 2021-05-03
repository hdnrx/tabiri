import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/calculationModel.dart';
import 'package:tabiri_2/widgets/header.dart';

class ResultOne extends StatelessWidget {
  final Function handleContinue;
  final Function handleBack;

  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  ResultOne({this.handleContinue, this.handleBack});

  @override
  Widget build(BuildContext context) {
    heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/result/result_background_one.png'),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(30 * widthScaleFactor,
            30 * widthScaleFactor, 30 * widthScaleFactor, 0),
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
    );
  }

  Widget header(BuildContext context) {
    print(CalculationModel().getRiskPlacement());
    return ResultHeader(
      title: getTitle(context, CalculationModel().getRiskPlacement()),
      dividerLineColor: Color(0xFF418D87),
    );
  }

  /// title according to risk score of calculation model
  String getTitle(BuildContext context, int score) {
    switch (score) {
      case 0:
        return AppLocalizations.of(context).resultOne_title_unknownRisk;
      case 1:
        return AppLocalizations.of(context).resultOne_title_lowRisk;
      case 2:
        return AppLocalizations.of(context).resultOne_title_mediumRisk;
      case 3:
        return AppLocalizations.of(context).resultOne_title_highRisk;
      case 4:
        return AppLocalizations.of(context).resultOne_title_veryHighRisk;
      default:
        return AppLocalizations.of(context).resultOne_title_unknownRisk;
    }
  }

  Widget layout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 30,
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
                flex: 35,
                child: text(context),
              ),
              Expanded(
                flex: 50,
                child: image(CalculationModel().getRiskPlacement()),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 30,
          child: buttonColumn(),
        ),
      ],
    );
  }

  Widget text(BuildContext context) {
    return Text(
      AppLocalizations.of(context).resultOne_text,
      textScaleFactor: textScaleFactor,
      style: TextStyle(
        color: Color(0xFF3E2A1E),
        fontSize: 28,
        fontFamily: 'Open Sans',
      ),
    );
  }

  /// return risk image based on risk score. change according to calculation model
  Widget image(int score) {
    switch (score) {
      case 0:
        return Image.asset('assets/images/result/unknownRisk.png');
      case 1:
        return Image.asset('assets/images/result/lowRisk.png');
      case 2:
        return Image.asset('assets/images/result/mediumRisk.png');
      case 3:
        return Image.asset('assets/images/result/highRisk.png');
      case 4:
        return Image.asset('assets/images/result/veryHighRisk.png');
      default:
        return Image.asset('assets/images/result/unknownRisk.png');
    }
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
        Expanded(
          flex: 20,
          child: SizedBox(),
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
