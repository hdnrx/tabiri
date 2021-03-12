import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabiri_2/pages/avatar/avatarFive.dart';
import 'package:tabiri_2/pages/avatar/avatarFour.dart';
import 'package:tabiri_2/pages/avatar/avatarOne.dart';
import 'package:tabiri_2/pages/avatar/avatarSeven.dart';
import 'package:tabiri_2/pages/avatar/avatarSix.dart';
import 'package:tabiri_2/pages/avatar/avatarThree.dart';
import 'package:tabiri_2/pages/avatar/avatarTwo.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/widgets/routes.dart';

double heightScaleFactor;
double widthScaleFactor;
double textScaleFactor;

class Avatar extends StatefulWidget {
  final pageController = PageController();
  final int numberOfPages = 7;

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;
  int index = 0;

  int value = 12;
  callback(newValue) {
    setState(() {
      value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: 'avatar',
            child: Column(
              children: [
                Expanded(
                  flex: 90,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        60 * widthScaleFactor,
                        60 * widthScaleFactor,
                        60 * widthScaleFactor,
                        60 * widthScaleFactor),
                    child: PageView(
                      controller: widget.pageController,
                      onPageChanged: (index) => setState(() {
                        this.index = index;
                      }),
                      children: [
                        AvatarOne(),
                        AvatarTwo(),
                        AvatarThree(),
                        AvatarFour(),
                        AvatarFive(),
                        AvatarSix(),
                        AvatarSeven(),
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

  Widget footer() {
    return Container(
      color: Color(0xFF295A56),
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
                  activeDotColor: Color(0xFF418D87),
                  strokeWidth: 1.0,
                  dotWidth: 10 * (1 + widthScaleFactor),
                  dotHeight: 10 * (1 + widthScaleFactor),
                  spacing: 18.0,
                ),
              ),
            ),
            // last page has no continue button
            index != 6
                ? Align(
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
                : SizedBox(),
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
    } else {
      Navigator.push(
        context,
        PageRouteWithTransition(
          builder: (context) => Home(),
        ),
      );
    }
  }

  getButtonText(int index) {
    return AppLocalizations.of(context).button_continue;
  }
}
