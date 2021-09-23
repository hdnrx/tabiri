import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/calculationModel.dart';
import 'package:tabiri_2/dataManager.dart';
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
      title: AppLocalizations.of(context).result_title,
      dividerLineColor: Color(0xFF418D87),
    );
  }

  /// title according to risk score of calculation model
  String getTitle(BuildContext context, int score) {

    switch (score) {
      case 0:
        return AppLocalizations.of(context).result_veryLow;
      case 1:
        return AppLocalizations.of(context).result_Low;
      case 2:
        return AppLocalizations.of(context).result_medium;
      case 3:
        return AppLocalizations.of(context).result_high;
      case 4:
        return AppLocalizations.of(context).result_veryHigh;
      default:
        return AppLocalizations.of(context).result_none;
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
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 55,
                child: text(context),
              ),
              Expanded(
                flex: 35,
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
      //AppLocalizations.of(context).resultOne_text,
      getPersonalText(context),
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
        return Image.asset('assets/images/Risiko_Ergebnis/RiskResult_low.png');
      case 1:
        return Image.asset('assets/images/Risiko_Ergebnis/RiskResult_moderate.png');
      case 2:
        return Image.asset('assets/images/Risiko_Ergebnis/RiskResult_medium.png');
      case 3:
        return Image.asset('assets/images/Risiko_Ergebnis/RiskResult_high.png');
      case 4:
        return Image.asset('assets/images/Risiko_Ergebnis/RiskResult_veryhigh.png');
      default:
        return Image.asset('assets/images/Risiko_Ergebnis/ErgebnisUnbekannt.svg');
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
            child: SizedBox(),
          // IconButton(
          //   onPressed: handleContinue,
          //   icon: Image.asset('assets/images/result/downButton.png'),
          //   iconSize: 80 * textScaleFactor,
          //   padding: EdgeInsets.fromLTRB(
          //       0, 0, 60 * widthScaleFactor, 60 * heightScaleFactor),
          //   autofocus: true,
          // ),
        ),
      ],
    );
  }

String getPersonalText(context)
{
  String Text = AppLocalizations.of(context).result_intro;
  String sex;
  String age = AppLocalizations.of(context).result_age + DataManager.instance.age.toString()  + AppLocalizations.of(context).result_years;
  String family;
  String sunburn;
  String birthmarks;
  String hair;
  String risk;


  switch (DataManager.instance.gender){
    case 1:
      sex = AppLocalizations.of(context).result_sex_f;
      break;
    case 0:
      sex = AppLocalizations.of(context).result_sex_m;
      break;
    case 2:
      sex = AppLocalizations.of(context).result_sex_x;
      break;
    default:
      sex = AppLocalizations.of(context).result_sex_none;
      break;
  }

  switch (DataManager.instance.familySickness) {
    case 0:
      family = AppLocalizations.of(context).result_melanom;
      break;
    case 1:
      family = AppLocalizations.of(context).result_no_melanom;
      break;
    default:
      family = AppLocalizations.of(context).result_no_answer;
      break;
  }

  switch(DataManager.instance.numberSunburns){
    case 0:
        sunburn = AppLocalizations.of(context).result_sunburn_none;
        break;
    case 1:
      sunburn = AppLocalizations.of(context).result_sunburn_few;
      break;
    case 2:
      sunburn = AppLocalizations.of(context).result_sunburn_some;
      break;
    case 3:
      sunburn = AppLocalizations.of(context).result_sunburn_many;
      break;
    case 4:
      sunburn = AppLocalizations.of(context).result_sunburn_no_answer;
      break;
    default:
      sunburn = AppLocalizations.of(context).result_sunburn_no_answer;
      break;
  }

  switch(DataManager.instance.numberBirthmarks){
    case 0:
      birthmarks = AppLocalizations.of(context).result_birthmarks_none;
      break;
    case 1:
      birthmarks = AppLocalizations.of(context).result_birthmarks_few;
      break;
    case 2:
      birthmarks = AppLocalizations.of(context).result_birthmarks_some;
      break;
    case 3:
      birthmarks = AppLocalizations.of(context).result_birthmarks_many;
      break;
    case 4:
      birthmarks = AppLocalizations.of(context).result_birthmarks_no_answer;
      break;
    default:
      birthmarks = AppLocalizations.of(context).result_birthmarks_no_answer;
      break;
  }


  switch(DataManager.instance.hairColor){
    case 0:
      hair = AppLocalizations.of(context).result_hair_blond;
      break;
    case 1:
      hair = AppLocalizations.of(context).result_hair_red;
      break;
    case 2:
      hair = AppLocalizations.of(context).result_hair_brown;
      break;
    case 3:
      hair = AppLocalizations.of(context).result_hair_dark_brown;
      break;
    case 4:
      hair = AppLocalizations.of(context).result_hair_black;
      break;
    default:
      hair = AppLocalizations.of(context).result_hair_no_answer;
      break;
  }

  switch(CalculationModel.instance.getRiskPlacement()){
    case 0:
      risk = AppLocalizations.of(context).result_veryLow;
      break;
    case 1:
       risk = AppLocalizations.of(context).result_Low;
       break;
    case 2:
      risk = AppLocalizations.of(context).result_medium;
      break;
    case 3:
      risk = AppLocalizations.of(context).result_high;
      break;
    case 4:
      risk = AppLocalizations.of(context).result_veryHigh;;
      break;
    default:
      risk = AppLocalizations.of(context).result_none;
      break;
  }

  String riskStatement =  AppLocalizations.of(context).result_risk_title + risk;

  return Text + sex + age +family + sunburn + birthmarks +hair + riskStatement;

}

}


