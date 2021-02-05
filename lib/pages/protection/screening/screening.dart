import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/pages/protection/protection.dart';
import 'package:tabiri_2/pages/protection/screening/screeningFive.dart';
import 'package:tabiri_2/pages/protection/screening/screeningFour.dart';
import 'package:tabiri_2/pages/protection/screening/screeningOne.dart';
import 'package:tabiri_2/pages/protection/screening/screeningSix.dart';
import 'package:tabiri_2/pages/protection/screening/screeningThree.dart';
import 'package:tabiri_2/pages/protection/screening/screeningTwo.dart';
import 'package:tabiri_2/widgets/routes.dart';

import '../../../dataManager.dart';

double heightScaleFactor;
double widthScaleFactor;
double textScaleFactor;

class Screening extends StatefulWidget {
  final pageController = PageController();

  final int numberOfPages = 6;

  @override
  _ScreeningState createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                  child: PageView(
                    controller: widget.pageController,
                    onPageChanged: (index) => setState(() {
                      this.index = index;
                    }),
                    children: [
                      ScreeningOne(),
                      ScreeningTwo(),
                      ScreeningThree(),
                      ScreeningFour(),
                      ScreeningFive(),
                      ScreeningSix(),
                    ],
                  ),
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
                          getTitle(index),
                          textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Color(0xFF5D584E),
                              fontSize: 42,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w900),
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
          flex: 18,
          child: SizedBox(),
        ),
      ],
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context).screeningOne_title;
      case 1:
        return AppLocalizations.of(context).screeningTwo_title;
      case 2:
        return AppLocalizations.of(context).screeningThree_title;
      case 3:
        return AppLocalizations.of(context).screeningFour_title;
      case 4:
        return AppLocalizations.of(context).screeningFive_title;
      case 5:
        return AppLocalizations.of(context).screeningSix_title;
      default:
        return "";
    }
  }

  Widget footer() {
    return Container(
      color: Color(0xFF2B6A55),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            30 * widthScaleFactor,
            30 * heightScaleFactor,
            30 * widthScaleFactor,
            30 * heightScaleFactor),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => handleBack(),
                child: Text(
                  AppLocalizations.of(context).button_back,
                  textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      letterSpacing: 1.02,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: widget.pageController,
                count: widget.numberOfPages,
                onDotClicked: (index) {
                  setState(() {
                    this.index = index;
                  });
                  return widget.pageController.animateToPage(index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                effect: WormEffect(
                  dotColor: Colors.white,
                  activeDotColor: Colors.lime,
                  strokeWidth: 1.0,
                  dotWidth: 10 * (1 + widthScaleFactor),
                  dotHeight: 10 * (1 + widthScaleFactor),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                ),
                onPressed: () => handleContinue(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      30 * widthScaleFactor,
                      10 * heightScaleFactor,
                      30 * widthScaleFactor,
                      10 * heightScaleFactor),
                  child: FittedBox(
                    child: Text(
                      getButtonText(index),
                      textScaleFactor: textScaleFactor,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Open Sans',
                        color: Color(0xFF332E27),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///handle back Button click
  void handleBack() {
    if (index == 0) {
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => Protection(),
        ),
      );
    } else {
      widget.pageController.animateToPage(index - 1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      setState(() {
        index--;
      });
    }
  }

  ///handle continue button click
  void handleContinue() {
    if (index < widget.numberOfPages - 1) {
      widget.pageController.animateToPage(index + 1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      setState(() {
        index++;
      });
    } else if (DataManager.instance.preventionPathComplete) {
      DataManager.instance.protectionPathComplete = true;
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => Home(),
        ),
      );
    } else {
      DataManager.instance.screeningPathComplete = true;
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => Protection(),
        ),
      );
    }
  }

  getButtonText(int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context).screeningOne_buttonText;
      case 1:
        return AppLocalizations.of(context).screeningTwo_buttonText;
      case 2:
        return AppLocalizations.of(context).screeningThree_buttonText;
      case 3:
        return AppLocalizations.of(context).screeningFour_buttonText;
      case 4:
        return AppLocalizations.of(context).screeningFive_buttonText;
      case 5:
        if (DataManager.instance.preventionPathComplete)
          return AppLocalizations.of(context).screeningSix_buttonText_home;
        else
          return AppLocalizations.of(context)
              .screeningSix_buttonText_protection;
        break;
      default:
        return "";
    }
  }
}
