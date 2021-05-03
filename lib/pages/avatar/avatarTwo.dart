import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/avatar/avatarBuilder.dart';
import 'package:tabiri_2/widgets/customRadio.dart';
import 'package:tabiri_2/widgets/header.dart';

class AvatarTwo extends StatefulWidget {
  final Function() notifyParent;
  AvatarTwo({Key key, @required this.notifyParent}) : super(key: key);

  @override
  _AvatarTwoState createState() => _AvatarTwoState();
}

class _AvatarTwoState extends State<AvatarTwo> {
  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  int hairColorValue;

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
              child: header(),
            ),
            Expanded(
              flex: 84,
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
                child: avatar(),
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
                child: Text(
                  AppLocalizations.of(context).avatarTwo_radio_title,
                  textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Color(0xFF332E27),
                      fontSize: 34,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 35,
                child: radioPicker(),
              ),
              Expanded(
                flex: 25,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget avatar() {
    return AvatarBuilder(
      age: DataManager.instance.age,
      gender: DataManager.instance.gender,
      hairColor: DataManager.instance.hairColor,
      portrait: true,
      borderScale: textScaleFactor,
    );
  }

  Widget radioPicker() {
    // make List of radio Buttons
    List<RadioItem> listOne = [
      new RadioItem(
          isSelected: false,
          value: 0,
          buttonText: AppLocalizations.of(context).avatarTwo_radio_textOne,
          backgroundColor: Color(0xFFE6CD86),
          borderColor: Color(0xFFBFBA8D),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 1,
          buttonText: AppLocalizations.of(context).avatarTwo_radio_textTwo,
          backgroundColor: Color(0xFFDB7956),
          borderColor: Color(0xFFBA6242),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 2,
          buttonText: AppLocalizations.of(context).avatarTwo_radio_textThree,
          backgroundColor: Color(0xFF865C38),
          borderColor: Color(0xFF6b492c),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 3,
          buttonText: AppLocalizations.of(context).avatarTwo_radio_textFour,
          backgroundColor: Color(0xFF502519),
          borderColor: Color(0xFF725046),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 4,
          buttonText: AppLocalizations.of(context).avatarTwo_radio_textFive,
          backgroundColor: Color(0xFF220909),
          borderColor: Color(0xFF4e3a3a),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
    ];
    // highlight previously selected Item
    if (DataManager.instance.hairColor >= 0)
      listOne.elementAt(DataManager.instance.hairColor).isSelected = true;
    return CustomRadio(
      edgeInsets: EdgeInsets.fromLTRB(
          0, 0, 80 * widthScaleFactor, 30 * heightScaleFactor),
      textScaleFactor: textScaleFactor,
      onChanged: (value) {
        setState(() {
          DataManager.instance.hairColor = value;
          DataManager.instance.hairFlag = true;
          widget.notifyParent();
        });
      },
      radioButtons: listOne,
    );
  }
}
