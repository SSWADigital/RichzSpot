import 'package:flutter/material.dart';
import 'package:homital/Theme/theme.dart';
import 'package:homital/UI/ChatScreen.dart';
import 'package:homital/UI/ChatWithDoctorScreen2.dart';
import 'package:homital/animation/SlideRightRoute.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
      "timing": "32 menit",
      "color": 0xFF4285f4,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            //Schedule
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                "Riwayat",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    fontFamily: "medium",
                    color: Theme.of(context).accentTextTheme.headline2.color),
              ),
            ),
            Expanded(
                child: ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                //Wait for pay - 1
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Menunggu pembayaran",
                //     style: TextStyle(
                //         fontSize: 19,
                //         fontFamily: "medium",
                //         color:
                //             Theme.of(context).accentTextTheme.headline2.color),
                //   ),
                // ),
                // //Space
                // SizedBox(
                //   height: 4,
                // ),
                // //card
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Card(
                //     elevation: 4,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10)),
                //     margin: EdgeInsets.zero,
                //     child: Container(
                //       height: 125,
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //       child: Row(
                //         children: [
                //           //
                //           Container(
                //             width: 90,
                //             height: double.infinity,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(7),
                //                 image: DecorationImage(
                //                     fit: BoxFit.cover,
                //                     image:
                //                         AssetImage("assets/imgs/checkup.jpg"))),
                //           ),
                //           Expanded(
                //             child: Container(
                //               padding: EdgeInsets.symmetric(horizontal: 12),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   //
                //                   Container(
                //                     child: Text(
                //                       "Paket Pemeriksaan Kesehatan Standar",
                //                       style: TextStyle(
                //                           fontSize: 15,
                //                           fontFamily: "medium",
                //                           color: Theme.of(context)
                //                               .accentTextTheme
                //                               .headline2
                //                               .color),
                //                     ),
                //                   ),
                //                   //
                //                   Container(
                //                     child: Text(
                //                       "Dimitri Petrenko",
                //                       style: TextStyle(
                //                           fontSize: 15,
                //                           fontFamily: "medium",
                //                           color: Theme.of(context)
                //                               .accentTextTheme
                //                               .headline3
                //                               .color),
                //                     ),
                //                   ),
                //                   //
                //                   // Container(
                //                   //   margin: EdgeInsets.only(bottom: 3),
                //                   //   width:
                //                   //       MediaQuery.of(context).size.width * 0.3,
                //                   //   height: 17,
                //                   //   decoration: BoxDecoration(
                //                   //       color: Theme.of(context)
                //                   //           .accentTextTheme
                //                   //           .headline1
                //                   //           .color),
                //                   // ),
                //                 ],
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //Ongoin
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Ongoing",
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontFamily: "medium",
                //         color:
                //             Theme.of(context).accentTextTheme.headline2.color),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
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
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/imgs/dc1.png"))),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned.directional(
                                        textDirection:
                                            Directionality.of(context),
                                        top: -1,
                                        end: 0,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Dr.Eva Natalia ",
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
                                            "Chat dengan Dokter",
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
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.amber[100],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Proses",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "medium",
                                          color: Colors.amber[900]),
                                    ),
                                  ),
                                ),
                                //
                                InkWell(
                                  onTap: () {
                                    // conservationDialogue();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
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
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //
                                Container(
                                  child: Text(
                                    "Menunggu Pembayaran",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "medium",
                                        color: Colors.blue),
                                  ),
                                ),
                                //
                                Container(
                                  child: Text(
                                    "3 menit",
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
                ),

                //

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
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
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/imgs/dc3.png"))),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned.directional(
                                        textDirection:
                                            Directionality.of(context),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Dr. Erlita Kartikasari",
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
                                            "Telehealth",
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

                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Berlangsung",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "medium",
                                          color: Colors.green),
                                    ),
                                  ),
                                ),

                                //
                                InkWell(
                                  onTap: () {
                                    // conservationDialogue();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
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
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //
                                Container(
                                  child: Text(
                                    "Sedang Berjalan ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "medium",
                                        color: Color(0xFF4CAF50)),
                                  ),
                                ),
                                //
                                Container(
                                  child: Text(
                                    "32 menit",
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
                ),

                ///
                ///
                ///
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
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
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/imgs/d3.png"))),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      // Positioned.directional(
                                      //   textDirection:
                                      //       Directionality.of(context),
                                      //   top: -1,
                                      //   end: 0,
                                      //   child: Container(
                                      //     width: 12,
                                      //     height: 12,
                                      //     decoration: BoxDecoration(
                                      //         shape: BoxShape.circle,
                                      //         color: Theme.of(context)
                                      //             .accentTextTheme
                                      //             .headline6
                                      //             .color),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Dr. Tri Ajika ",
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
                                            "Janji temu Dokter",
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
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Selesai",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "medium",
                                          color: Colors.blue[900]),
                                    ),
                                  ),
                                ),
                                //
                                InkWell(
                                  onTap: () {
                                    // conservationDialogue();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
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
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //
                                Container(
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "medium",
                                        color: Color(0xFF4CAF50)),
                                  ),
                                ),
                                //
                                Container(
                                  child: Text(
                                    "03/03/2022",
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
                ),
                //

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
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
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/imgs/d2.png"))),
                                  // child: Stack(
                                  //   clipBehavior: Clip.none,
                                  //   children: [
                                  //     Positioned.directional(
                                  //       textDirection:
                                  //           Directionality.of(context),
                                  //       top: -1,
                                  //       end: 0,
                                  //       child:
                                  //        Container(
                                  //         width: 12,
                                  //         height: 12,
                                  //         decoration: BoxDecoration(
                                  //             shape: BoxShape.circle,
                                  //             color: Theme.of(context)
                                  //                 .accentTextTheme
                                  //                 .headline6
                                  //                 .color),
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Dr. Yoga Hartono",
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
                                            "Chat dengan Dokter",
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
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Selesai",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "medium",
                                          color: Colors.blue[900]),
                                    ),
                                  ),
                                ),
                                //
                                InkWell(
                                  onTap: () {
                                    // conservationDialogue();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
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
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //
                                Container(
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "medium",
                                        color: Color(0xFF4CAF50)),
                                  ),
                                ),
                                //
                                Container(
                                  child: Text(
                                    "23/02/2022",
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
                ),

                // Expanded(
                //   child: Container(
                //     child: ListView(
                //       children: [
                //         //Space
                //         SizedBox(
                //           height: 6,
                //         ),
                //         ListView.builder(
                //             shrinkWrap: true,
                //             physics: ClampingScrollPhysics(),
                //             itemCount: list.length,
                //             itemBuilder: (context, index) {
                //               return InkWell(
                //                 onTap: () {
                //                   Navigator.push(context,
                //                       SlidePageRoute(page: ChatScreen()));
                //                 },
                //                 child: item(
                //                     list[index]["img"],
                //                     list[index]["name"],
                //                     list[index]["activeStatus"],
                //                     list[index]["msgStatus"],
                //                     list[index]["color"],
                //                     list[index]["timing"]),
                //               );
                //             }),
                //         //Space
                //         // SizedBox(
                //         //   height: 50,
                //         // ),
                //         //New Conservation
                //       ],
                //     ),
                //   ),
                // ),
                //card
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Card(
                //     elevation: 4,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10)),
                //     margin: EdgeInsets.zero,
                //     child: Container(
                //       height: 125,
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //       child: Row(
                //         children: [
                //           //
                //           Container(
                //             width: 90,
                //             height: double.infinity,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(7),
                //                 image: DecorationImage(
                //                     fit: BoxFit.cover,
                //                     image:
                //                         AssetImage("assets/imgs/checkup.jpg"))),
                //           ),
                //           Expanded(
                //             child: Container(
                //               padding: EdgeInsets.symmetric(horizontal: 12),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   //
                //                   Container(
                //                     child: Text(
                //                       "Dr.Dimitri Petrenko",
                //                       style: TextStyle(
                //                           fontSize: 15,
                //                           fontFamily: "medium",
                //                           color: Theme.of(context)
                //                               .accentTextTheme
                //                               .headline2
                //                               .color),
                //                     ),
                //                   ),
                //                   //
                //                   Container(
                //                     child: Text(
                //                       "Dimitri Petrenko",
                //                       style: TextStyle(
                //                           fontSize: 15,
                //                           fontFamily: "medium",
                //                           color: Theme.of(context)
                //                               .accentTextTheme
                //                               .headline3
                //                               .color),
                //                     ),
                //                   ),
                //                   //
                //                   Container(
                //                     margin: EdgeInsets.only(bottom: 3),
                //                     width:
                //                         MediaQuery.of(context).size.width * 0.2,
                //                     height: 17,
                //                     decoration: BoxDecoration(
                //                         color: Theme.of(context)
                //                             .accentTextTheme
                //                             .headline5
                //                             .color),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //History
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Riwayat",
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontFamily: "medium",
                //         color:
                //             Theme.of(context).accentTextTheme.headline2.color),
                //   ),
                // ),
                //card
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Card(
                //     elevation: 4,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10)),
                //     margin: EdgeInsets.zero,
                //     child: Container(
                //       height: 125,
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //       child: Row(
                //         children: [
                //           //
                //           Container(
                //             width: 90,
                //             height: double.infinity,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(7),
                //                 image: DecorationImage(
                //                     fit: BoxFit.cover,
                //                     image:
                //                         AssetImage("assets/imgs/checkup.jpg"))),
                //           ),
                //           Expanded(
                //             child: Container(
                //               padding: EdgeInsets.symmetric(horizontal: 12),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   //
                //                   Container(
                //                     child: Text(
                //                       "Paket Pemeriksaan Kesehatan Standar",
                //                       style: TextStyle(
                //                           fontSize: 15,
                //                           fontFamily: "medium",
                //                           color: Theme.of(context)
                //                               .accentTextTheme
                //                               .headline2
                //                               .color),
                //                     ),
                //                   ),
                //                   //
                //                   Container(
                //                     child: Text(
                //                       "Dimitri Petrenko",
                //                       style: TextStyle(
                //                           fontSize: 15,
                //                           fontFamily: "medium",
                //                           color: Theme.of(context)
                //                               .accentTextTheme
                //                               .headline3
                //                               .color),
                //                     ),
                //                   ),
                //                   //
                //                   Container(
                //                     child: Text("Sedang berjalan"),
                //                     margin: EdgeInsets.only(bottom: 3),
                //                     width:
                //                         MediaQuery.of(context).size.width * 0.4,
                //                     height: 17,
                //                     decoration: BoxDecoration(
                //                       color: Colors.blue,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )),
          ],
        ),
      ),
    );
  }

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
                        // conservationDialogue();
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
}
