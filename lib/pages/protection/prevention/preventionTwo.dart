import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';

class PreventionTwo extends StatelessWidget {
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
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 45,
          child: Image.asset(
            'assets/images/prevention/prevention_2.png',
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 35,
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: IconButton(
                     //onPressed: showMyDialog,
                     icon: Image.asset('assets/images/result/downButton.png'),
                     iconSize: 80 * textScaleFactor,
                     padding: EdgeInsets.fromLTRB(
                         0, 0, 60 * widthScaleFactor, 60 * heightScaleFactor),
                     autofocus: true,
                   ),
              ),
              Expanded(
                flex: 90,
                child: textColumn(context),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 15,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget textColumn(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 30,
          child: paragraph(
              AppLocalizations.of(context).preventionTwo_text_one_title,
              AppLocalizations.of(context).preventionTwo_text_one_content),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget paragraph(String title, String text) {
    return CustomParagraph(
      title: title,
      text: text,
      titleSize: 28,
      textSize: 24,
      textScaleFactor: textScaleFactor,
      titleFontWeight: FontWeight.w900,
      textHeight: 1.5,
      padding: EdgeInsets.only(bottom: 10 * heightScaleFactor),
      titleFontColor: Color(0xFF332E27),
      textFontColor: Color(0xFF5D584E),
    );
  }

  void showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
              40 * widthScaleFactor,
              100 * heightScaleFactor,
              40 * widthScaleFactor,
              100 * heightScaleFactor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                Expanded(
                  flex: 20,
                  child: Text(
                    AppLocalizations.of(context).avatarOne_popup_title,
                    textScaleFactor: textScaleFactor,
                    style: TextStyle(
                      color: Color(0xFF5D584E),
                      fontSize: 34,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  flex: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 40,
                        child: Image.asset(
                            'assets/images/avatar/drawingBlock.png'),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 57,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 10,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 90,
                              child: Text(
                                AppLocalizations.of(context)
                                    .avatarOne_popup_text,
                                textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                  color: Color(0xFF5D584E),
                                  fontSize: 24,
                                  fontFamily: 'Open Sans',
                                  height: 1.78,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: button(
                    AppLocalizations.of(context).avatarOne_popup_button,
                        () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ));


  }

  Widget button(String text, Function buttonFunction) {
    return RaisedButton(
      color: Color(0xFF295A56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
      onPressed: () => buttonFunction(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            80 * widthScaleFactor,
            10 * heightScaleFactor,
            80 * widthScaleFactor,
            10 * heightScaleFactor),
        child: FittedBox(
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Open Sans',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}
