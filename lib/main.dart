import 'package:flutter/material.dart';
import 'package:travel_app_ui/pages/activities_page.dart';
import 'package:travel_app_ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Roboto-Condensed',
          primaryColor: Colors.white,
          brightness: Brightness.light),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        ActivitiesPage.id: (context) => ActivitiesPage(),
      },
    );
  }
}
