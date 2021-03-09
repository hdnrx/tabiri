import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/pages/protection/prevention/preventionOne.dart';
import 'package:tabiri_2/pages/protection/prevention/preventionTwo.dart';
import 'package:tabiri_2/pages/protection/protection.dart';
import 'package:tabiri_2/widgets/routes.dart';

double heightScaleFactor;
double widthScaleFactor;
double textScaleFactor;

class Prevention extends StatefulWidget {
  final pageController = PageController();

  final int numberOfPages = 2;

  @override
  _PreventionState createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
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
                      PreventionOne(),
                      PreventionTwo(),
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
                        child: getTitleTextWidget(index),
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

  Widget getTitleTextWidget(int index) {
    switch (index) {
      case 0:
        return Text(
          AppLocalizations.of(context).preventionOne_title,
          textScaleFactor: textScaleFactor,
          style: TextStyle(
              color: Color(0xFF5D584E),
              fontSize: 42,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w900,
              letterSpacing: 1.26),
        );
      case 1:
        return Text(
          AppLocalizations.of(context).preventionTwo_title,
          textScaleFactor: textScaleFactor,
          style: TextStyle(
              color: Color(0xFF332E27),
              fontSize: 42,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w900,
              letterSpacing: 1.26),
        );
      default:
        return Text("");
    }
  }

  Widget footer() {
    return Container(
      color: Color(0xFF578763),
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
                  activeDotColor: Color(0xFF99BA8C),
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
    } else if (DataManager.instance.screeningPathComplete) {
      DataManager.instance.protectionPathComplete = true;
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => Home(),
        ),
      );
    } else {
      DataManager.instance.preventionPathComplete = true;
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
        return AppLocalizations.of(context).preventionOne_buttonText;
      case 1:
        if (DataManager.instance.screeningPathComplete)
          return AppLocalizations.of(context).preventionTwo_buttonText_home;
        else
          return AppLocalizations.of(context)
              .preventionTwo_buttonText_protection;
        break;
      default:
        return "";
    }
  }
}
