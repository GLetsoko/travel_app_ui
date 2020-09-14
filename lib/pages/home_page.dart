import 'package:flutter/material.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/pages/activities_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Enjoy the world',
                style: TextStyle(fontSize: 45.0, color: Colors.white),
              ),
              SizedBox(height: 18.0),
              Text(
                'We\'ll help you find the best\nexperiences & adventures.',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ActivitiesPage.id);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 24.0),
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Icon(
                    Icons.chevron_right,
                    size: 30.0,
                    color: kPinkColor,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
