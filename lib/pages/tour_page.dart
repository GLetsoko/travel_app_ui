import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/models/activities.dart';
import 'package:travel_app_ui/models/size_config.dart';

class TourPage extends StatefulWidget {
  TourPage({
    this.isLiked,
    this.activities,
  });
  final bool isLiked;
  final Activities activities;

  @override
  _TourPageState createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  int currentIndex = 0;
  int totalImages = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.activities.imageUrl,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35.0),
                          bottomRight: Radius.circular(35.0)),
                      image: DecorationImage(
                        image: AssetImage(widget.activities.imageUrl),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Positioned(
                top: 40.0,
                left: 20.0,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                  ),
                ),
              ),

              //Like button
              Padding(
                padding: EdgeInsets.only(
                    right: 30.0,
                    top: (MediaQuery.of(context).size.height / 2) - 82),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.2, 2.0),
                              blurRadius: 6.0)
                        ]),
                    child: Icon(
                      FontAwesomeIcons.solidHeart,
                      color: widget.isLiked ? kPinkColor : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //Display duration and distance
          Expanded(
            child: ListView(
              children: [
                //Display durationa and distance
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.calendarWeek),
                      SizedBox(width: 10.0),
                      Text(widget.activities.duration),
                      SizedBox(width: 20.0),
                      Icon(Icons.location_on),
                      Text(
                        widget.activities.distance,
                      ),
                    ],
                  ),
                ),

                // Display tour and country name
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.activities.name + ', ',
                            style: kSubHeadingText,
                          ),
                          Text(
                            widget.activities.country,
                            style: kSubHeadingText,
                          ),
                        ],
                      ),

                      //Display discription
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          widget.activities.description,
                          style: kSubText.copyWith(color: Color(0xff9a9a9a)),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Traveler\'s Gallery',
                        style: kSubHeadingText,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),

                //Display Images in the gallery
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image:
                                  AssetImage(widget.activities.imageGallery[0]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.0, top: 5.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        widget.activities.imageGallery[1]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0, top: 5.0),
                              child: Stack(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: AssetImage(widget
                                              .activities.imageGallery[2]),
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.4),
                                            BlendMode.darken,
                                          )),
                                    ),
                                  ),
                                  Positioned(
                                    child: Text(
                                      '+${widget.activities.imageGallery.length - 3} more',
                                      style: kSubText,
                                    ),
                                    left: 70.0,
                                    top: 60.0,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),

      //Book a tour container
      bottomSheet: Container(
        height: getScreenHeightProportion(100),
        decoration: BoxDecoration(
          color: kPinkColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text(
                    'Average Cost',
                    style: kSubText,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '\$${widget.activities.price}',
                    style: kSubHeadingText.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
            FlatButton(
              onPressed: null,
              child: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Book a Tour',
                    style: kSubText.copyWith(
                        color: kPinkColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
