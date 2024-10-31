import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homital/UI/CategoriesScreen.dart';
import 'package:homital/admin/cek_absen.dart';
import 'package:homital/admin/cek_detail.dart';
import 'package:homital/admin/cek_detail.dart';
import 'package:homital/admin/cek_detail.dart';
import 'package:homital/admin/cek_detail.dart';
import 'package:homital/admin/cek_detail.dart';
import 'package:homital/admin/cek_detail.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:homital/DoctorListScreenTabs/TabScreen1.dart';
import 'package:homital/DoctorListScreenTabs/Endocrine.dart';
import 'package:homital/DoctorListScreenTabs/Dentist.dart';
import 'package:homital/DoctorListScreenTabs/Orthopodist.dart';
import 'package:homital/DoctorListScreenTabs/Surgeon.dart';
import 'package:intl/intl.dart';

// import 'CategoriesScreen.dart';

class cekAbsen extends StatefulWidget {
  @override
  _cekAbsenState createState() => _cekAbsenState();
}

class _cekAbsenState extends State<cekAbsen>
    with SingleTickerProviderStateMixin {
  TabController tb;
  @override
  void initState() {
    super.initState();
    tb = TabController(length: 2, vsync: this);
    tb.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

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
                            "Detail Absen",
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
                      //search icon
                      Positioned(
                        right: 4,
                        top: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                SlidePageRoute(page: CategoriesScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/icons/ic_search.png",
                              scale: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: 380,
                    height: 180,
                    child: Stack(
                      children: [
                        Container(
                          width: 380,
                          height: 180,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 380,
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.only(
                                  left: 144,
                                  right: 31,
                                  top: 23,
                                  bottom: 37,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 228,
                                      height: 37,
                                      child: Text(
                                        "Anonymous",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.50),
                                    SizedBox(
                                      width: 228,
                                      height: 26,
                                      child: Text(
                                        "Departemen",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.50),
                                    SizedBox(
                                      width: 228,
                                      height: 30,
                                      child: Text(
                                        "No.12345",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 21.47,
                          top: 23.37,
                          child: Container(
                            width: 97.75,
                            height: 122.41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Space
                SizedBox(
                  height: 8,
                ),
                //TabBar
                Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 0),
                    child: TabBar(
                        controller: tb,
                        //    labelPadding: EdgeInsets.symmetric(vertical: 2.0),
                        isScrollable: true,
                        tabs: [
                          Tab(
                              height: 100,
                              child: tabItem2(
                                context,
                                0,
                                "Masuk",
                                DateFormat('dd/MM/yyyy, hh:mm')
                                    .format(DateTime.now()),
                                "m",
                              )),
                          Tab(
                              height: 100,
                              child: tabItem2(
                                context,
                                1,
                                "Pulang",
                                DateFormat('dd/MM/yyyy, hh:mm')
                                    .format(DateTime.now()),
                                "p",
                              )),
                        ])),
                //

                //
                Expanded(
                  child: TabBarView(controller: tb, children: [
                    DetailAbsenMasuk(),
                    DetailAbsenMasuk(),
                    // Endocrine(),
                    // Dentist(),
                    // Orthopodist(),
                    // Surgeon(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container tabItem1(context, int index, String title) {
    return Container(
        child: Column(
      children: [
        Container(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "medium",
                color: tb.index == index
                    ? Theme.of(context).accentTextTheme.headline5.color
                    : Theme.of(context).accentTextTheme.headline4.color),
          ),
        ),
        //Space
        SizedBox(
          height: 4,
        ),
        //
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              color: tb.index == index
                  ? Theme.of(context).accentTextTheme.headline5.color
                  : Colors.transparent,
              shape: BoxShape.circle),
        )
      ],
    ));
  }

  Container tabItem2(
      context, int index, String status, String waktu, String set) {
    return Container(
        child: Column(
      children: [
        Container(
          color: set == "m" ? Colors.green : Colors.yellow,
          child: Column(
            children: [
              Text(
                status,
                style: TextStyle(
                    fontSize: 20, fontFamily: "medium", color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  waktu,
                  style: TextStyle(
                      fontSize: 15, fontFamily: "medium", color: Colors.black),
                ),
              ),
            ],
          ),
        ),

        //Space
        SizedBox(
          height: 4,
        ),
        //
        Container(
          width: 100,
          height: 2,
          decoration: BoxDecoration(
            color: tb.index == index
                ? Theme.of(context).accentTextTheme.headline5.color
                : Colors.transparent,
          ),
        )
      ],
    ));
  }
}
