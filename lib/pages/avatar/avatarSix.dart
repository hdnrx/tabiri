import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/customText.dart';
import 'package:tabiri_2/widgets/header.dart';

class AvatarSix extends StatelessWidget {
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
              flex: 16,
              child: header(context),
            ),
            Expanded(
              flex: 84,
              child: content(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return StandardHeader(
      title: AppLocalizations.of(context).avatarSix_title,
      dividerLineColor: Color(0xFF418D87),
    );
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 80,
          child: Row(
            children: [
              Expanded(
                flex: 23,
                child: Image.asset('assets/images/avatar/gene.png'),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 35,
                child: paragraphOne(context),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
                child: Column(
                  children: [
                    Expanded(
                      flex: 50,
                      child:
                          Image.asset('assets/images/avatar/skin_sample.png'),
                    ),
                    Expanded(
                      flex: 20,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 30,
                      child: paragraphTwo(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget paragraphOne(BuildContext context) {
    TextStyle highlight = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 28,
      fontFamily: 'Open Sans',
      height: 1.5,
      color: Colors.black,
    );
    return CustomRichParagraph(
      title: AppLocalizations.of(context).avatarSix_text_one_title,
      titleSize: 28,
      textScaleFactor: textScaleFactor,
      padding: EdgeInsets.only(bottom: 28 * heightScaleFactor),
      titleFontWeight: FontWeight.w900,
      titleFontColor: Color(0xFF3E2A1E),
      textSize: 28,
      textHeight: 1.5,
      textFontColor: Color(0xFF3E2A1E),
      children: <InlineSpan>[
        TextSpan(text: AppLocalizations.of(context).avatarSix_text_one_partOne),
        TextSpan(
            text: AppLocalizations.of(context).avatarSix_text_one_highlightOne,
            style: highlight),
        TextSpan(text: AppLocalizations.of(context).avatarSix_text_one_partTwo),
        TextSpan(
            text: AppLocalizations.of(context).avatarSix_text_one_highlightTwo,
            style: highlight),
        TextSpan(
            text: AppLocalizations.of(context).avatarSix_text_one_partThree),
        TextSpan(
            text:
                AppLocalizations.of(context).avatarSix_text_one_highlightThree,
            style: highlight),
        TextSpan(
            text: AppLocalizations.of(context).avatarSix_text_one_partFour),
        TextSpan(
            text: AppLocalizations.of(context).avatarSix_text_one_highlightFour,
            style: highlight),
        TextSpan(
            text: AppLocalizations.of(context).avatarSix_text_one_partFive),
      ],
    );
  }

  /// without title
  Widget paragraphTwo(BuildContext context) {
    TextStyle highlight = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 28,
      fontFamily: 'Open Sans',
      height: 1.5,
      color: Color(0xFF3E2A1E),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Open Sans',
                height: 1.5,
                color: Color(0xFF3E2A1E),
              ),
              children: [
                TextSpan(
                    text: AppLocalizations.of(context).avatarSix_text_two,
                    style: highlight),
              ],
            ),
            textScaleFactor: textScaleFactor,
          ),
        ),
      ],
    );
  }
}
