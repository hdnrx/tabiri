import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/endScreen.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/pages/information/informationFive.dart';
import 'package:tabiri_2/pages/information/informationOne.dart';
import 'package:tabiri_2/pages/information/informationThree.dart';
import 'package:tabiri_2/pages/information/informationTwo.dart';
import 'package:tabiri_2/pages/information/informationFour.dart';
import 'package:tabiri_2/widgets/customButton.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

double heightScaleFactor;
double widthScaleFactor;
double textScaleFactor;

class Information extends StatefulWidget {
  final pageController = PageController();

  final int numberOfPages = 5;

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
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
          child: Hero(
            tag: 'information',
            child: Column(
              children: [
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      30 * widthScaleFactor,
                      30 * widthScaleFactor,
                      30 * widthScaleFactor,
                      0,
                    ),
                    child: header(),
                  ),
                ),
                Expanded(
                  flex: 75,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      30 * widthScaleFactor,
                      0,
                      30 * widthScaleFactor,
                      0,
                    ),
                    child: PageView(
                      controller: widget.pageController,
                      onPageChanged: (index) => setState(() {
                        this.index = index;
                      }),
                      children: [
                        InformationOne(),
                        InformationTwo(),
                        InformationThree(),
                        InformationFour(),
                        InformationFive(),
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
      ),
    );
  }

  Widget header() {
    return StandardHeader(
      title: getTitle(index),
      dividerLineColor: Color(0xFF2D8064),
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context).informationOne_title;
      case 1:
        return AppLocalizations.of(context).informationTwo_title;
      case 2:
        return AppLocalizations.of(context).informationThree_title;
      case 3:
        return AppLocalizations.of(context).informationThree_title;
      case 4:
        return AppLocalizations.of(context).informationThree_title;
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
                  activeDotColor: Color(0xFF3a8e72),
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

            /*//check if one or more buttons are to show
            index == 0 || index == 3
                ? Align(
                    alignment: Alignment.centerRight,
                    child: CustomElevatedButton(
                      textScaleFactor: textScaleFactor,
                      text: getButtonText(index),
                      padding: EdgeInsets.fromLTRB(
                          30 * widthScaleFactor,
                          10 * heightScaleFactor,
                          30 * widthScaleFactor,
                          10 * heightScaleFactor),
                      buttonFunction: () => handleContinue(),
                      textSize: 32,
                    ),
                  )
                :

                //if there are two continue buttons
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        textScaleFactor: textScaleFactor,
                        text: getButtonText(index)[0],
                        padding: EdgeInsets.fromLTRB(
                            30 * widthScaleFactor,
                            10 * heightScaleFactor,
                            30 * widthScaleFactor,
                            10 * heightScaleFactor),
                        buttonFunction: () => handleContinue(),
                        textSize: 32,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 54 * widthScaleFactor),
                        child: CustomElevatedButton(
                          textScaleFactor: textScaleFactor,
                          text: getButtonText(index)[1],
                          padding: EdgeInsets.fromLTRB(
                              30 * widthScaleFactor,
                              10 * heightScaleFactor,
                              30 * widthScaleFactor,
                              10 * heightScaleFactor),
                          buttonFunction: () => handleContinue(),
                          textSize: 32,
                        ),
                      ),
                    ],
                  ),*/
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
        PageRouteWithoutTransition(
          builder: (context) => Home(),
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
    } else if (DataManager().avatarPathComplete &&
        DataManager().protectionPathComplete) {
      DataManager.instance.informationPathComplete = true;
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => EndScreen(),
        ),
      );
    } else {
      DataManager.instance.informationPathComplete = true;
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => Home(),
        ),
      );
    }
  }

  getButtonText(int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context).informationOne_buttonText;
      case 1:
        return AppLocalizations.of(context).informationTwo_buttonText;
      case 2:
        return AppLocalizations.of(context).informationThree_button_two_text;
      case 3:
        return AppLocalizations.of(context).informationThree_button_two_text;
      case 4:
        return AppLocalizations.of(context).informationThree_button_two_text;
      default:
        return "";
    }
  }
}
