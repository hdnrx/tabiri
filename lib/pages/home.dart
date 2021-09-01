 import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/protection/protection.dart';
import 'package:tabiri_2/widgets/customButton.dart';
import 'package:tabiri_2/widgets/customText.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

import 'avatar/avatar.dart';
import 'information/information.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              flex: 10,
              child: SizedBox(),
            ),
            Expanded(
              flex: 75,
              child: Padding(
                padding: EdgeInsets.fromLTRB(60 * widthScaleFactor, 0,
                    60 * widthScaleFactor, 60 * widthScaleFactor),
                child: content(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return LogoHeader();
  }

  Widget content(BuildContext context) {
    return Stack(
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: cardOne(),
        ),
        Align(
          alignment: Alignment.center,
          child: cardTwo(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: cardThree(),
        ),
        appointmentWidget(),
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
      child: DataManager.instance.informationPathComplete
          ? collapsedCard(
              Color(0xFF2D8064),
              () => setState(
                () => DataManager.instance.informationPathComplete = false,
              ),
            )
          : expandedCard(
              'information',
              Color(0xFF2D8064),
              Image.asset('assets/images/home/information.png'),
              AppLocalizations.of(context).home_card_one_title,
              AppLocalizations.of(context).home_card_one_content,
              AppLocalizations.of(context).home_card_one_buttonText,
              buildRouteFunction(
                Information(),
              ),
              AppLocalizations.of(context).home_card_one_actionText,
              () => setState(
                  () => DataManager.instance.informationPathComplete = true),
              AssetImage('assets/images/home/cardOneBackground.png'),
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
      child: DataManager.instance.avatarPathComplete
          ? collapsedCard(
              Color(0xFF418D87),
              () => setState(
                () => DataManager.instance.avatarPathComplete = false,
              ),
            )
          : expandedCard(
              'avatar',
              Color(0xFF418D87),
              Image.asset('assets/images/home/avatar.png'),
              AppLocalizations.of(context).home_card_two_title,
              AppLocalizations.of(context).home_card_two_content,
              AppLocalizations.of(context).home_card_two_buttonText,
              buildRouteFunction(
                Avatar(),
              ),
              AppLocalizations.of(context).home_card_two_actionText,
              () => setState(
                  () => DataManager.instance.avatarPathComplete = true),
              AssetImage('assets/images/home/cardTwoBackground.png'),
            ),
    );
  }

  Widget cardThree() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: DataManager.instance.protectionPathComplete
          ? collapsedCard(
              Color(0xFF83AA74),
              () => setState(
                () => DataManager.instance.protectionPathComplete = false,
              ),
            )
          : expandedCard(
              'protection',
              Color(0xFF83AA74),
              Image.asset('assets/images/home/protection.png'),
              AppLocalizations.of(context).home_card_three_title,
              AppLocalizations.of(context).home_card_three_content,
              AppLocalizations.of(context).home_card_three_buttonText,
              buildRouteFunction(
                Protection(),
              ),
              AppLocalizations.of(context).home_card_three_actionText,
              () => setState(
                  () => DataManager.instance.protectionPathComplete = true),
              AssetImage('assets/images/home/cardThreeBackground.png'),
            ),
    );
  }

  Widget expandedCard(
      String heroTag,
      Color color,
      Image logo,
      String title,
      String text,
      String buttonText,
      Function buttonFunction,
      String actionText,
      Function actionFunction,
      AssetImage backgroundImage) {
    return CustomHero(
      tag: heroTag,
      shuttleColor: color,
      child: Container(
        width: 564 * widthScaleFactor,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(27.0),
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[800],
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
              60 * widthScaleFactor,
              60 * heightScaleFactor,
              60 * widthScaleFactor,
              60 * heightScaleFactor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 270,
                child: logo,
              ),
              Expanded(
                flex: 59,
                child: SizedBox(),
              ),
              Expanded(
                flex: 200,
                child: paragraph(title, text),
              ),
              Expanded(
                flex: 20,
                child: SizedBox(),
              ),
              Expanded(
                flex: 67,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      15 * widthScaleFactor, 0, 15 * widthScaleFactor, 0),
                  child: button(buttonText, buttonFunction),
                ),
              ),
              Expanded(
                flex: 21,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget collapsedCard(Color color, Function expandFunction) {
    return Column(
      children: [
        Expanded(
          flex: 95,
          child: SizedBox(),
        ),
        Expanded(
          flex: 5,
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
                          blurRadius: 6, // soften the shadow
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

  Widget button(String text, Function buttonFunction) {
    return CustomElevatedButton(
      text: text,
      buttonFunction: buttonFunction,
      textScaleFactor: textScaleFactor,
      textSize: 26,
      textColor: Color(0xFF5D584E),
    );
  }

  Widget paragraph(String title, String text) {
    Map<String, HighlightedWord> words = {
    "none": HighlightedWord(
    onTap: () {
    print("noHighlight");
      },
    textStyle: TextStyle(
      fontSize: 20.0,
      color: Colors.red,
    ),
    ),
    };

    return CustomParagraph(
      textScaleFactor: textScaleFactor,
      text: text,
      title: title,
      titleFontWeight: FontWeight.w900,
      titleLetterSpacing: 1.02,
      textHeight: 1.5,
      titleSize: 28,
      textSize: 24,
      padding: EdgeInsets.only(bottom: 24 * heightScaleFactor),
      textFontColor: Colors.white,
      titleFontColor: Colors.white,
      words: words,

    );
  }

  ///Route builder for button click
  Function buildRouteFunction(Widget destinationWidget) {
    return () => Navigator.push(
          context,
          PageRouteWithoutTransition(
            builder: (context) => destinationWidget,
          ),
        );
  }

  ///Switches the appointment image to the right place if card collapses
  Widget appointmentWidget() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child:
          // all cards are collapsed
          DataManager.instance.informationPathComplete == true &&
                  DataManager.instance.avatarPathComplete == true &&
                  DataManager.instance.protectionPathComplete == true
              ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 590 * widthScaleFactor,
                    height: 444 * heightScaleFactor,
                    child: SizedBox(),//Image.asset('assets/images/home/appointment.png',
                      // fit: BoxFit.contain,

                  ),
                )
              :
              // left two cards are collapsed
              DataManager.instance.informationPathComplete == true &&
                      DataManager.instance.avatarPathComplete == true
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 315 * widthScaleFactor),
                        child: Container(
                          width: 590 * widthScaleFactor,
                          height: 444 * heightScaleFactor,
                          child: SizedBox()
                        ),
                        ),
                      )
                 :
                   // right two cards are collapsed
              DataManager.instance.avatarPathComplete == true &&
                          DataManager.instance.protectionPathComplete == true
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                EdgeInsets.only(right: 315 * widthScaleFactor),
                            child: Container(
                              width: 590 * widthScaleFactor,
                              height: 444 * heightScaleFactor,
                              child: SizedBox()
                            ),
                          ),
                        )
                      :
                      // left and right are collapsed
                      DataManager.instance.informationPathComplete == true &&
                              DataManager.instance.protectionPathComplete ==
                                  true
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 590 * widthScaleFactor,
                                height: 444 * heightScaleFactor,
                                child: SizedBox()

                              ),
                            )
                          :
                          // left collapsed
                          DataManager.instance.informationPathComplete == true
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 590 * widthScaleFactor,
                                    height: 444 * heightScaleFactor,
                                      child: SizedBox()
                                  ),
                                )
                              :
                              // middle collapsed
                              DataManager.instance.avatarPathComplete == true
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 590 * widthScaleFactor,
                                        height: 444 * heightScaleFactor,
                                        child: SizedBox(),
                                      ),
                                    )
                                  :
                                  // right collapsed
                                  DataManager.instance.protectionPathComplete ==
                                          true
                                      ? Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            width: 590 * widthScaleFactor,
                                            height: 444 * heightScaleFactor,
                                              child: SizedBox()
                                          ),
                                        )
                                      : SizedBox(),
    );
  }
}

/// Hero Transition with rotation
class CustomHero extends StatelessWidget {
  final String tag;
  final Color shuttleColor;
  final Widget child;

  CustomHero({this.tag, this.shuttleColor, this.child});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (flightContext, animation, flightDirection,
          fromHeroContext, toHeroContext) {
        animation = animation.drive(
          CurveTween(curve: Curves.easeIn),
        );
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi * animation.value),
              child: Container(
                height: MediaQuery.of(fromHeroContext).size.height,
                width: MediaQuery.of(fromHeroContext).size.width,
                decoration: BoxDecoration(
                  color: shuttleColor,
                  borderRadius: BorderRadius.circular(27.0),
                ),
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}

///Helper class to paint triangle for collapsed card
class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
