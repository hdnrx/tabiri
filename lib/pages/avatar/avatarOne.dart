import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class AvatarOne extends StatefulWidget {
  final Function callback;

  AvatarOne({this.callback, Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AvatarOne> {
  int value = 1;

  Widget build(BuildContext context) {
    return Column(
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
        Radio(
          value: 1,
          groupValue: value,
          onChanged: (int value) {
            setState(() {
              this.value = value;
              widget.callback(value);
            });
          },
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
      ],
    );
  }
}
