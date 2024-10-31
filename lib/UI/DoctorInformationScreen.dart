import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homital/Theme/theme.dart';
import 'package:homital/UI/AddCard.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'ChatScreen.dart';

class DoctorInformationScreen extends StatefulWidget {
  @override
  _DoctorInformationScreenState createState() =>
      _DoctorInformationScreenState();
}

class _DoctorInformationScreenState extends State<DoctorInformationScreen> {
  bool shotTextDetail = false;
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
                            "Informasi Dokter",
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
                //
                Expanded(
                  child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        //Space
                        SizedBox(
                          height: 12,
                        ),
                        //Dr.
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //
                                      Container(
                                        child: Text(
                                          "Dr. Helena Wijaya",
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "medium",
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline2
                                                  .color),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        child: Text(
                                          "Dokter Umum",
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              fontFamily: "medium",
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline3
                                                  .color),
                                        ),
                                      ),
                                      //status Aktif
                                      // Container(
                                      //   child: Row(
                                      //     children: [
                                      //       Image.asset(
                                      //         "assets/icons/ic_active.png",
                                      //         scale: 40,
                                      //       ),
                                      //       Container(
                                      //         padding: EdgeInsets.only(left: 7),
                                      //         child: Text("Active now",
                                      //             style: TextStyle(
                                      //                 fontSize: 11,
                                      //                 fontFamily: "medium",
                                      //                 color: Theme.of(context)
                                      //                     .accentTextTheme
                                      //                     .headline6
                                      //                     .color)),
                                      //       )
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("assets/imgs/dc1.png"))),
                              )
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 12,
                        ),
                        //Divider
                        Divider(
                          height: 1,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline3
                              .color,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        //Advice time and Appreciated
                        Container(
                          padding: EdgeInsets.only(
                              left: 16, right: 10, top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  //Advice time
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Icon(Icons.star),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              "4.5",
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
                                  ),
                                  //Appreciated
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Icon(Icons.work),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              "2 Tahun",
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
                                  ),
                                  //
                                  // Expanded(
                                  //   child: Container(
                                  //       alignment: Alignment.centerRight,
                                  //       child: InkWell(
                                  //           onTap: () {
                                  //             selectPayment();
                                  //             FocusScope.of(context)
                                  //                 .requestFocus(FocusNode());

                                  // Navigator.push(
                                  //     context,
                                  //     SlidePageRoute(
                                  //         page: ChatScreen()));
                                  //           },
                                  //           child: Image.asset(
                                  //             "assets/icons/ic_chat_2.png",
                                  //             scale: 9,
                                  //           ))),
                                  // ),
                                ],
                              ),
                              Container(
                                color: Colors.blue[50],
                                padding: EdgeInsets.only(right: 270),
                                child: Text(
                                  "Rp.10.000",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline2
                                          .color),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Divider
                        Divider(
                          height: 1,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline3
                              .color,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        //Profile
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          child: Text(
                            "Profile",
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
                        Container(
                          padding: EdgeInsets.only(left: 12, right: 16),
                          child: Column(
                            children: [
                              //
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/icons/ic_doctor_1.png",
                                        scale: 8,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //Work Position
                                          Container(
                                            child: Text(
                                              "Alumni",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline3
                                                      .color),
                                            ),
                                          ),
                                          //Work as Dean
                                          Container(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              "Universitas Gajah Mada (UGM)",
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
                                    ))
                                  ],
                                ),
                              ),
                              //
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/icons/ic_hospital_1.png",
                                        scale: 8,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          //Work Position
                                          Container(
                                            child: Text(
                                              "Praktik di",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline3
                                                      .color),
                                            ),
                                          ),
                                          //Work as Dean
                                          Container(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              "Rs.Indriati",
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
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/icons/garuda.png",
                                        scale: 8,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          //Work Position
                                          Container(
                                            child: Text(
                                              "Nomer STR",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline3
                                                      .color),
                                            ),
                                          ),
                                          //Work as Dean
                                          Container(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              "3411100118180434",
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
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Specialist
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                        //   child: Text("Specialist",
                        //     style: TextStyle(
                        //         fontSize: 17,
                        //         fontWeight: FontWeight.w700,
                        //         fontFamily: "medium",
                        //         color: Theme.of(context).accentTextTheme.headline2.color
                        //     ),),
                        // ),

                        //wrap

                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        //   child: Wrap(
                        //     direction: Axis.horizontal,
                        //     alignment: WrapAlignment.start,
                        //     runSpacing: 15.0,
                        //     spacing: 15.0,
                        //     children: [
                        //       Container(
                        //         padding: EdgeInsets.symmetric(horizontal: 8,),
                        //         width: 140,
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //           color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                        //           borderRadius: BorderRadius.circular(5)
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Image.asset("assets/icons/ic_endocrine.png",scale: 25,),
                        //             Container(
                        //               padding: EdgeInsets.only(left: 10),
                        //               child: Text("Orthopodist",
                        //               style: TextStyle(
                        //                 fontSize: 14,
                        //                 fontFamily: "medium",
                        //                 color: Theme.of(context).accentTextTheme.headline5.color
                        //               ),),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.symmetric(horizontal: 8,),
                        //         width: 110,
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //             color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                        //             borderRadius: BorderRadius.circular(5)
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Image.asset("assets/icons/ic_heart.png",scale: 25,),
                        //             Container(
                        //               padding: EdgeInsets.only(left: 10),
                        //               child: Text("Surgeon",
                        //                 style: TextStyle(
                        //                     fontSize: 14,
                        //                     fontFamily: "medium",
                        //                     color: Theme.of(context).accentTextTheme.headline5.color
                        //                 ),),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.symmetric(horizontal: 8,),
                        //         width: 110,
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //             color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                        //             borderRadius: BorderRadius.circular(5)
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Image.asset("assets/icons/ic_dentist.png",scale: 25,),
                        //             Container(
                        //               padding: EdgeInsets.only(left: 10),
                        //               child: Text("Dentist",
                        //                 style: TextStyle(
                        //                     fontSize: 14,
                        //                     fontFamily: "medium",
                        //                     color: Theme.of(context).accentTextTheme.headline5.color
                        //                 ),),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.symmetric(horizontal: 8,),
                        //         width: 110,
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //             color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                        //             borderRadius: BorderRadius.circular(5)
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Image.asset("assets/icons/ic_nutrition.png",scale: 25,),
                        //             Container(
                        //               padding: EdgeInsets.only(left: 10),
                        //               child: Text("Nutrition",
                        //                 style: TextStyle(
                        //                     fontSize: 14,
                        //                     fontFamily: "medium",
                        //                     color: Theme.of(context).accentTextTheme.headline5.color
                        //                 ),),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.symmetric(horizontal: 8,),
                        //         width: 140,
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //             color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                        //             borderRadius: BorderRadius.circular(5)
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Image.asset("assets/icons/ic_dermatology.png",scale: 25,),
                        //             Container(
                        //               padding: EdgeInsets.only(left: 10),
                        //               child: Text("Dermatology",
                        //                 style: TextStyle(
                        //                     fontSize: 14,
                        //                     fontFamily: "medium",
                        //                     color: Theme.of(context).accentTextTheme.headline5.color
                        //                 ),),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //Most recent
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                        //   child: Text("Most recent",
                        //     style: TextStyle(
                        //         fontSize: 17,
                        //         fontWeight: FontWeight.w700,
                        //         fontFamily: "medium",
                        //         color: Theme.of(context).accentTextTheme.headline2.color
                        //     ),),
                        // ),
                        //Dear doctor..
                        // Container(
                        //   width: double.infinity,
                        //   margin: EdgeInsets.symmetric(horizontal: 16,),
                        //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       width: 1,
                        //       color: Theme.of(context).primaryTextTheme.headline3.color
                        //     ),
                        //     borderRadius: BorderRadius.circular(7)
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         child: Text("Dear doctor, me is Dimitri, when i want to"
                        //             "rush B, i just say one, two, three. Don't take the awp but just a p90?,",
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w700,
                        //           fontFamily: "medium",
                        //           color: Theme.of(context).accentTextTheme.headline2.color
                        //         ),),
                        //       ),
                        //       //Space
                        //       SizedBox(height: 20,),
                        //       //
                        //       Container(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Container(
                        //               child: Text("Male, 29 Years old",
                        //               style: TextStyle(
                        //                 fontSize: 12,
                        //                 fontFamily: "medium",
                        //                   color: Theme.of(context).accentTextTheme.headline3.color
                        //               ),),
                        //             ),
                        //             Container(
                        //               child: Text("3 days ago",
                        //                 style: TextStyle(
                        //                     fontSize: 12,
                        //                     fontFamily: "medium",
                        //                     color: Theme.of(context).accentTextTheme.headline3.color
                        //                 ),),
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        //Space
                        SizedBox(
                          height: 18,
                        ),
                        //Dr. Dimitri
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //         width: 45,
                        //         height: 45,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(7),
                        //             image: DecorationImage(
                        //                 fit: BoxFit.cover,
                        //                 image: AssetImage(
                        //                     "assets/imgs/checkup.jpg"))),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           height: 45,
                        //           padding: EdgeInsets.only(left: 15),
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Container(
                        //                 child: Text(
                        //                   "Dr.Helena Wijaya",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       fontWeight: FontWeight.w700,
                        //                       fontFamily: "medium",
                        //                       color: Theme.of(context)
                        //                           .accentTextTheme
                        //                           .headline3
                        //                           .color),
                        //                 ),
                        //               ),
                        //               //star
                        //               Container(
                        //                 child: Row(
                        //                   children: [
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(
                        //                           right: 3),
                        //                       child: Image.asset(
                        //                         "assets/icons/ic_star.png",
                        //                         scale: 32,
                        //                       ),
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(
                        //                           right: 3),
                        //                       child: Image.asset(
                        //                         "assets/icons/ic_star.png",
                        //                         scale: 32,
                        //                       ),
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(
                        //                           right: 3),
                        //                       child: Image.asset(
                        //                         "assets/icons/ic_star.png",
                        //                         scale: 32,
                        //                       ),
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(
                        //                           right: 3),
                        //                       child: Image.asset(
                        //                         "assets/icons/ic_star.png",
                        //                         scale: 32,
                        //                       ),
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(
                        //                           right: 3),
                        //                       child: Image.asset(
                        //                         "assets/icons/ic_star.png",
                        //                         scale: 32,
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        //Space
                        // SizedBox(height: 15,),
                        // //Dear patient...
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        //   child: Wrap(
                        //     children: [
                        //       Text("Dear patient Dimitri, my name is Petrenko, i play KLow, "
                        //           "with same good moloko, i plant the potato, in this yacky lame, every "
                        //           "one is my friend, Lorem ipsum dolor sit amet, consectetur adipiscing "
                        //           "elit. Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                        //           "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. ",
                        //         maxLines: shotTextDetail ? 10 : 4,
                        //         style: TextStyle(
                        //             fontSize: 13,
                        //             fontWeight: FontWeight.w700,
                        //             fontFamily: "medium",
                        //             color: Theme.of(context).accentTextTheme.headline3.color
                        //         ),),
                        //       InkWell(
                        //         onTap: (){
                        //           setState(() {
                        //             shotTextDetail =! shotTextDetail;
                        //           });
                        //         },
                        //         child: Row(
                        //           children: [
                        //             Text(shotTextDetail ? "Close": "Detail",
                        //               style: TextStyle(
                        //                   fontSize: 13,
                        //                   fontWeight: FontWeight.w700,
                        //                   fontFamily: "medium",
                        //                   color: Theme.of(context).accentTextTheme.headline5.color
                        //               ),
                        //             ),
                        //             Image.asset("assets/icons/ic_forward.png",scale: 50,),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //Space
                        // SizedBox(height: 20,),
                        // //Dear doctor..
                        // Container(
                        //   width: double.infinity,
                        //   margin: EdgeInsets.symmetric(horizontal: 16,),
                        //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(
                        //           width: 1,
                        //           color: Theme.of(context).primaryTextTheme.headline3.color
                        //       ),
                        //       borderRadius: BorderRadius.circular(7)
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         child: Text("Dear doctor, me is Dimitri, when i want to"
                        //             "rush B, i just say one, two, three. Don't take the awp but just a p90?,",
                        //           style: TextStyle(
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.w700,
                        //               fontFamily: "medium",
                        //               color: Theme.of(context).accentTextTheme.headline2.color
                        //           ),),
                        //       ),
                        //       //Space
                        //       SizedBox(height: 20,),
                        //       //
                        //       Container(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Container(
                        //               child: Text("Male, 29 Years old",
                        //                 style: TextStyle(
                        //                     fontSize: 12,
                        //                     fontFamily: "medium",
                        //                     color: Theme.of(context).accentTextTheme.headline3.color
                        //                 ),),
                        //             ),
                        //             Container(
                        //               child: Text("3 days ago",
                        //                 style: TextStyle(
                        //                     fontSize: 12,
                        //                     fontFamily: "medium",
                        //                     color: Theme.of(context).accentTextTheme.headline3.color
                        //                 ),),
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // //Space
                        // SizedBox(height: 18,),
                        // //Dr. Dimitri
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //         width: 45,
                        //         height: 45,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(7),
                        //             image: DecorationImage(
                        //                 fit: BoxFit.cover,
                        //                 image: AssetImage("assets/imgs/checkup.jpg")
                        //             )
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           height: 45,
                        //           padding: EdgeInsets.only(left: 15),
                        //           child: Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Container(
                        //                 child: Text("Dr. Dimitri Petrenko",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       fontWeight: FontWeight.w700,
                        //                       fontFamily: "medium",
                        //                       color: Theme.of(context).accentTextTheme.headline4.color
                        //                   ),),
                        //               ),
                        //               //star
                        //               Container(
                        //                 child: Row(
                        //                   children: [
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(right: 3),
                        //                       child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(right: 3),
                        //                       child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(right: 3),
                        //                       child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(right: 3),
                        //                       child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(right: 3),
                        //                       child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // //Space
                        // SizedBox(height: 15,),
                        // //Dear patient...
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        //   child: Wrap(
                        //     children: [
                        //       Text("Dear patient Dimitri, my name is Petrenko, i play KLow, "
                        //           "with same good moloko, i plant the potato, in this yacky lame, every "
                        //           "one is my friend, Lorem ipsum dolor sit amet, consectetur adipiscing "
                        //           "elit. Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                        //           "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. ",
                        //         maxLines: shotTextDetail ? 10 : 4,
                        //         style: TextStyle(
                        //             fontSize: 13,
                        //             fontWeight: FontWeight.w700,
                        //             fontFamily: "medium",
                        //             color: Theme.of(context).accentTextTheme.headline3.color
                        //         ),),
                        //       InkWell(
                        //         onTap: (){
                        //           setState(() {
                        //             shotTextDetail =! shotTextDetail;
                        //           });
                        //         },
                        //         child: Row(
                        //           children: [
                        //             Text(shotTextDetail ? "Close": "Detail",
                        //               style: TextStyle(
                        //                   fontSize: 13,
                        //                   fontWeight: FontWeight.w700,
                        //                   fontFamily: "medium",
                        //                   color: Theme.of(context).accentTextTheme.headline5.color
                        //               ),
                        //             ),
                        //             Image.asset("assets/icons/ic_forward.png",scale: 50,),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //Space
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
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
                          Navigator.push(context,
                              SlidePageRoute(page: ChatScreen())); //ChatScreen
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        color: Colors.blue,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Chat",
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

void selectPayment() {
  showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      )),
      builder: (ctx) {
        return SelectPaymentWidget();
      });
}

class SelectPaymentWidget extends StatefulWidget {
  @override
  _SelectPaymentWidgetState createState() => _SelectPaymentWidgetState();
}

class _SelectPaymentWidgetState extends State<SelectPaymentWidget> {
  var _selectedItem;
  bool isTap = false;
  onSwitch(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  List cardList = [
    "Visa / Master card",
    "Domestic ATM",
    "E - Wallet",
    "Cash",
  ];

  //
  Container cardWidget() {
    return Container(
        child: Column(
      children: List.generate(
          cardList.length,
          (index) => Container(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      onSwitch(index);
                      _selectedItem = index;
                      isTap = true;
                    });
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline4
                                    .color))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            cardList[index],
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: _selectedItem == index
                                    ? Theme.of(context)
                                        .accentTextTheme
                                        .headline2
                                        .color
                                    : Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .color),
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: Radio(
                            value: index,
                            onChanged: (val) {
                              setState(() {
                                _selectedItem = index;
                              });
                            },
                            groupValue: _selectedItem,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: 470,
      child: Column(
        children: [
          //Space
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/icons/ic_dolor.png",
            scale: 6,
          ),
          //Space
          SizedBox(
            height: 10,
          ),
          //Select Payment Method
          Container(
            alignment: Alignment.center,
            child: Text(
              "Select Payment Method",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color),
            ),
          ),
          //Space
          SizedBox(
            height: 8,
          ),
          //Choose Payment method on your demand
          Container(
            alignment: Alignment.center,
            child: Text(
              "Choose Payment method on your\ndemand",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline4.color),
            ),
          ),
          //Space
          SizedBox(
            height: 30,
          ),
          //
          cardWidget(),
          //Space
          SizedBox(
            height: 40,
          ),
          //Select
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 44,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (isTap == true) {
                        Navigator.pop(context);
                        Navigator.push(
                            context, SlidePageRoute(page: AddCard()));
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: isTap
                        ? Theme.of(context).accentTextTheme.headline1.color
                        : Theme.of(context).primaryTextTheme.headline3.color,
                    elevation: 0,
                    highlightElevation: 0,
                    child: Container(
                      child: Text(
                        "Select",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.subtitle2.color,
                            fontSize: 15,
                            fontFamily: 'medium'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
