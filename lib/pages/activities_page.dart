import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/components/app_slider.dart';
import 'package:travel_app_ui/constants.dart';

class ActivitiesPage extends StatefulWidget {
  static const String id = 'activities_page';

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<IconData> icons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.parachuteBox,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.plane
  ];
  List<String> iconLabel = [
    'Accomodation',
    'Experiences',
    'Adventures',
    'Flights'
  ];
  int _currentIndex = 0;
  //Build Icons to select options
  Widget _buildIcons(int index) {
    return Column(
      children: [
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: kContainerColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Icon(
            icons[index],
            color: kPinkColor,
          ),
        ),
        SizedBox(height: 6.0),
        Text(iconLabel[index])
      ],
    );
  }

  //Build bottom navigation bar icons
  Widget _buildNavBarItems(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        child: Icon(
          icon,
          color: _currentIndex == index ? kPinkColor : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: AssetImage('assets/images/cuban_man.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItems(FontAwesomeIcons.home, 0),
          _buildNavBarItems(FontAwesomeIcons.search, 1),
          _buildNavBarItems(FontAwesomeIcons.heart, 2),
          _buildNavBarItems(FontAwesomeIcons.user, 3),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello',
                  style: kTextHeading.copyWith(color: kPinkColor),
                ),
                Text(', what are you', style: kTextHeading)
              ],
            ),
            Row(
              children: [
                Text('looking for?', style: kTextHeading),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                icons.length,
                (index) => _buildIcons(index),
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Best Experiences', style: kSubHeadingText),
                Icon(FontAwesomeIcons.ellipsisH)
              ],
            ),
            AppSlider(),
          ],
        ),
      ),
    );
  }
}
