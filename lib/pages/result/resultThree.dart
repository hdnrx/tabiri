import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../calculationModel.dart';

class ResultThree extends StatelessWidget {
  final Function handleContinue;
  final Function handleBack;

  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  ResultThree({this.handleContinue, this.handleBack});
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
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 80,
          child: content(context),
        ),
        Expanded(
          flex: 10,
          child: buttonColumn(),
        ),
      ],
    );
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Expanded(
          flex: 33,
          child: scoreRow(AppLocalizations.of(context).resultThree_title),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        Expanded(
          flex: 25,
          child: Image.asset('assets/images/result/stopSign.png'),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Expanded(
          flex: 15,
          child: paragraph(
              AppLocalizations.of(context).resultThree_text_one_title,
              AppLocalizations.of(context).resultThree_text_one_text),
        ),
        Expanded(
          flex: 20,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget scoreRow(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 15,
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
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 80,
          child: score(),
        ),
      ],
    );
  }

  /// displays the score points
  Widget score() {
    /*
    return ListView.separated(
        itemCount: CalculationModel.resultScore(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 30 * widthScaleFactor,
              height: 30 * heightScaleFactor,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC2474B),
              border: Border.all(
                  color: Color(0xFF821B1E), width: 3 * textScaleFactor),
            ),
          );
        });

     */
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 22,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(CalculationModel().getResultScore(), (index) {
        return Container(
          height: 50 * heightScaleFactor,
          width: 50 * widthScaleFactor,
          margin: EdgeInsets.fromLTRB(
              0, 0, 30 * widthScaleFactor, 30 * widthScaleFactor),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFC2474B),
            border: Border.all(
                color: Color(0xFF821B1E), width: 3 * textScaleFactor),
          ),
        );
      }, growable: false),
    );
  }

  Widget paragraph(String title, String text) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 35,
          child: Text(
            title,
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
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 60,
          child: Row(
            children: [
              Expanded(
                flex: 28,
                child: SizedBox(),
              ),
              Expanded(
                flex: 44,
                child: Text(
                  text,
                  textScaleFactor: textScaleFactor,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF5D584E),
                    fontSize: 28,
                    fontFamily: 'Open Sans',
                    height: 1.57,
                  ),
                ),
              ),
              Expanded(
                flex: 28,
                child: SizedBox(),
              ),
            ],
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
            icon: Image.asset('assets/images/result/continueButton.png'),
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
