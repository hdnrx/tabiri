import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabiri_2/widgets/routes.dart';

import '../home.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class AvatarOne extends StatefulWidget {
  final Function callback;

  AvatarOne({this.callback, Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AvatarOne> {
  double heightScaleFactor;
  double widthScaleFactor;
  double textScaleFactor;

  int value = 1;

  Widget build(BuildContext context) {
    heightScaleFactor = MediaQuery.of(context).size.height / 1200;
    widthScaleFactor = MediaQuery.of(context).size.width / 1920;
    textScaleFactor = (heightScaleFactor + widthScaleFactor) / 2;
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.red, disabledColor: Colors.blue),
      child: Column(
        children: <Widget>[
          Radio(
            value: 0,
            groupValue: value,
            onChanged: (int value) {
              setState(() {
                this.value = value;
                widget.callback(value);
              });
            },
          ),
          Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.green,
                disabledColor: Colors.black),
            child: Radio(
              value: 1,
              groupValue: value,
              onChanged: (int value) {
                setState(() {
                  this.value = value;
                  widget.callback(value);
                });
              },
            ),
          ),
          Radio(
            value: 2,
            groupValue: value,
            onChanged: (int value) {
              setState(() {
                this.value = value;
                widget.callback(value);
              });
            },
          ),
          Row(
            children: [
              Expanded(
                flex: 40,
                child: Container(
                  color: Colors.blue,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(60),
                    title: Text('title, jo'),
                    subtitle: Text(
                        'looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooogng text '),
                  ),
                ),
              ),
              Expanded(
                flex: 60,
                child: SizedBox(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget content() {
    return Stack(
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
    );
  }
}
