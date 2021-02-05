import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/pages/protection/protection.dart';
import 'package:tabiri_2/widgets/routes.dart';

import 'avatar/avatar.dart';
import 'information/information.dart';

class Home extends StatefulWidget {
  bool cardOneCollapse;
  bool cardTwoCollapse;
  bool cardThreeCollapse;
  Home({this.cardOneCollapse, this.cardTwoCollapse, this.cardThreeCollapse});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  AutoSizeGroup titleSize = AutoSizeGroup();
  AutoSizeGroup textSize = AutoSizeGroup();
  AutoSizeGroup buttonTextSize = AutoSizeGroup();
  AutoSizeGroup actionTextSize = AutoSizeGroup();

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
    return Column(
      children: [
        Expanded(
          flex: 86,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/test'),
                    child: Image.asset('assets/images/logos/logo_tabiri.png')),
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
                )
              ],
            ),
          ),
        ),
      ],
    );
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
      ],
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

  Widget cardOne() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: widget.cardOneCollapse
          ? collapsedCard(
              Color(0xFF2D8064),
              () => setState(
                () => widget.cardOneCollapse = false,
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
                Information(
                  cardOneCollapse: widget.cardOneCollapse,
                  cardTwoCollapse: widget.cardTwoCollapse,
                  cardThreeCollapse: widget.cardThreeCollapse,
                ),
              ),
              AppLocalizations.of(context).home_card_one_actionText,
              () => setState(() => widget.cardOneCollapse = true),
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
      child: widget.cardTwoCollapse
          ? collapsedCard(
              Color(0xFF418D87),
              () => setState(
                () => widget.cardTwoCollapse = false,
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
                Avatar(
                  cardOneCollapse: widget.cardOneCollapse,
                  cardTwoCollapse: widget.cardTwoCollapse,
                  cardThreeCollapse: widget.cardThreeCollapse,
                ),
              ),
              AppLocalizations.of(context).home_card_two_actionText,
              () => setState(() => widget.cardTwoCollapse = true),
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
      child: widget.cardThreeCollapse
          ? collapsedCard(
              Color(0xFF83AA74),
              () => setState(
                () => widget.cardThreeCollapse = false,
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
                Protection(
                  cardOneCollapse: widget.cardOneCollapse,
                  cardTwoCollapse: widget.cardTwoCollapse,
                  cardThreeCollapse: widget.cardThreeCollapse,
                ),
              ),
              AppLocalizations.of(context).home_card_three_actionText,
              () => setState(() => widget.cardThreeCollapse = true),
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
                          color: Colors.black,
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
    return RaisedButton(
      onPressed: buttonFunction,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
      child: AutoSizeText(
        text,
        group: buttonTextSize,
        textScaleFactor: textScaleFactor,
        style: TextStyle(
          color: Color(0xFF5D584E),
          fontSize: 26,
        ),
      ),
    );
  }

  Widget paragraph(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 20,
          child: AutoSizeText(
            title,
            group: titleSize,
            maxLines: 1,
            textScaleFactor: textScaleFactor,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 34,
              fontFamily: 'Open Sans',
              color: Colors.white,
              letterSpacing: 1.02,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 70,
          child: AutoSizeText(
            text,
            group: textSize,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Open Sans',
              color: Color(0xCCFFFFFF),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

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

///Helper class to paint triangle
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
