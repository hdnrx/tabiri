import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/pages/protection/prevention/prevention.dart';
import 'package:tabiri_2/pages/protection/screening/screening.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

import '../../dataManager.dart';

class Protection extends StatefulWidget {
  @override
  _ProtectionState createState() => _ProtectionState();
}

class _ProtectionState extends State<Protection> {
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
        child: Center(
          child: Hero(
            tag: 'protection',
            child: Column(
              children: [
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30 * widthScaleFactor,
                        30 * widthScaleFactor, 30 * widthScaleFactor, 0),
                    child: header(),
                  ),
                ),
                Expanded(
                  flex: 75,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        30 * widthScaleFactor, 0, 30 * widthScaleFactor, 0),
                    child: content(),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: footer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return StandardHeader(
      title: AppLocalizations.of(context).protection_title,
      dividerLineColor: Color(0xFF578763),
    );
  }

  Widget footer() {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            30 * widthScaleFactor,
            30 * heightScaleFactor,
            30 * widthScaleFactor,
            30 * heightScaleFactor),
        child: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              PageRouteWithoutTransition(
                builder: (context) => Home(),
              ),
            ),
            child: Text(
              AppLocalizations.of(context).button_back,
              textScaleFactor: textScaleFactor,
              style: TextStyle(
                  fontSize: 34,
                  color: Color(0xFF5D584E),
                  letterSpacing: 1.02,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: SizedBox(),
              ),
              Expanded(
                flex: 60,
                child: Image.asset(
                  'assets/images/protection/doctor_2.png',
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
                child: cardColumn(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cardColumn() {
    return Column(
      children: [
        Expanded(
          flex: 45,
          child: cardOne(),
        ),
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 45,
          child: cardTwo(),
        ),
      ],
    );
  }

  Widget cardOne() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: DataManager.instance.screeningPathComplete
          ? collapsedCard(
              Color(0xFF759A67),
              () => setState(
                () => DataManager.instance.screeningPathComplete = false,
              ),
            )
          : expandedCard(
              Color(0xFF759A67),
              AppLocalizations.of(context).protection_card_one_title,
              AppLocalizations.of(context).protection_card_one_content,
              AppLocalizations.of(context).protection_card_one_button,
              buildRouteFunction(
                Screening(),
              ),
              AppLocalizations.of(context).protection_card_one_actionText,
              () => setState(
                  () => DataManager.instance.screeningPathComplete = true),
              AssetImage(
                  'assets/images/protection/screeningCardBackground.png'),
            ),
    );
  }

  Widget cardTwo() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: DataManager.instance.preventionPathComplete
          ? collapsedCard(
              Color(0xFF578763),
              () => setState(
                () => DataManager.instance.preventionPathComplete = false,
              ),
            )
          : expandedCard(
              Color(0xFF759A67),
              AppLocalizations.of(context).protection_card_two_title,
              AppLocalizations.of(context).protection_card_two_content,
              AppLocalizations.of(context).protection_card_two_button,
              buildRouteFunction(
                Prevention(),
              ),
              AppLocalizations.of(context).protection_card_two_actionText,
              () => setState(
                  () => DataManager.instance.preventionPathComplete = true),
              AssetImage(
                  'assets/images/protection/preventionCardBackground.png'),
            ),
    );
  }

  Widget expandedCard(
      Color color,
      String title,
      String text,
      String buttonText,
      Function buttonRoute,
      String actionText,
      Function actionFunction,
      AssetImage backgroundImage) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF759A67),
        borderRadius: BorderRadius.circular(27.0),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[800],
            blurRadius: 6.0 * widthScaleFactor, // soften the shadow
            spreadRadius: 0, //extend the shadow
            offset: Offset(
              0, // Horizontal
              6.0, // Vertical
            ),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            40 * widthScaleFactor,
            35 * heightScaleFactor,
            35 * widthScaleFactor,
            20 * heightScaleFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 60,
              child: paragraph(
                title,
                text,
              ),
            ),
            Expanded(
              flex: 25,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    35 * widthScaleFactor, 0, 35 * widthScaleFactor, 0),
                child: button(
                  buttonText,
                  buttonRoute,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: SizedBox(),
            ),
            Expanded(
              flex: 10,
              child: Center(
                child: GestureDetector(
                  onTap: actionFunction,
                  child: Text(
                    actionText,
                    textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Open Sans'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget collapsedCard(Color color, Function expandFunction) {
    return Column(
      children: [
        Expanded(
          flex: 90,
          child: SizedBox(),
        ),
        Expanded(
          flex: 10,
          child: GestureDetector(
            onTap: expandFunction,
            child: Column(
              children: [
                Expanded(
                  flex: 60,
                  child: CustomPaint(
                    size: Size(60 * widthScaleFactor, 20 * heightScaleFactor),
                    painter: TrianglePainter(
                      strokeColor: color,
                      strokeWidth: 10,
                      paintingStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 20,
                  child: Container(
                    width: 564 * widthScaleFactor,
                    height: 10 * heightScaleFactor,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(27.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[800],
                          blurRadius: 6 * widthScaleFactor, // soften the shadow
                          spreadRadius: 0, //extend the shadow
                          offset: Offset(
                            0, // Horizontal
                            3, // Vertical
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget paragraph(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
          child: Text(
            title,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          text,
          textScaleFactor: textScaleFactor,
          style: TextStyle(
            fontSize: 27,
            height: 1.5,
            color: Colors.white,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget button(String text, Function buttonFunction) {
    return RaisedButton(
      onPressed: buttonFunction,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
      child: FittedBox(
        child: Text(
          text,
          textScaleFactor: textScaleFactor,
          style: TextStyle(
            color: Color(0xFF5D584E),
            fontSize: 28,
          ),
        ),
      ),
    );
  }

  ///Route builder for button click
  Function buildRouteFunction(Widget destinationWidget) {
    return () => Navigator.push(
          context,
          PageRouteWithTransition(
            builder: (context) => destinationWidget,
          ),
        );
  }
}
