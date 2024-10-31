import 'package:flutter/material.dart';
import 'package:homital/CommunityTabs/AllTab.dart';
import 'package:homital/CommunityTabs/Endocrine.dart';
import 'package:homital/CommunityTabs/Dentist.dart';
import 'package:homital/CommunityTabs/Orthopodist.dart';
import 'package:homital/CommunityTabs/Surgeon.dart';
import 'package:homital/UI/NewQuestionScreen.dart';
import 'package:homital/animation/SlideRightRoute.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  TabController tb;
  @override
  void initState() {
    super.initState();
    tb = TabController(length: 5, vsync: this);
    tb.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                //Community
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      Container(
                        child: Text(
                          "Diskusi",
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline2
                                  .color),
                        ),
                      ),
                      Image.asset(
                        "assets/icons/ic_community.png",
                        scale: 20,
                      )
                    ],
                  ),
                ),
                //Space
                SizedBox(
                  height: 18,
                ),
                //Search for post
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 42,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline2
                              .color),
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 14, bottom: 8, right: 45),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Cari",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: "medium",
                              color:
                                  Theme.of(context).textTheme.headline3.color),
                        ),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "medium",
                            color: Theme.of(context)
                                .accentTextTheme
                                .headline2
                                .color),
                      ),
                      Positioned.directional(
                        end: 8,
                        top: 0,
                        bottom: 0,
                        textDirection: Directionality.of(context),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icons/ic_search.png",
                                scale: 24,
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline4
                                    .color,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                //Space
                SizedBox(
                  height: 13,
                ),
                //TabBar
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 0),
                  child: TabBar(
                      controller: tb,
                      // labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      isScrollable: true,
                      tabs: [
                        Tab(child: tabItem(context, 0, "Semua")),
                        Tab(
                          child: tabItem(context, 1, "Edocrine"),
                        ),
                        Tab(child: tabItem(context, 2, "Gigi")),
                        Tab(child: tabItem(context, 3, "Tulang")),
                        Tab(
                          child: tabItem(context, 4, "Ahli bedah"),
                        ),
                      ]),
                ),
                //
                Expanded(
                  child: TabBarView(controller: tb, children: [
                    AllTab(),
                    AllTab(),
                    AllTab(),
                    AllTab(),
                    AllTab(),
                    // Endocrine(),
                    // Dentist(),
                    // Orthopodist(),
                    // Surgeon(),
                  ]),
                ),
              ],
            ),
            //Float
            Positioned.directional(
              bottom: 20,
              end: 9,
              textDirection: Directionality.of(context),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, SlidePageRoute(page: NewQuestionScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/ic_float_btn1.png",
                    scale: 8.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container tabItem(context, int index, String title) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            width: 7,
            height: 7,
            decoration: BoxDecoration(
                color: tb.index == index
                    ? Theme.of(context).accentTextTheme.headline5.color
                    : Colors.transparent,
                shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
