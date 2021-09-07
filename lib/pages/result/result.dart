import 'package:flutter/material.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/endScreen.dart';
import 'package:tabiri_2/pages/result/resultOne.dart';
import 'package:tabiri_2/widgets/routes.dart';

import '../home.dart';

double heightScaleFactor;
double widthScaleFactor;
double textScaleFactor;

class Result extends StatefulWidget {
  final pageController = PageController();

  final int numberOfPages = 1;

  @override
  _Result createState() => _Result();
}

class _Result extends State<Result> {
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
        child: PageView(
          controller: widget.pageController,
          onPageChanged: (index) => setState(() {
            this.index = index;
          }),
          scrollDirection: Axis.vertical,
          children: [
            ResultOne(
              handleContinue: handleContinue,
              handleBack: handleBack,
            ),
            // ResultTwo(
            //   handleContinue: handleContinue,
            //   handleBack: handleBack,
            // ),
            // ResultThree(
            //   handleContinue: handleContinue,
            //   handleBack: handleBack,
            // ),
          ],
        ),
      ),
    );
  }

  ///handle back Button click
  void handleBack() {
    if (index != 0) {
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
      /// if user did not play all paths
      if (DataManager().protectionPathComplete == false ||
          DataManager().informationPathComplete == false) {
        DataManager.instance.avatarPathComplete = true;
        Navigator.push(
          context,
          PageRouteWithTransition(
            builder: (context) => Home(),
          ),
        );
      } else {
        Navigator.push(
          context,
          PageRouteWithTransition(
            builder: (context) => EndScreen(),
          ),
        );
      }
    }
  }
}
