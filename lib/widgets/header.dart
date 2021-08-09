import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/pages/endScreen.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/widgets/routes.dart';

/// Header with home, exit icons, title and divider line
class StandardHeader extends StatelessWidget {
  final String title;
  final Color dividerLineColor;

  StandardHeader({this.title, this.dividerLineColor});

  @override
  Widget build(BuildContext context) {
    double heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    double widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    double textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Column(
      children: [
        Expanded(
          flex: 87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 15,
                child: Container(
                  width: 100 * widthScaleFactor,
                  height: 100 * heightScaleFactor,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteWithTransition(
                        builder: (context) => Home(),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10 * heightScaleFactor),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Image.asset('assets/images/header/menu.png'),
                          ),
                          Expanded(
                            flex: 35,
                            child: FittedBox(
                              child: Text(
                                AppLocalizations.of(context).button_home,
                                textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Color(0xFF332E27),
                                    fontSize: 22,
                                    fontFamily: 'Open Sans'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex:20,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 70,
                      child: Text(
                        title,
                        textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Color(0xFF5D584E),
                            fontSize: 48,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 15,
                child: Container(
                  width: 100 * widthScaleFactor,
                  height: 100 * heightScaleFactor,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteWithTransition(
                        builder: (context) => EndScreen(),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10 * heightScaleFactor),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Image.asset('assets/images/header/exit.png'),
                          ),
                          Expanded(
                            flex: 35,
                            child: FittedBox(
                              child: Text(
                                AppLocalizations.of(context).button_exit,
                                textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Color(0xFF332E27),
                                    fontSize: 22,
                                    fontFamily: 'Open Sans'),
                              ),
                            ),
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
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 8,
          child: Container(
            decoration: BoxDecoration(
              color: dividerLineColor,
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Header with home and exit icon only
class OnlyIconHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    double widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    double textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Column(
      children: [
        Expanded(
          flex: 87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  width: 100 * widthScaleFactor,
                  height: 100 * heightScaleFactor,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteWithTransition(
                        builder: (context) => Home(),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10 * heightScaleFactor),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Image.asset('assets/images/header/menu.png'),
                          ),
                          Expanded(
                            flex: 35,
                            child: FittedBox(
                              child: Text(
                                AppLocalizations.of(context).button_home,
                                textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Color(0xFF332E27),
                                    fontSize: 22,
                                    fontFamily: 'Open Sans'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 100 * widthScaleFactor,
                  height: 100 * heightScaleFactor,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteWithTransition(
                        builder: (context) => EndScreen(),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10 * heightScaleFactor),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Image.asset('assets/images/header/exit.png'),
                          ),
                          Expanded(
                            flex: 35,
                            child: FittedBox(
                              child: Text(
                                AppLocalizations.of(context).button_exit,
                                textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Color(0xFF332E27),
                                    fontSize: 22,
                                    fontFamily: 'Open Sans'),
                              ),
                            ),
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
          flex: 13,
          child: SizedBox(),
        ),
      ],
    );
  }
}

/// Header with the logos(start- and endscreen)
class LogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    return Column(
      children: [
        Expanded(
          flex: 86,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Image.asset('assets/images/logos/logo_tabiri.png'),
              ),
              Flexible(
                child: Image.asset(
                    'assets/images/logos/logo_hochschule-trier.png'),
              ),
              Flexible(
                child: Image.asset(
                    'assets/images/logos/logo_deutsche-krebshilfe.png'),
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/logos/logo_uni-luebeck.png',
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
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF0E1E35),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0 * heightScaleFactor, // soften the shadow
                  spreadRadius: 0, //extend the shadow
                  offset: Offset(
                    0, // Horizontal
                    6.0 * heightScaleFactor, // Vertical
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Header with home, exit icons, title but shorter divider line for result page
class ResultHeader extends StatelessWidget {
  final String title;
  final Color dividerLineColor;

  ResultHeader({this.title, this.dividerLineColor});

  @override
  Widget build(BuildContext context) {
    double heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    double widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    double textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Column(
      children: [
        Expanded(
          flex: 87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 15,
                child: Container(
                  width: 100 * widthScaleFactor,
                  height: 100 * heightScaleFactor,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteWithTransition(
                        builder: (context) => Home(),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10 * heightScaleFactor),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Image.asset('assets/images/header/menu.png'),
                          ),
                          Expanded(
                            flex: 35,
                            child: FittedBox(
                              child: Text(
                                AppLocalizations.of(context).button_home,
                                textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Color(0xFF332E27),
                                    fontSize: 22,
                                    fontFamily: 'Open Sans'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 70,
                child: Column(
                  children: [
                    Expanded(
                      flex: 92,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Color(0xFF5D584E),
                            fontSize: 42,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: dividerLineColor,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius:
                                  10.0 * widthScaleFactor, // soften the shadow
                              spreadRadius: 0, //extend the shadow
                              offset: Offset(
                                0, // Horizontal
                                6.0, // Vertical
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 15,
                child: Container(
                  width: 100 * widthScaleFactor,
                  height: 100 * heightScaleFactor,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteWithTransition(
                        builder: (context) => EndScreen(),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10 * heightScaleFactor),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Image.asset('assets/images/header/exit.png'),
                          ),
                          Expanded(
                            flex: 35,
                            child: FittedBox(
                              child: Text(
                                AppLocalizations.of(context).button_exit,
                                textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Color(0xFF332E27),
                                    fontSize: 22,
                                    fontFamily: 'Open Sans'),
                              ),
                            ),
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
          flex: 13,
          child: SizedBox(),
        ),
      ],
    );
  }
}
