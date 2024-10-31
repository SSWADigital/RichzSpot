import 'package:flutter/material.dart';
import 'package:homital/UI/ChatScreen.dart';
import 'package:homital/animation/SlideRightRoute.dart';

class ChatWithDoctorScreen2 extends StatefulWidget {
  @override
  _ChatWithDoctorScreen2State createState() => _ChatWithDoctorScreen2State();
}

class _ChatWithDoctorScreen2State extends State<ChatWithDoctorScreen2> {
  List<Map<String, dynamic>> list = [
    {
      "img": "assets/imgs/checkup.jpg",
      "name": "Dr. Dimitri Petrenko",
      "activeStatus": "Active now",
      "msgStatus": "New message",
      "timing": "21 minutes ago",
      "color": 0xFF4CAF50,
    },
    {
      "img": "assets/imgs/checkup.jpg",
      "name": "Dr. Dimitri Petrenko",
      "activeStatus": "Active now",
      "msgStatus": "Ongoing",
      "timing": "32 minutes ago",
      "color": 0xFF4285f4,
    },
    {
      "img": "assets/imgs/checkup.jpg",
      "name": "Dr. Dimitri Petrenko",
      "activeStatus": "Active now",
      "msgStatus": "Ended 13:02",
      "timing": "2 days ago",
      "color": 0xAA5c5c8a,
    },
    {
      "img": "assets/imgs/checkup.jpg",
      "name": "Dr. Zackary Hailarious",
      "activeStatus": "Active now",
      "msgStatus": "New message",
      "timing": "21 minutes ago",
      "color": 0xFF4CAF50,
    },
  ];
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
                      children: [
                        //Space
                        SizedBox(
                          height: 6,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      SlidePageRoute(page: ChatScreen()));
                                },
                                child: item(
                                    list[index]["img"],
                                    list[index]["name"],
                                    list[index]["activeStatus"],
                                    list[index]["msgStatus"],
                                    list[index]["color"],
                                    list[index]["timing"]),
                              );
                            }),
                        //Space
                        SizedBox(
                          height: 50,
                        ),
                        //New Conservation
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  height: 44,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline5
                                      .color
                                      .withOpacity(0.2),
                                  elevation: 0,
                                  highlightElevation: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/ic_add.png",
                                        scale: 43,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "New Conservation",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline5
                                                  .color,
                                              fontSize: 15,
                                              fontFamily: 'medium'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      height: 44,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      color: Theme.of(context).accentTextTheme.headline1.color,
                      elevation: 0,
                      highlightElevation: 0,
                      child: Container(
                        child: Text(
                          "Emergency Situation",
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
    );
  }

  //item
  Container item(String img, String title, String subTitle, String msgInd,
      int clr, String time) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 2,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(img))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            top: -1,
                            end: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline6
                                      .color),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .accentTextTheme
                                        .headline2
                                        .color),
                              ),
                            ),
                            //Space
                            SizedBox(
                              height: 3,
                            ),
                            Container(
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
                            )
                          ],
                        ),
                      ),
                    ),
                    //
                    InkWell(
                      onTap: () {
                        conservationDialogue();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          "assets/icons/ic_menu.png",
                          scale: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    Container(
                      child: Text(
                        msgInd,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "medium",
                            color: Color(clr)),
                      ),
                    ),
                    //
                    Container(
                      child: Text(
                        time,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void conservationDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: EdgeInsets.all(30),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //
                  Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Doctor: Dimitri Petrenko",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .color),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "What do you want do to this\nconservation?",
                            style: TextStyle(
                                fontSize: 14,
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
                  //Space
                  SizedBox(
                    height: 30,
                  ),
                  //
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            confirmDialogue();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline1
                                      .color),
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Report",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline5
                                      .color),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void confirmDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: EdgeInsets.all(30),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //
                  Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Confirmation",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7),
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: new TextSpan(
                              text:
                                  "Do you really want to delete this conservation?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 30,
                  ),
                  //
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline1
                                      .color),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
