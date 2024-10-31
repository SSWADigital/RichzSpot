import 'package:flutter/material.dart';
import 'package:homital/UI/BasicHeathScreen.dart';
import 'package:homital/UI/SelectAddressScreen.dart';
import 'package:homital/UI/YourAddressScreen.dart';
import 'package:homital/UI/webview.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'PickTimeScreen1.dart';

class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  List<Map<String, dynamic>> list = [
    {
      "img": "assets/imgs/download 1.png",
      "name": "Rumah Sakit Indriati",
      "jarak": "200 m",
      "msgStatus": "New message",
      "timing": "21 minutes ago",
      "color": 0xFF4CAF50,
    },
    {
      "img": "assets/imgs/rs1.png",
      "name": "Rumah Sakit Moewardi",
      "jarak": "3 km",
      "msgStatus": "Ongoing",
      "timing": "32 minutes ago",
      "color": 0xFF4285f4,
    },
    {
      "img": "assets/imgs/rs2.png",
      "name": "Rumah Sakit JIH Surakarta",
      "jarak": "2 km",
      "msgStatus": "Ended 13:02",
      "timing": "2 days ago",
      "color": 0xAA5c5c8a,
    },
  ];

  // List _img = [
  //   "assets/imgs/download 1.png",
  //   "assets/imgs/rs1.png",
  //   "assets/imgs/rs2.png",
  // ];
  int tapIndex;
  @override
  void initState() {
    super.initState();
    tapIndex;
  }

  bool isTap = false;
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MediaQuery(
      data: queryData.copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                //Appbar
                Container(
                  height: 50,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //back btn
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        start: -4,
                        top: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/icons/ic_back.png",
                              scale: 30,
                            ),
                          ),
                        ),
                      ),
                      //title
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        top: 0,
                        bottom: 0,
                        start: 0,
                        end: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Rumah Sakit & Klinik",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'medium',
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Space
                SizedBox(
                  height: 10,
                ),
                //
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                  width: 1,
                                  color: tapIndex == index
                                      ? Theme.of(context)
                                          .accentTextTheme
                                          .headline1
                                          .color
                                      : Colors.transparent)),
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                tapIndex = index;
                                isTap = true;
                              });
                            },
                            child: Container(
                              height: 120,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Row(
                                children: [
                                  //
                                  Container(
                                    width: 95,
                                    height: double.infinity,
                                    child: Image.asset(
                                      list[index]["img"],
                                      scale: 5,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //
                                          Container(
                                            child: Text(
                                              list[index]["name"],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline2
                                                      .color
                                                      .withOpacity(0.9)),
                                            ),
                                          ),
                                          //Space
                                          SizedBox(
                                            height: 3,
                                          ),
                                          //
                                          Container(
                                            child: Text(
                                              "Surakarta",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline3
                                                      .color),
                                            ),
                                          ),
                                          //Space
                                          SizedBox(
                                            height: 9,
                                          ),
                                          //
                                          Container(
                                            child: Row(
                                              children: [
                                                //
                                                Transform.translate(
                                                  offset: Offset(-4.0, 0.0),
                                                  child: Image.asset(
                                                      "assets/icons/ic_loc4.png",
                                                      scale: 25,
                                                      color: Theme.of(context)
                                                          .accentTextTheme
                                                          .headline1
                                                          .color),
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 2),
                                                  child: Text(
                                                    list[index]["jarak"],
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily: "medium",
                                                        color: Theme.of(context)
                                                            .accentTextTheme
                                                            .headline1
                                                            .color),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 70,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 44,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (isTap == true) {
                            Navigator.push(context,
                                SlidePageRoute(page: BasicHealthScreen()));
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: isTap ? Colors.blue : Colors.grey[300],
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Lanjut",
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.subtitle2.color,
                                fontSize: 15,
                                fontFamily: 'medium'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
