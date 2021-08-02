import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreeningFour extends StatelessWidget {
  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    heightScaleFactor = MediaQuery
        .of(context)
        .size
        .height / 1200;
    widthScaleFactor = MediaQuery
        .of(context)
        .size
        .width / 1920;
    textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Scaffold(
      body: SafeArea(
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: SizedBox(),
        ),
        Expanded(
          flex: 85,
          child: Row(
            children: [
              Expanded(
                flex: 15,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
                child: Column(
                  children: [
                    Expanded(
                      flex: 80,
                      child: picture(),
                    ),
                    Expanded(
                      flex: 20,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 5, child: SizedBox()),
              Expanded(
                flex: 40,
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 90,
                      child: textColumn(context),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 10, child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }

  Widget picture() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 80,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF759A67),
                      width: 10,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 20,
              child: SizedBox(),
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              flex: 10,
              child: SizedBox(),
            ),
            Expanded(
              flex: 90,
              child: Center(
                child: Image.asset('assets/images/screening/microscope.png'),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget textColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 50 * heightScaleFactor),
          child: Text(
            AppLocalizations
                .of(context)
                .screeningFour_text_one_title,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
              fontSize: 34,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w900,
              color: Color(0xFF332E27),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 40 * heightScaleFactor),
            child: Text(
                  AppLocalizations
                    .of(context)
                    .screeningFour_text_one_text,
                  style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Open Sans',
                  color: Color(0xFF332E27),
          ),
        ),
        ),
      ],
    );
  }
//
//   Widget pointOne(BuildContext context) {
//     TextStyle highlight = TextStyle(
//       fontWeight: FontWeight.w900,
//       fontSize: 28,
//       fontFamily: 'Open Sans',
//       height: 1.70,
//       color: Color(0xFF5D584E),
//     );
//     return RichText(
//       text: TextSpan(
//         style: TextStyle(
//           fontSize: 28,
//           fontFamily: 'Open Sans',
//           height: 1.70,
//           color: Color(0xFF5D584E),
//         ),
//         children: [
//           TextSpan(text: String.fromCharCode(0x2022) + " "),
//           TextSpan(
//               text:
//                   AppLocalizations.of(context).screeningFour_text_one_partOne),
//           TextSpan(
//               text: AppLocalizations.of(context)
//                   .screeningFour_text_one_highlightOne,
//               style: highlight),
//           TextSpan(
//               text:
//                   AppLocalizations.of(context).screeningFour_text_one_partTwo),
//           TextSpan(
//               text: AppLocalizations.of(context)
//                   .screeningFour_text_one_highlightTwo,
//               style: highlight),
//           TextSpan(
//               text: AppLocalizations.of(context)
//                   .screeningFour_text_one_partThree),
//           TextSpan(
//               text: AppLocalizations.of(context)
//                   .screeningFour_text_one_highlightThree,
//               style: highlight),
//           TextSpan(
//               text:
//                   AppLocalizations.of(context).screeningFour_text_one_partFour),
//         ],
//       ),
//       textScaleFactor: textScaleFactor,
//     );
//   }
//
//   Widget pointTwo(BuildContext context) {
//     TextStyle highlight = TextStyle(
//       fontWeight: FontWeight.w900,
//       fontSize: 28,
//       fontFamily: 'Open Sans',
//       height: 1.70,
//       color: Color(0xFF5D584E),
//     );
//     return RichText(
//       text: TextSpan(
//         style: TextStyle(
//           fontSize: 28,
//           fontFamily: 'Open Sans',
//           height: 1.70,
//           color: Color(0xFF5D584E),
//         ),
//         children: [
//           TextSpan(text: String.fromCharCode(0x2022) + " "),
//           TextSpan(
//               text:
//                   AppLocalizations.of(context).screeningFour_text_two_partOne),
//           TextSpan(
//               text: AppLocalizations.of(context)
//                   .screeningFour_text_two_highlightOne,
//               style: highlight),
//           TextSpan(
//               text:
//                   AppLocalizations.of(context).screeningFour_text_two_partTwo),
//           TextSpan(
//               text: AppLocalizations.of(context)
//                   .screeningFour_text_two_highlightTwo,
//               style: highlight),
//           TextSpan(
//               text: AppLocalizations.of(context)
//                   .screeningFour_text_two_partThree),
//           TextSpan(
//               text: AppLocalizations.of(context)
//                   .screeningFour_text_two_highlightThree,
//               style: highlight),
//           TextSpan(
//               text:
//                   AppLocalizations.of(context).screeningFour_text_two_partFour),
//         ],
//       ),
//       textScaleFactor: textScaleFactor,
//     );
//   }

}