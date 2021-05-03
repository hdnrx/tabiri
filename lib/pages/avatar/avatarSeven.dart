import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/result/resultCheck.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

class AvatarSeven extends StatefulWidget {
  @override
  _AvatarSevenState createState() => _AvatarSevenState();
}

class _AvatarSevenState extends State<AvatarSeven> {
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
            Flexible(
              flex: 10,
              child: header(context),
            ),
            Expanded(
              flex: 90,
              child: content(context),
            ),
          ],
        ),
      ),
    );
  }

  /// only home and exit icon
  Widget header(BuildContext context) {
    return OnlyIconHeader();
  }

  Widget content(BuildContext context) {
    return Center(
      child: Container(
        height: 620 * textScaleFactor,
        width: 620 * textScaleFactor,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF418D87),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 25,
              child: SizedBox(),
            ),
            Expanded(
              flex: 65,
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 70,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 35,
                          child: Text(
                            AppLocalizations.of(context).avatarSeven_text,
                            textAlign: TextAlign.center,
                            textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          flex: 15,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 25,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 45,
                                child: button(
                                    AppLocalizations.of(context)
                                        .avatarSeven_button_no,
                                    () => handleNoClick(context)),
                              ),
                              Expanded(
                                flex: 10,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 45,
                                child: button(
                                  AppLocalizations.of(context)
                                      .avatarSeven_button_yes,
                                  () => handleYesClick(context),
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
                          flex: 15,
                          child: actionText(
                            AppLocalizations.of(context).avatarSeven_actionText,
                            () => handleNoDataClick(context),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String text, Function buttonFunction) {
    return RaisedButton(
      onPressed: buttonFunction(),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            30 * widthScaleFactor,
            15 * heightScaleFactor,
            30 * widthScaleFactor,
            15 * heightScaleFactor),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              color: Color(0xFF5D584E),
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }

  Widget actionText(String text, Function function) {
    return GestureDetector(
      onTap: function,
      child: Text(
        text,
        textScaleFactor: textScaleFactor,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontFamily: 'Open Sans'),
      ),
    );
  }

  Function handleNoClick(BuildContext context) {
    setState(() {
      DataManager().familySickness = 0;
    });
    return () => Navigator.push(
          context,
          PageRouteWithTransition(
            builder: (context) => ResultCheck(),
          ),
        );
  }

  Function handleYesClick(BuildContext context) {
    setState(() {
      DataManager().familySickness = 1;
    });
    return () => Navigator.push(
          context,
          PageRouteWithTransition(
            builder: (context) => ResultCheck(),
          ),
        );
  }

  Function handleNoDataClick(BuildContext context) {
    setState(() {
      DataManager().familySickness = 0;
    });
    return () => Navigator.push(
          context,
          PageRouteWithTransition(
            builder: (context) => ResultCheck(),
          ),
        );
  }
}
