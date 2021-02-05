import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/pages/protection/prevention/prevention.dart';
import 'package:tabiri_2/pages/protection/screening/screening.dart';
import 'package:tabiri_2/widgets/routes.dart';

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
                    padding: EdgeInsets.fromLTRB(60 * widthScaleFactor,
                        50 * widthScaleFactor, 60 * widthScaleFactor, 0),
                    child: header(),
                  ),
                ),
                Expanded(
                  flex: 75,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        60 * widthScaleFactor, 0, 60 * widthScaleFactor, 0),
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
    return Column(
      children: [
        Expanded(
          flex: 82,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10 * widthScaleFactor),
                  child: InkWell(
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/images/header/menu.png',
                            height: 70 * widthScaleFactor,
                            width: 70 * widthScaleFactor,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            AppLocalizations.of(context).button_home,
                            textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Color(0xFF332E27),
                                fontSize: 24,
                                fontFamily: 'Open Sans'),
                          ),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      PageRouteWithoutTransition(
                        builder: (context) => Home(),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Expanded(
                      flex: 70,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).protectionOne_title,
                          textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Color(0xFF5D584E),
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Open Sans'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10 * widthScaleFactor),
                  child: InkWell(
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/images/header/exit.png',
                            height: 70 * widthScaleFactor,
                            width: 70 * widthScaleFactor,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            AppLocalizations.of(context).button_exit,
                            textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Color(0xFF3E2A1E),
                                fontSize: 24,
                                fontFamily: 'Open Sans'),
                          ),
                        ),
                      ],
                    ),
                    //todo implement exit screen
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Not implemented"),
                        content: Text("coming soon"),
                        actions: [
                          FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Okay"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF578763),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0 * widthScaleFactor, // soften the shadow
                  spreadRadius: 0, //extend the shadow
                  offset: Offset(
                    0, // Horizontal
                    6.0, // Vertical
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF759A67),
        borderRadius: BorderRadius.circular(27.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0 * widthScaleFactor, // soften the shadow
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
            20 * widthScaleFactor,
            40 * heightScaleFactor,
            20 * widthScaleFactor,
            40 * heightScaleFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 75,
              child: paragraph(
                  AppLocalizations.of(context).protectionOne_card_one_title,
                  AppLocalizations.of(context).protectionOne_card_one_content),
            ),
            Expanded(
              flex: 25,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    35 * widthScaleFactor, 0, 35 * widthScaleFactor, 0),
                child: button(
                  AppLocalizations.of(context).protectionOne_card_one_button,
                  () => Navigator.push(
                    context,
                    PageRouteWithTransition(
                      builder: (context) => Screening(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardTwo() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF578763),
        borderRadius: BorderRadius.circular(27.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0 * widthScaleFactor, // soften the shadow
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
            20 * widthScaleFactor,
            40 * heightScaleFactor,
            20 * widthScaleFactor,
            40 * heightScaleFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 75,
              child: paragraph(
                  AppLocalizations.of(context).protectionOne_card_two_title,
                  AppLocalizations.of(context).protectionOne_card_two_content),
            ),
            Expanded(
              flex: 25,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    35 * widthScaleFactor, 0, 35 * widthScaleFactor, 0),
                child: button(
                  AppLocalizations.of(context).protectionOne_card_two_button,
                  () => Navigator.push(
                    context,
                    PageRouteWithTransition(
                      builder: (context) => Prevention(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
            fontSize: 28,
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
}
