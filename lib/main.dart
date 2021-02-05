import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tabiri_2/pages/home.dart';
import 'package:tabiri_2/pages/information/information.dart';
import 'package:tabiri_2/pages/information/informationOne.dart';
import 'package:tabiri_2/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      //localization and internationalization
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('de', ''),
      ],
      home: Home(
        cardOneCollapse: false,
        cardTwoCollapse: false,
        cardThreeCollapse: false,
      ),
      initialRoute: '/home',
      //initialRoute: '/test',

      routes: {
        '/home': (context) => Home(
              cardOneCollapse: false,
              cardTwoCollapse: false,
              cardThreeCollapse: false,
            ),
        '/information': (context) => Information(),
        '/information/1': (context) => InformationOne(),
        '/test': (context) => Test(),
        /*
        '/information/2': (context) => InformationTwo(),
        '/avatar/1': (context) => AvatarOne(),
        '/avatar/2': (context) => AvatarTwo(),
        '/protection/1': (context) => ProtectionOne(),
        '/protection/prevention/1': (context) => PreventionOne(),
        '/protection/prevention/2': (context) => PreventionTwo(),
        '/protection/screening/1': (context) => ScreeningOne(),
        '/protection/screening/2': (context) => ScreeningTwo(),
        '/protection/screening/3': (context) => ScreeningThree(),
        '/protection/screening/4': (context) => ScreeningFour(),
        '/protection/screening/5': (context) => ScreeningFive(),
        '/protection/screening/6': (context) => ScreeningSix(),
         */
      },
    );
  }
}
