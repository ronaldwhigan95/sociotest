import 'package:flutter/material.dart';
import 'package:sociotest/librarypage.dart';
import 'package:sociotest/homepage.dart';

// void main() => runApp((MyApp()));
void main() {
  runApp(MyApp());
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SocioTest',
      home: new HomePage(),
      // routes: <String, WidgetBuilder>{
      //   '/library': (BuildContext context) => new LibraryPage(),
      // },
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case '/library':
            return MaterialPageRoute<String>(
                builder: (BuildContext context) => new LibraryPage());

          default:
            throw 'Impelement this';
        }
      },
    );
  }
}
