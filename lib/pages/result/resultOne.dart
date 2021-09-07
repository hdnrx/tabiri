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
      title: getTitle(context, CalculationModel().getRiskPlacement()),
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
      //AppLocalizations.of(context).resultOne_text,
      getPersonalText(),
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

String getPersonalText()
{
  String Text = "Aufgrund Ihrer persönlichen Angaben: ";
  String sex;
  String age = "Alter " + DataManager.instance.age.toString()  + " Jahre, ";
  String family;
  String sunburn;
  String birthmarks;
  String hair;
  String risk;


  switch (DataManager.instance.gender){
    case 0:
      sex = "weibliches Geschlecht, ";
      break;
    case 1:
      sex = "männliches Geschlecht, ";
      break;
    case 2:
      sex = "diverses Geschlecht, ";
      break;
    default:
      sex = "kein Geschlecht angegeben, ";
      break;
  }

  if (DataManager.instance.familySickness == 0)
    family = "kein Melanom in der Familie, ";
  else
    family = "Melanome in der Familie, ";

  switch(DataManager.instance.numberSunburns){
    case 0:
        sunburn = "keine schmerzhaften Sonnenbrände, ";
        break;
    case 1:
      sunburn = "wenige schmerzhafte Sonnenbrände, ";
      break;
    case 2:
      sunburn = "einige schmerzhafte Sonnenbrände, ";
      break;
    case 3:
      sunburn = "viele schmerzhafte Sonnenbrände, ";
      break;
    case 4:
      sunburn = "keine Angabe zu schmerzhaften Sonnenbränden, ";
      break;
    default:
      sunburn = "keine Angabe zu schmerzhaften  Sonnenbränden, ";
      break;
  }

  switch(DataManager.instance.numberBirthmarks){
    case 0:
      birthmarks = "keine Muttermale auf dem linken Arm, ";
      break;
    case 1:
      birthmarks = "wenige Muttermale auf dem linken Arm, ";
      break;
    case 2:
      birthmarks = "einige Muttermale auf dem linken Arm, ";
      break;
    case 3:
      birthmarks = "viele Muttermale auf dem linken Arm, ";
      break;
    case 4:
      birthmarks = "keine Angabe zu Muttermalen auf dem linken Arm, ";
      break;
    default:
      birthmarks = "keine Angabe zu Muttermalen auf dem linken Arm, ";
      break;
  }


  switch(DataManager.instance.hairColor){
    case 0:
      hair = "blonde Haare, ";
      break;
    case 1:
      hair = "orange oder rote Haare, ";
      break;
    case 2:
      hair = "hellbraune Haare, ";
      break;
    case 3:
      hair = "dunkelbraune Haare, ";
      break;
    case 4:
      hair = "schwarze Haare, ";
      break;
    default:
      hair = "keine Angabe zur Haarfarbe, ";
      break;
  }

  switch(CalculationModel.instance.getRiskPlacement()){
    case 1:
      risk = "niedriges ";
      break;
    // case TODO:
    //   risk = "eher niedriges ";
    //   break;
    case 2:
      risk = "moderates ";
      break;
    case 3:
      risk = "erhöhtes ";
      break;
    case 4:
      risk = "deutlisch erhöhtes ";
      break;
    default:
      risk = "auf Grund unzureichender Angaben ein unbestimmtes ";
      break;
  }

  String riskStatement = "haben Sie ein " + risk + "Risiko an schwarzem Hautkrebs zu erkranken.";

  return Text + sex + age +family+sunburn+birthmarks+hair+riskStatement;

}

}


