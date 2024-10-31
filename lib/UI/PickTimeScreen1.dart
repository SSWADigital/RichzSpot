import 'package:flutter/material.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'YourBillingScreen.dart';

class PickTimeScreen1 extends StatefulWidget {
  @override
  _PickTimeScreen1State createState() => _PickTimeScreen1State();
}

class _PickTimeScreen1State extends State<PickTimeScreen1> {
  List<Map<String, String>> dateList = [
    {
      "day": "Senin",
      "date": "09",
    },
    {
      "day": "Selasa",
      "date": "10",
    },
    {
      "day": "Rabu",
      "date": "11",
    },
    {
      "day": "Kamis",
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
    "10:00 AM",
    "10:30 AM",
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
                            "Pick a time",
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
                  height: 17,
                ),

                //
                Expanded(
                  child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        //Jolow
                        Container(
                          padding: EdgeInsets.only(left: 16, right: 20),
                          child: Row(
                            children: [
                              //img
                              Container(
                                child: Card(
                                  elevation: 3,
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.only(left: 3),
                                    child: Image.asset(
                                      "assets/icons/ic_clinic_1.png",
                                      scale: 8,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 60,
                                  padding: EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //Jolow quacky hospital
                                      Container(
                                        child: Text(
                                          "Jolow quacky hospital",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "medium",
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline2
                                                  .color),
                                        ),
                                      ),
                                      //99 Crown Street, London City
                                      Container(
                                        child: Text(
                                          "99 Crown Street, London City",
                                          style: TextStyle(
                                              fontSize: 13,
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
                              )
                            ],
                          ),
                        ),
                        //Sample time
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sample time",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 7,
                        ),
                        //date Widget
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: dateWidget(),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 14,
                        ),
                        //Time
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Time",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 12,
                        ),
                        //
                        timeWidget(),
                        //Space
                        SizedBox(
                          height: 15,
                        ),
                        //Nurse will...
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3
                                      .color),
                              borderRadius: BorderRadius.circular(8)),
                          child: RichText(
                            text: TextSpan(
                                text: "Nurse will come and take sample at",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .accentTextTheme
                                        .headline3
                                        .color),
                                children: [
                                  TextSpan(
                                    text: " your place. ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                  ),
                                  TextSpan(
                                    text:
                                        "Then, bring your sample to health facility to analyze.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline3
                                            .color),
                                  )
                                ]),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //Check-up Time
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Check-up Time",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Visibility(
                            visible: isCheckUpTime,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Space
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Container(
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: dateWidget2())),
                                  //Space
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //Time
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Time",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline2
                                              .color),
                                    ),
                                  ),
                                  //Space
                                  SizedBox(
                                    height: 20,
                                  ),
                                  timeWidget2(),
                                ],
                              ),
                            )),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //Please show...
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3
                                      .color),
                              borderRadius: BorderRadius.circular(8)),
                          child: RichText(
                            text: TextSpan(
                                text: "Please show up on time at",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .accentTextTheme
                                        .headline3
                                        .color),
                                children: [
                                  TextSpan(
                                    text:
                                        " Jolow Quacky Hospital, 99 Crown Street, London City ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                  ),
                                  TextSpan(
                                    text: "to check up.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline3
                                            .color),
                                  )
                                ]),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )
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
                          if (isNext == true) {
                            Navigator.push(context,
                                SlidePageRoute(page: YourBillingScreen()));
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: isNext
                            ? Theme.of(context).accentTextTheme.headline1.color
                            : Theme.of(context)
                                .primaryTextTheme
                                .headline3
                                .color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Next",
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
