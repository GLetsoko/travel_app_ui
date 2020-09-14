import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/models/activities.dart';
import 'package:travel_app_ui/models/size_config.dart';
import 'package:travel_app_ui/pages/tour_page.dart';

class AppSlider extends StatefulWidget {
  @override
  _AppSliderState createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  List<bool> isLiked = List.filled(activities.length, false);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: getScreenHeightProportion(500),
      //color: Colors.red,
      child: ListView.builder(
        itemCount: activities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Activities activity = activities[index];
          return Stack(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TourPage(
                      activities: activity,
                      isLiked: isLiked[index],
                    );
                  }),
                );
              },
              child: Hero(
                tag: activity.imageUrl,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                  width: getScreenHeightProportion(300),
                  height: getScreenHeightProportion(500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: AssetImage(activity.imageUrl),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken)),
                  ),
                ),
              ),
            ),

            //Like Icon
            Positioned(
              right: 30.0,
              top: 50.0,
              child: GestureDetector(
                onTap: () {
                  if (isLiked[index] == false) {
                    setState(() {
                      isLiked[index] = true;
                    });
                  } else {
                    setState(() {
                      isLiked[index] = false;
                    });
                  }
                },
                child: Icon(FontAwesomeIcons.solidHeart,
                    color: isLiked[index] ? kPinkColor : Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.name + ',',
                    style: kSubHeadingText.copyWith(color: Colors.white),
                  ),
                  Text(
                    activity.country,
                    style: kSubHeadingText.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendarWeek,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        activity.duration,
                        style: kSubText,
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            activity.distance,
                            style: kSubText,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}
