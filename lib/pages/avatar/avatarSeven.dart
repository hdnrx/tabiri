import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/avatar/avatarBuilder.dart';
import 'package:tabiri_2/pages/result/result.dart';
import 'package:tabiri_2/widgets/customRadio.dart';
import 'package:tabiri_2/widgets/header.dart';
import 'package:tabiri_2/widgets/routes.dart';

class AvatarSeven extends StatefulWidget {
  final Function() notifyParent;
  AvatarSeven({Key key, @required this.notifyParent}) : super(key: key);

  @override
  _AvatarSeven createState() => _AvatarSeven();
}

class _AvatarSeven extends State<AvatarSeven> {
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
              child: header(),
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

  Widget header() {
    return OnlyIconHeader();
  }

  Widget content() {
    return Row(
      children: [
        Expanded(
          flex: 5,
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
                child: Image.asset('assets/images/avatar/familyTree.png'),
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
          flex: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 25,
                child: SizedBox(),
              ),
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    Expanded(
                      flex: 80,
                      child: Text(
                        AppLocalizations.of(context).avatarSeven_text,
                        textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Color(0xFF332E27),
                            fontSize: 34,
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
                flex: 35,
                child: radioPicker(),
              ),
              Expanded(
                flex: 15,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget radioPicker() {
    // make List of radio Buttons
    List<RadioItem> listOne = [
      new RadioItem(
          isSelected: false,
          value: 1,
          buttonText: AppLocalizations.of(context).avatarSeven_button_yes,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 0,
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

    if (DataManager.instance.familySickness >= 0)
      listOne.elementAt(DataManager.instance.familySickness).isSelected =
      true;

    return CustomRadio(

      edgeInsets: EdgeInsets.fromLTRB(
          0, 0, 80 * widthScaleFactor, 30 * heightScaleFactor),
      textScaleFactor: textScaleFactor,
      onChanged: (value) {
        setState(() {
          DataManager.instance.familySickness = value;
          listOne.elementAt(value).isSelected = true;
          widget.notifyParent();
        });
      },
      radioButtons: listOne,
    );
  }
}


void handleNextClick(BuildContext context) {

  Navigator.push(
    context,
    PageRouteWithTransition(
      builder: (context) => Result(),
    ),
  );
}