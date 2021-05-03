import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/widgets/customRadio.dart';
import 'package:tabiri_2/widgets/header.dart';

class AvatarThree extends StatefulWidget {
  final Function() notifyParent;
  AvatarThree({Key key, @required this.notifyParent}) : super(key: key);

  @override
  _AvatarThree createState() => _AvatarThree();
}

class _AvatarThree extends State<AvatarThree> {
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
                child: picture(),
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
                      flex: 90,
                      child: Text(
                        AppLocalizations.of(context).avatarThree_radio_title,
                        textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Color(0xFF332E27),
                            fontSize: 34,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      flex: 10,
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

  Widget picture() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: pictureSwapper(DataManager.instance.numberSunburns),
          scale: textScaleFactor,
        ),
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFF295A56),
          width: 10 * textScaleFactor,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
    );
  }

  /// changes image according to radio button selection
  AssetImage pictureSwapper(int numberSunburns) {
    switch (numberSunburns) {
      case 0:
        return AssetImage('assets/images/avatar/sunscreen/sunscreen_none.png');
      case 1:
        return AssetImage('assets/images/avatar/sunscreen/sunscreen_few.png');
      case 2:
        return AssetImage(
            'assets/images/avatar/sunscreen/sunscreen_several.png');
      case 3:
        return AssetImage('assets/images/avatar/sunscreen/sunscreen_many.png');
      case 4:
        return AssetImage('assets/images/avatar/sunscreen/sunscreen_none.png');
      default:
        return AssetImage('assets/images/avatar/sunscreen/sunscreen_none.png');
    }
  }

  Widget radioPicker() {
    // make List of radio Buttons
    List<RadioItem> listOne = [
      new RadioItem(
          isSelected: false,
          value: 0,
          buttonText: AppLocalizations.of(context).avatarFive_radio_textOne,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 1,
          buttonText: AppLocalizations.of(context).avatarFive_radio_textTwo,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 2,
          buttonText: AppLocalizations.of(context).avatarFive_radio_textThree,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 3,
          buttonText: AppLocalizations.of(context).avatarFive_radio_textFour,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 4,
          buttonText: AppLocalizations.of(context).avatarFive_radio_textFive,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
    ];
    // highlight previously selected Item
    if (DataManager.instance.numberSunburns >= 0)
      listOne.elementAt(DataManager.instance.numberSunburns).isSelected = true;
    return CustomRadio(
      edgeInsets: EdgeInsets.fromLTRB(
          0, 0, 80 * widthScaleFactor, 30 * heightScaleFactor),
      textScaleFactor: textScaleFactor,
      onChanged: (value) {
        setState(() {
          DataManager.instance.numberSunburns = value;
          DataManager.instance.sunBurnFlag = true;
          widget.notifyParent();
        });
      },
      radioButtons: listOne,
    );
  }
}
