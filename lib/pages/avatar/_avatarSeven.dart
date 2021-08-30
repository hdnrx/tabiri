import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/result/result.dart';
import 'package:tabiri_2/widgets/customButton.dart';
import 'package:tabiri_2/widgets/customRadio.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

class AvatarSeven extends StatefulWidget {
  final Function() notifyParent;
  AvatarSeven({Key key, @required this.notifyParent}) : super(key: key);

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
              child: content(),
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

  Widget content() {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 40,
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: SizedBox(),
              ),
              Expanded(
                flex: 75,
                child: Expanded(
                  flex: 20,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Image.asset(
                      'assets/images/avatar/familyTree.png',
                      fit: BoxFit.contain,
                    ),
                  ),
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
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: SizedBox(),
              ),
              Expanded(
                flex: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 80,
                      child: Text(
                        AppLocalizations.of(context).avatarSeven_text,
                        textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Color(0xFF332E27),
                            fontSize: 28,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: SizedBox(),
              ),
              Expanded(
                flex: 20,
                child: radioPicker(context),
              ),
              Expanded(
                flex: 10,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
      ],
    );
  }

  // Widget content(BuildContext context) {
  //   return Center(
  //     child: Container(
  //       height: 620 * textScaleFactor,
  //       width: 620 * textScaleFactor,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Color(0xFF418D87),
  //       ),
  //       child: Column(
  //         children: [
  //           Expanded(
  //             flex: 25,
  //             child: SizedBox(),
  //           ),
  //           Expanded(
  //             flex: 65,
  //             child: Row(
  //               children: [
  //                 Expanded(
  //                   flex: 15,
  //                   child: SizedBox(),
  //                 ),
  //                 Expanded(
  //                   flex: 70,
  //                   child: Column(
  //                     children: [
  //                       Flexible(
  //                         flex: 35,
  //                         child: Text(
  //                           AppLocalizations.of(context).avatarSeven_text,
  //                           textAlign: TextAlign.center,
  //                           textScaleFactor: textScaleFactor,
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 34,
  //                               fontFamily: 'Open Sans',
  //                               fontWeight: FontWeight.w600),
  //                         ),
  //                       ),
  //                       Expanded(
  //                         flex: 15,
  //                         child: SizedBox(),
  //                       ),
  //                       Expanded(
  //                         flex: 25,
  //                         child: Row(
  //                           children: [
  //                             Expanded(
  //                               flex: 45,
  //                               child: button(
  //                                   AppLocalizations.of(context)
  //                                       .avatarSeven_button_no,
  //                                   () => handleNoClick(context)),
  //                             ),
  //                             Expanded(
  //                               flex: 10,
  //                               child: SizedBox(),
  //                             ),
  //                             Expanded(
  //                               flex: 45,
  //                               child: button(
  //                                 AppLocalizations.of(context)
  //                                     .avatarSeven_button_yes,
  //                                 () => handleYesClick(context),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       Expanded(
  //                         flex: 10,
  //                         child: SizedBox(),
  //                       ),
  //                       Expanded(
  //                         flex: 15,
  //                         child: actionText(
  //                           AppLocalizations.of(context).avatarSeven_actionText,
  //                           () => handleNoDataClick(context),
  //                         ),
  //                       ),
  //                       Expanded(
  //                         flex: 5,
  //                         child: SizedBox(),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Expanded(
  //                   flex: 15,
  //                   child: SizedBox(),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Expanded(
  //             flex: 10,
  //             child: SizedBox(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget button(String text, Function buttonFunction) {
    return CustomElevatedButton(
      text: text,
      textSize: 28,
      textColor: Color(0xFF5D584E),
      buttonFunction: buttonFunction,
      textScaleFactor: textScaleFactor,
      padding: EdgeInsets.fromLTRB(
          30 * widthScaleFactor,
          15 * heightScaleFactor,
          30 * widthScaleFactor,
          15 * heightScaleFactor),
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

  Widget radioPicker(BuildContext context) {
    // make List of radio Buttons
    List<RadioItem> listOne = [
      new RadioItem(
          isSelected: false,
          value: 0,
          buttonText: AppLocalizations.of(context).avatarSeven_button_yes,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 1,
          buttonText: AppLocalizations.of(context).avatarSeven_button_no,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 2,
          buttonText: AppLocalizations.of(context).avatarSeven_actionText,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
    ];


    return CustomRadio(
      edgeInsets: EdgeInsets.fromLTRB(
          0, 0, 80 * widthScaleFactor, 30 * heightScaleFactor),
      textScaleFactor: textScaleFactor,
      onChanged: (value) {
        switch (value) {
          case 0:
            setState(() {
              DataManager().familySickness = 0;
            });
            break;
          case 1:
            setState(() {
              DataManager().familySickness = 0;
            });
            break;
          case 2:
            setState(() {
              DataManager().familySickness = 0;
            });
            break;
        }
        widget.notifyParent();
        Navigator.push(
         context,
       PageRouteWithTransition(
         builder: (context) => Result(),
       ),
     );

    }

    );



  }
}
