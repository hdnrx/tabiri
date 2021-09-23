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
import 'package:tabiri_2/widgets/customButton.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

import '../../../dataManager.dart';
import '../../endScreen.dart';

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
    return StandardHeader(
      title: getTitle(index),
      dividerLineColor: Color(0xFF2D8064),
    );
  }

  /// returns title of actual page
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
      color: Color(0xFF759A67),
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
                  spacing: 18.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: button(getButtonText(index), () => handleContinue()),
            )
          ],
        ),
      ),
    );
  }

  Widget button(String text, Function buttonFunction) {
    return CustomElevatedButton(
      text: text,
      textSize: 32,
      textColor: Color(0xFF332E27),
      buttonFunction: buttonFunction,
      textScaleFactor: textScaleFactor,
      padding: EdgeInsets.fromLTRB(
          30 * widthScaleFactor,
          10 * heightScaleFactor,
          30 * widthScaleFactor,
          10 * heightScaleFactor),
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
    } else if (DataManager.instance.preventionPathComplete &&
        DataManager.instance.informationPathComplete &&
        DataManager.instance.avatarPathComplete) {
      DataManager.instance.protectionPathComplete = true;
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => EndScreen(),
        ),
      );
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
        return AppLocalizations.of(context).screeningOne_buttonText;
      case 2:
        return AppLocalizations.of(context).screeningOne_buttonText;
      case 3:
        return AppLocalizations.of(context).screeningOne_buttonText;
      case 4:
        return AppLocalizations.of(context).screeningOne_buttonText;
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
