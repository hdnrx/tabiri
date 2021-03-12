import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:tabiri_2/dataManager.dart';
import 'package:tabiri_2/pages/avatar/avatarBuilder.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/widgets/customRadio.dart';
import 'package:tabiri_2/widgets/routes.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AvatarOne extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AvatarOne> {
  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  Widget build(BuildContext context) {
    heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 16,
                  child: header(),
                ),
                Expanded(
                  flex: 84,
                  child: SizedBox(),
                ),
              ],
            ),
            content(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      children: [
        Expanded(
          flex: 82,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10 * widthScaleFactor),
                  child: InkWell(
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/images/header/menu.png',
                            height: 70 * widthScaleFactor,
                            width: 70 * widthScaleFactor,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            AppLocalizations.of(context).button_home,
                            textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Color(0xFF332E27),
                                fontSize: 24,
                                fontFamily: 'Open Sans'),
                          ),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      PageRouteWithoutTransition(
                        builder: (context) => Home(),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10 * widthScaleFactor),
                  child: InkWell(
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/images/header/exit.png',
                            height: 70 * widthScaleFactor,
                            width: 70 * widthScaleFactor,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            AppLocalizations.of(context).button_exit,
                            textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Color(0xFF3E2A1E),
                                fontSize: 24,
                                fontFamily: 'Open Sans'),
                          ),
                        ),
                      ],
                    ),
                    //todo implement exit screen
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Not implemented"),
                        content: Text("coming soon"),
                        actions: [
                          FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Okay"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 18,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget content() {
    return Row(
      children: [
        Expanded(
          flex: 20,
          child: SizedBox(),
        ),
        Expanded(
          flex: 50,
          child: avatar(),
        ),
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF418D87),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0 * widthScaleFactor, // soften the shadow
                  spreadRadius: 0, //extend the shadow
                  offset: Offset(
                    6.0, // Horizontal
                    0, // Vertical
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: SizedBox(),
        ),
        Expanded(
          flex: 110,
          child: Column(
            children: [
              Expanded(
                flex: 20,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 20,
                      child: Text(
                        AppLocalizations.of(context).avatarOne_radio_title,
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
                    Expanded(
                      flex: 70,
                      child: radioPicker(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 10,
                child: Text(
                  AppLocalizations.of(context).avatarOne_slider_title,
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
                child: ageSlider(),
              ),
              Expanded(
                flex: 20,
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
      sex: DataManager.instance.gender,
      hairColor: DataManager.instance.hairColor,
      portrait: false,
      borderScale: textScaleFactor,
    );
  }

  Widget ageSlider() {
    /*
    return Slider(
        min: 1.0,
        max: 100.0,
        //divisions: 5,
        label: DataManager().age.toString(),
        value: DataManager().age.toDouble(),
        onChanged: (double value) {
          setState(() {
            DataManager().age = value.round();
          });
        });
     */
    return SfSlider(
      min: 0.0,
      max: 100.0,
      value: DataManager().age.toDouble(),
      interval: 20,
      activeColor: Color(0xFF295A56),
      inactiveColor: Color(0xFF295A56),
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      minorTicksPerInterval: 1,
      onChanged: (dynamic value) {
        setState(() {
          DataManager().age = value.round();
        });
      },
    );
  }

  /// gender selection
  Widget radioPicker() {
    // make List of radio Buttons
    List<RadioItem> listOne = [
      new RadioItem(
          isSelected: false,
          value: 0,
          buttonText: AppLocalizations.of(context).avatarOne_radio_textOne,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 1,
          buttonText: AppLocalizations.of(context).avatarOne_radio_textTwo,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
      new RadioItem(
          isSelected: false,
          value: 2,
          buttonText: AppLocalizations.of(context).avatarOne_radio_textThree,
          backgroundColor: Colors.white,
          borderColor: Color(0xFF295A56),
          height: 60 * widthScaleFactor,
          width: 60 * widthScaleFactor),
    ];
    // highlight previously selected Item
    if (DataManager.instance.gender >= 0)
      listOne.elementAt(DataManager.instance.gender).isSelected = true;
    return Container(
      child: CustomRadio(
        edgeInsets: EdgeInsets.fromLTRB(
            0, 0, 40 * widthScaleFactor, 30 * heightScaleFactor),
        textScaleFactor: textScaleFactor,
        onChanged: (value) {
          setState(() {
            DataManager.instance.gender = value;
          });
        },
        radioButtons: listOne,
      ),
    );
  }
}
