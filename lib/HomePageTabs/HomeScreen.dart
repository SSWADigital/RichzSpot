import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homital/DoctorListScreenTabs/DokterTelehealth.dart';
import 'package:homital/ModelClasses/Models.dart';
import 'package:homital/UI/BasicHeathScreen.dart';
import 'package:homital/UI/ChatWithDoctorScreen2.dart';
import 'package:homital/UI/DoctorListScreen.dart';
import 'package:homital/UI/doktertelehalth1.dart';
import 'dart:async';
import 'package:homital/Widget/LocateYourCity.dart';
import 'package:homital/UI/ChatWithDoctorScreen1.dart';
import 'package:homital/UI/NewsScreen.dart';
import 'package:homital/UI/CategoriesScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:homital/Widget/ServiceWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FToast fToast;
  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Theme.of(context).textTheme.headline1.color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check, color: Theme.of(context).textTheme.subtitle2.color),
          SizedBox(
            width: 7.0,
          ),
          Text(
            "Tap Untuk Keluar",
            style: TextStyle(
                fontSize: 15,
                fontFamily: "medium",
                color: Theme.of(context).textTheme.subtitle2.color),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
  }

  int backPressCounter = 1;
  int backPressTotal = 2;
  Future<bool> onWillPop() {
    if (backPressCounter < 2) {
      _showToast();
      backPressCounter++;
      Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
        backPressCounter--;
      });
      return Future.value(false);
    } else {
      Future.value(true);
      SystemNavigator.pop();
    }
  }

  String loc;

  Widget list1Items() {
    return Container(
      child: Row(
        children: List.generate(homeScreenHomitelList.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.4 - 30,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    Positioned.directional(
                      end: -20,
                      top: -30,
                      textDirection: Directionality.of(context),
                      child: Container(
                          child: Image.asset(
                        homeScreenHomitelList[index].image,
                        scale: 5,
                      )),
                    ),
                    //
                    Positioned.directional(
                      start: 15,
                      end: 8,
                      top: 90,
                      textDirection: Directionality.of(context),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          homeScreenHomitelList[index].title,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline4
                                  .color),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            //Space
            SizedBox(
              height: 20,
            ),
            //Homitel
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  Container(child: Image.asset("assets/icons/swa1.png")
                      //  RichText(
                      //   text: new TextSpan(
                      //       text: "D",
                      //       style: TextStyle(fontSize: 30, color: Colors.blue[900]

                      //           // Theme.of(context)
                      //           //     .accentTextTheme
                      //           //     .headline2
                      //           //     .color
                      //           ),
                      //       children: [
                      //         TextSpan(
                      //           text: "ua1Care",
                      //           style: TextStyle(fontSize: 27, color: Colors.blue

                      //               // Theme.of(context)
                      //               //     .accentTextTheme
                      //               //     .headline1
                      //               //     .color
                      //               ),
                      //         )
                      //       ]),
                      // ),
                      ),
                  //
                  InkWell(
                    onTap: () {
                      locationDialogue();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/ic_loc3.png",
                            scale: 26,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              loc == null ? "Surakarta" : loc,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                          Image.asset(
                            "assets/icons/ic_drop_arrow.png",
                            scale: 9,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 22,
            ),
            //What are you looking for?
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                "Apa yang sedang anda cari?",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: "medium",
                    color: Theme.of(context).accentTextTheme.headline2.color),
              ),
            ),
            //Space
            SizedBox(
              height: 12,
            ),
            //Horizontal listView
            Container(
                height: 150,
                padding: EdgeInsets.only(left: 6),
                child: ListView(
                  // shrinkWrap: true,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      child: ListView.builder(
                          itemCount: homeScreenHomitelList.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: 8, right: 10, top: 10, bottom: 40),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                          context,
                                          SlidePageRoute(
                                              page: DoctorListScreen()));
                                    } else if (index == 1) {
                                      Navigator.push(
                                          context,
                                          SlidePageRoute(
                                              page:
                                                  doktertelehalth1())); // DokterTelehealth //ChatWithDoctorScreen1
                                    } else if (index == 2) {
                                      Navigator.push(
                                          context,
                                          SlidePageRoute(
                                              page: CategoriesScreen(
                                            title: "Search",
                                          )));
                                    }
                                    // else if (index == 3) {
                                    //   Navigator.push(
                                    //       context,
                                    //       SlidePageRoute(
                                    //           page: ChatWithDoctorScreen1()));
                                    // }
                                  },
                                  child: Container(
                                    height: 155,
                                    width: 112,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      fit: StackFit.expand,
                                      children: [
                                        Positioned.directional(
                                          // end: -20,
                                          // top: -25,
                                          textDirection:
                                              Directionality.of(context),
                                          child: Container(
                                              child: Image.asset(
                                            homeScreenHomitelList[index].image,
                                            scale: 6,
                                          )),
                                        ),
                                        //
                                        Positioned.directional(
                                          start: 17,
                                          end: 10,
                                          top: 100,
                                          textDirection:
                                              Directionality.of(context),
                                          child: Container(
                                            padding: EdgeInsets.only(),
                                            alignment: Alignment.center,
                                            child: Text(
                                              homeScreenHomitelList[index]
                                                  .title,
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline3
                                                      .color),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    //
                    SizedBox(
                      width: 18,
                    ),
                  ],
                )),
            //Space
            SizedBox(height: 12),
            //Disease: COVID-19
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Disease: COVID-19",
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontFamily: "medium",
            //         color: Theme.of(context).accentTextTheme.headline2.color),
            //   ),
            // ),
            //Space
            SizedBox(
              height: 12,
            ),
            //Horizontal listView
            // Container(
            //     height: 170,
            //     padding: EdgeInsets.only(left: 4),
            //     child: ListView(
            //       // shrinkWrap: true,
            //       physics: BouncingScrollPhysics(
            //           parent: AlwaysScrollableScrollPhysics()),
            //       scrollDirection: Axis.horizontal,
            //       children: [
            //         ListView.builder(
            //             itemCount: homeScreenDiseaseList.length,
            //             shrinkWrap: true,
            //             physics: ClampingScrollPhysics(),
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context, index) {
            //               return Container(
            //                 margin: EdgeInsets.symmetric(horizontal: 10),
            //                 child: Card(
            //                   elevation: 4,
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(15)),
            //                   child: Container(
            //                     height: 175,
            //                     width: 195,
            //                     padding: EdgeInsets.symmetric(vertical: 7),
            //                     child: Column(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         //1st
            //                         Container(
            //                           height: 30,
            //                           margin:
            //                               EdgeInsets.symmetric(horizontal: 10),
            //                           decoration: BoxDecoration(
            //                               border: Border(
            //                                   bottom: BorderSide(
            //                                       width: 0.7,
            //                                       color: Theme.of(context)
            //                                           .primaryTextTheme
            //                                           .headline3
            //                                           .color))),
            //                           child: Row(
            //                             children: [
            //                               //
            //                               Container(
            //                                 width: 18,
            //                                 height: 14,
            //                                 decoration: BoxDecoration(
            //                                     borderRadius:
            //                                         BorderRadius.circular(4),
            //                                     image: DecorationImage(
            //                                         fit: BoxFit.cover,
            //                                         image: AssetImage(
            //                                             homeScreenDiseaseList[
            //                                                     index]
            //                                                 .image))),
            //                               ),
            //                               Expanded(
            //                                 child: Container(
            //                                   padding: EdgeInsets.symmetric(
            //                                       horizontal: 7),
            //                                   child: Text(
            //                                     homeScreenDiseaseList[index]
            //                                         .title,
            //                                     style: TextStyle(
            //                                         fontSize: 13,
            //                                         fontFamily: "medium",
            //                                         color: Theme.of(context)
            //                                             .accentTextTheme
            //                                             .headline3
            //                                             .color),
            //                                   ),
            //                                 ),
            //                               ),
            //                               Image.asset(
            //                                 "assets/icons/ic_forward_2.png",
            //                                 scale: 25,
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         //2nd
            //                         Container(
            //                           height: 30,
            //                           width: double.infinity,
            //                           margin: EdgeInsets.symmetric(
            //                             horizontal: 10,
            //                           ),
            //                           padding: EdgeInsets.symmetric(
            //                             horizontal: 10,
            //                           ),
            //                           decoration: BoxDecoration(
            //                             color: Theme.of(context)
            //                                 .accentTextTheme
            //                                 .headline1
            //                                 .color
            //                                 .withOpacity(0.3),
            //                             borderRadius: BorderRadius.circular(4),
            //                           ),
            //                           alignment: Alignment.centerLeft,
            //                           child: Text(
            //                             homeScreenDiseaseList[index].infected,
            //                             style: TextStyle(
            //                                 fontSize: 13,
            //                                 fontFamily: "medium",
            //                                 color: Theme.of(context)
            //                                     .accentTextTheme
            //                                     .headline1
            //                                     .color),
            //                           ),
            //                         ),
            //                         //3rd
            //                         Container(
            //                           height: 30,
            //                           width: double.infinity,
            //                           margin: EdgeInsets.symmetric(
            //                             horizontal: 10,
            //                           ),
            //                           padding: EdgeInsets.symmetric(
            //                             horizontal: 10,
            //                           ),
            //                           decoration: BoxDecoration(
            //                             color: Theme.of(context)
            //                                 .accentTextTheme
            //                                 .headline6
            //                                 .color
            //                                 .withOpacity(0.3),
            //                             borderRadius: BorderRadius.circular(4),
            //                           ),
            //                           alignment: Alignment.centerLeft,
            //                           child: Text(
            //                             homeScreenDiseaseList[index].cured,
            //                             textAlign: TextAlign.left,
            //                             style: TextStyle(
            //                                 fontSize: 13,
            //                                 fontFamily: "medium",
            //                                 color: Theme.of(context)
            //                                     .accentTextTheme
            //                                     .headline6
            //                                     .color),
            //                           ),
            //                         ),
            //                         //4th
            //                         Container(
            //                           height: 30,
            //                           width: double.infinity,
            //                           margin: EdgeInsets.symmetric(
            //                             horizontal: 10,
            //                           ),
            //                           padding: EdgeInsets.symmetric(
            //                             horizontal: 10,
            //                           ),
            //                           decoration: BoxDecoration(
            //                             color: Theme.of(context)
            //                                 .primaryTextTheme
            //                                 .headline2
            //                                 .color
            //                                 .withOpacity(0.3),
            //                             borderRadius: BorderRadius.circular(4),
            //                           ),
            //                           alignment: Alignment.centerLeft,
            //                           child: Text(
            //                             homeScreenDiseaseList[index].dead,
            //                             style: TextStyle(
            //                                 fontSize: 13,
            //                                 fontFamily: "medium",
            //                                 color: Theme.of(context)
            //                                     .textTheme
            //                                     .headline1
            //                                     .color),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             }),
            //         //
            //         SizedBox(
            //           width: 18,
            //         ),
            //       ],
            //     )),
            //Space
            SizedBox(
              height: 20,
            ),
            //Check-up Package & more
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Promo Menarik",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // serviceDialogue();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline5
                              .color
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Lihat Semua",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline5
                                      .color),
                            ),
                          ),
                          Image.asset(
                            "assets/icons/ic_forward.png",
                            scale: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 14,
            ),
            //Horizontal listView
            Container(
                height: 215,
                padding: EdgeInsets.only(left: 6),
                child: ListView(
                  // shrinkWrap: true,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     SlidePageRoute(
                                  //         page: BasicHealthScreen()));
                                },
                                child: Container(
                                    height: 215,
                                    width: 270,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 9),
                                    child: Column(
                                      children: [
                                        //img
                                        Container(
                                          height: 100,
                                          // width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/imgs/promo.png"))),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Promo Menarik Paket Hemat\nCheck-up untuk Keluarga",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: "medium",
                                                        color: Theme.of(context)
                                                            .accentTextTheme
                                                            .headline3
                                                            .color),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 5),
                                                        child: Text(
                                                          "Detail",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "medium",
                                                              color: Theme.of(
                                                                      context)
                                                                  .accentTextTheme
                                                                  .headline5
                                                                  .color),
                                                        ),
                                                      ),
                                                      Image.asset(
                                                        "assets/icons/ic_forward.png",
                                                        scale: 48,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          );
                        }),
                    //
                    SizedBox(
                      width: 2,
                    ),
                  ],
                )),
            //News & more
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Artikel",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, SlidePageRoute(page: NewsScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline5
                              .color
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "More",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline5
                                      .color),
                            ),
                          ),
                          Image.asset(
                            "assets/icons/ic_forward.png",
                            scale: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Horizontal listView
            Container(
                height: 215,
                padding: EdgeInsets.only(left: 6),
                child: ListView(
                  // shrinkWrap: true,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      SlidePageRoute(page: NewsScreen()));
                                },
                                child: Container(
                                    height: 215,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      children: [
                                        //
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/imgs/checkup.jpg"))),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 8, left: 4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Apakah Indonesia siap untuk"
                                                    " wabah COVID-19?",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: "medium",
                                                        color: Theme.of(context)
                                                            .accentTextTheme
                                                            .headline3
                                                            .color),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 5),
                                                        child: Text(
                                                          "Detail",
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              fontFamily:
                                                                  "medium",
                                                              color: Theme.of(
                                                                      context)
                                                                  .accentTextTheme
                                                                  .headline5
                                                                  .color),
                                                        ),
                                                      ),
                                                      Image.asset(
                                                        "assets/icons/ic_forward.png",
                                                        scale: 50,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          );
                        }),
                    //
                    SizedBox(
                      width: 18,
                    ),
                  ],
                )),
            //Specialist
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Specialist",
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontFamily: "medium",
            //         color: Theme.of(context).accentTextTheme.headline2.color),
            //   ),
            // ),
            //list
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   height: 200,
            //   width: MediaQuery.of(context).size.width * 1 + 100,
            //   child: ListView(
            //     shrinkWrap: true,
            //     physics: BouncingScrollPhysics(
            //         parent: AlwaysScrollableScrollPhysics()),
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       Container(
            //         width: 390,
            //         child: Wrap(
            //             spacing: 10,
            //             runSpacing: 10,
            //             children:
            //                 List.generate(homeScreenTestList.length, (index) {
            //               return Container(
            //                 width: 123,
            //                 child: Card(
            //                   elevation: 3,
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(12)),
            //                   child: InkWell(
            //                     onTap: () {
            //                       Navigator.push(
            //                           context,
            //                           SlidePageRoute(
            //                               page: CategoriesScreen(
            //                             title: "Search",
            //                           )));
            //                     },
            //                     child: Container(
            //                       height: 75,
            //                       padding: EdgeInsets.symmetric(horizontal: 10),
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Image.asset(
            //                             homeScreenTestList[index].image,
            //                             scale: 21,
            //                           ),
            //                           Container(
            //                             padding: EdgeInsets.only(top: 5),
            //                             child: Text(
            //                               homeScreenTestList[index].title,
            //                               overflow: TextOverflow.ellipsis,
            //                               style: TextStyle(
            //                                   fontSize: 14,
            //                                   fontFamily: "medium",
            //                                   color: Theme.of(context)
            //                                       .accentTextTheme
            //                                       .headline3
            //                                       .color),
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             })),
            //       ),
            //     ],
            //   ),
            // ),
            //
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  void locationDialogue() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        builder: (ctx) {
          return LocateYourCity();
        }).then((value) {
      setState(() {
        loc = value;
      });
    });
  }

  void serviceDialogue() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        builder: (ctx) {
          return ServiceWidget();
        });
  }
}
