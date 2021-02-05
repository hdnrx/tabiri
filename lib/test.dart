import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Test> {
  BestTutorSite _site = BestTutorSite.javatpoint;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('www.javatpoint.com'),
              leading: Radio(
                value: BestTutorSite.javatpoint,
                groupValue: _site,
                onChanged: (BestTutorSite value) {
                  setState(() {
                    _site = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('www.w3school.com'),
              leading: Radio(
                value: BestTutorSite.w3schools,
                groupValue: _site,
                onChanged: (BestTutorSite value) {
                  setState(() {
                    _site = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('www.tutorialandexample.com'),
              leading: Radio(
                value: BestTutorSite.tutorialandexample,
                groupValue: _site,
                onChanged: (BestTutorSite value) {
                  setState(() {
                    _site = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
