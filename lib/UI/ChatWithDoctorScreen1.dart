import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homital/UI/PickTimeScreen1.dart';
import 'package:homital/UI/PickTimeScreen1.dart';

class ChatWithDoctorScreen1 extends StatefulWidget {
  @override
  _ChatWithDoctorScreen1State createState() => _ChatWithDoctorScreen1State();
}

class _ChatWithDoctorScreen1State extends State<ChatWithDoctorScreen1> {
  List<Map<String, String>> dateList = [
    {
      "day": "Mon",
      "date": "09",
    },
    {
      "day": "Tue",
      "date": "10",
    },
    {
      "day": "Wed",
      "date": "11",
    },
    {
      "day": "Thu",
      "date": "12",
    },
    {
      "day": "Fri",
      "date": "13",
    },
    {
      "day": "Sat",
      "date": "14",
    },
    {
      "day": "Sun",
      "date": "15",
    },
    {
      "day": "Mon",
      "date": "16",
    },
    {
      "day": "Tue",
      "date": "17",
    },
    {
      "day": "Wed",
      "date": "18",
    },
    {
      "day": "Thu",
      "date": "12",
    },
    {
      "day": "Fri",
      "date": "13",
    },
    {
      "day": "Sat",
      "date": "14",
    },
  ];
  List timeList = [
    "06:00 AM",
    "06:15 AM",
    "06:30 AM",
    "06:45 AM",
    "07:00 AM",
  ];
  List timeList2 = [
    "07:00 AM",
    "07:30 AM",
    "08:00 AM",
    "08:30 AM",
    "09:00 AM",
    "09:30 AM",
  ];
  //Date Widget1
  int tapIndex = 0;
  Container dateWidget() {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 12),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dateList.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  tapIndex = index;
                });
              },
              child: Container(
                height: 73,
                width: 60,
                decoration: BoxDecoration(
                    color: tapIndex == index
                        ? Theme.of(context).accentTextTheme.headline5.color
                        : null,
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        dateList[index]["day"],
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "medium",
                            color: tapIndex == index
                                ? Theme.of(context).textTheme.subtitle2.color
                                : Theme.of(context)
                                    .accentTextTheme
                                    .headline5
                                    .color),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        dateList[index]["date"],
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "medium",
                            color: tapIndex == index
                                ? Theme.of(context).textTheme.subtitle2.color
                                : Theme.of(context)
                                    .accentTextTheme
                                    .headline5
                                    .color),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }

  //time Widget1
  int tapIndex2 = 0;
  Container timeWidget() {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 12,
      ),
      child: Wrap(
          spacing: 10,
          runSpacing: 10,
          direction: Axis.horizontal,
          children: List.generate(timeList.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  tapIndex2 = index;
                  isCheckUpTime = true;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3 - 9,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: tapIndex2 == index
                        ? Theme.of(context).accentTextTheme.headline5.color
                        : Theme.of(context)
                            .accentTextTheme
                            .headline5
                            .color
                            .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7)),
                alignment: Alignment.center,
                child: Text(
                  timeList[index],
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "medium",
                      color: tapIndex2 == index
                          ? Theme.of(context).textTheme.subtitle2.color
                          : Theme.of(context).accentTextTheme.headline5.color),
                ),
              ),
            );
          })),
    );
  }

  //Date Widget2
  int tapIndex3 = 0;
  Container dateWidget2() {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 12),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dateList.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  tapIndex3 = index;
                });
              },
              child: Container(
                height: 73,
                width: 60,
                decoration: BoxDecoration(
                    color: tapIndex3 == index
                        ? Theme.of(context).accentTextTheme.headline5.color
                        : null,
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        dateList[index]["day"],
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "medium",
                            color: tapIndex3 == index
                                ? Theme.of(context).textTheme.subtitle2.color
                                : Theme.of(context)
                                    .accentTextTheme
                                    .headline5
                                    .color),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        dateList[index]["date"],
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "medium",
                            color: tapIndex3 == index
                                ? Theme.of(context).textTheme.subtitle2.color
                                : Theme.of(context)
                                    .accentTextTheme
                                    .headline5
                                    .color),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }

  //time Widget2
  int tapIndex4 = 0;
  Container timeWidget2() {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 12,
      ),
      child: Wrap(
          spacing: 10,
          runSpacing: 10,
          direction: Axis.horizontal,
          children: List.generate(timeList2.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  tapIndex4 = index;
                  isNext = true;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3 - 9,
                padding: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: tapIndex4 == index
                        ? Theme.of(context).accentTextTheme.headline5.color
                        : Theme.of(context)
                            .accentTextTheme
                            .headline5
                            .color
                            .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  timeList2[index],
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "medium",
                      color: tapIndex4 == index
                          ? Theme.of(context).textTheme.subtitle2.color
                          : Theme.of(context).accentTextTheme.headline5.color),
                ),
              ),
            );
          })),
    );
  }

  bool isCheckUpTime = false;
  bool isNext = false;
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
                            "Telehealth",
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
                //List
                Expanded(
                  child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        //Img
                        Container(
                            child: Stack(
                          children: [
                            Center(
                                child: Image.asset(
                              "assets/icons/ic_heart.png",
                              scale: 4,
                            )),
                            // Positioned.directional(
                            //   textDirection: Directionality.of(context),
                            //   bottom: 10,
                            //   start: 0,
                            //   end: 0,
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     child: Text(
                            //       "Get new doctor's advice now",
                            //       style: TextStyle(
                            //           fontSize: 14,
                            //           fontFamily: "medium",
                            //           color: Theme.of(context)
                            //               .accentTextTheme
                            //               .headline3
                            //               .color),
                            //     ),
                            //   ),
                            // )
                          ],
                        )),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 40, right: 40),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "--",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline3
                                            .color),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "PI%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline3
                                            .color),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "65",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline3
                                            .color),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "PRbpm",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline3
                                            .color),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 40, right: 40),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "100",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline3
                                            .color),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Spo2%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline3
                                            .color),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                        //Space
                        SizedBox(
                          height: 30,
                        ),
                        //Choose doctor
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    "Riwayat TTV",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                  ),
                                ),
                                //
                                // Container(
                                //   child: Row(
                                //     children: [
                                //       Container(
                                //         padding: EdgeInsets.only(right: 5),
                                //         child: Text(
                                //           "See all",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Theme.of(context)
                                //                   .accentTextTheme
                                //                   .headline5
                                //                   .color),
                                //         ),
                                //       ),
                                //       Image.asset(
                                //         "assets/icons/ic_forward.png",
                                //         scale: 44,
                                //       )
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: dateWidget(),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        timeWidget(),
                        SizedBox(
                          height: 40,
                        ),
                        Visibility(
                          visible: isCheckUpTime,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 40),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "--",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline3
                                              .color),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "PI%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline3
                                              .color),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "65",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline3
                                              .color),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "PRbpm",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline3
                                              .color),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 40),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "100",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline3
                                              .color),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Spo2%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline3
                                              .color),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )

                        // Container(
                        //   padding: EdgeInsets.only(left: 18, right: 18),
                        //   child: StaggeredGridView.count(
                        //     shrinkWrap: true,
                        //     physics: ClampingScrollPhysics(),
                        //     crossAxisCount: 2,
                        //     mainAxisSpacing: 8,
                        //     crossAxisSpacing: 8,
                        //     children: [
                        //       itemWidget("assets/imgs/female_dr1.png",
                        //           "Dr. Dimitri\nPetrenko", "Dentist"),
                        //       itemWidget(
                        //           "assets/imgs/male_dr1.png",
                        //           "Dr. Zackary\nHailarious",
                        //           "Orthopodist\nSurgeon\nDentist"),
                        //       itemWidget(
                        //           "assets/imgs/female_dr2.png",
                        //           "Dr. Dimitri\nPetrenko",
                        //           "Endocrine\nOrthopodist"),
                        //       itemWidget("assets/imgs/male_dr2.png",
                        //           "Dr. Dimitri\nPetrenko", "Dentist"),
                        //       itemWidget(
                        //           "assets/imgs/female_dr3.png",
                        //           "Dr. Zackary\nHailarious",
                        //           "Orthopodist\nSurgeon\nnDentist"),
                        //       itemWidget(
                        //           "assets/imgs/male_dr3.png",
                        //           "Dr. Dimitri\nPetrenko",
                        //           "Endocrine\nOrthopodist"),
                        //     ],
                        //     staggeredTiles: [
                        //       StaggeredTile.extent(1, 154),
                        //       StaggeredTile.extent(1, 200),
                        //       StaggeredTile.extent(1, 180),
                        //       StaggeredTile.extent(1, 158),
                        //       StaggeredTile.extent(1, 200),
                        //       StaggeredTile.extent(1, 180),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // bottomNavigationBar: BottomAppBar(
          //   elevation: 4,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: MaterialButton(
          //             height: 44,
          //             onPressed: () {
          //               FocusScope.of(context).requestFocus(FocusNode());
          //             },
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(6)),
          //             color: Theme.of(context).accentTextTheme.headline1.color,
          //             elevation: 0,
          //             highlightElevation: 0,
          //             child: Container(
          //               child: Text(
          //                 "Emergency Situation",
          //                 style: TextStyle(
          //                     color:
          //                         Theme.of(context).textTheme.subtitle2.color,
          //                     fontSize: 15,
          //                     fontFamily: 'medium'),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }

  //
  Container itemWidget(String img, String title, String subTitle) {
    return Container(
        child: InkWell(
      onTap: () {},
      child: new Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //img
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      width: 35,
                      height: 33,
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(img))),
                    ),
                  ),
                  //Dr. Dimitri
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "medium",
                          color: Theme.of(context).textTheme.headline1.color),
                    ),
                  ),
                  //Dentist
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline3
                              .color),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.directional(
                textDirection: Directionality.of(context),
                end: -1,
                top: -21,
                child: Container(
                  width: 65,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/ic_bg.png"))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/ic_star.png",
                        scale: 38,
                        color: Theme.of(context).textTheme.subtitle2.color,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 3, right: 7),
                        child: Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "medium",
                              color:
                                  Theme.of(context).textTheme.subtitle2.color),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
