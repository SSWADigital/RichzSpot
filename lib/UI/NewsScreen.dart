import 'package:flutter/material.dart';
import 'package:homital/NewsTabs/AllNewsScreen.dart';
import 'package:homital/NewsTabs/HealthTab.dart';
import 'package:homital/NewsTabs/NewsTab.dart';
import 'package:homital/NewsTabs/CancerTab.dart';
import 'package:homital/NewsTabs/MedicalTab.dart';
import 'package:homital/NewsTabs/LiveTab.dart';
class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>with SingleTickerProviderStateMixin {
  TabController tb;
  @override
  void initState() {
    super.initState();
    tb = TabController(length: 6, vsync: this);
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
                            "News",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'medium',
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                //Search for news
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  height: 42,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context).primaryTextTheme.headline2.color
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 14,bottom: 10,right: 45),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder:InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          errorBorder:  InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Search for news",
                          hintStyle: TextStyle(
                            fontSize: 13,
                            fontFamily: "medium",
                              color: Theme.of(context).textTheme.headline2.color
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline1.color
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 8,
                        top: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {

                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:Image.asset(
                                "assets/icons/ic_search.png",
                                scale: 24,
                                color: Theme.of(context).accentTextTheme.headline4.color,
                              )),
                        ),
                      )
                    ],
                  ),
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
                        Tab(
                            child: tabItem(context,0,"All")
                        ),
                        Tab(
                            child: tabItem(context,1,"Health")
                        ),
                        Tab(
                          child: tabItem(context,2,"News")
                        ),
                        Tab(
                            child: tabItem(context,3,"Cancer")
                        ),
                        Tab(
                            child: tabItem(context,4,"Medical")
                        ),
                        Tab(
                            child: tabItem(context,5,"Live")
                        ),
                      ]
                  ),
                ),
                //
                Expanded(
                  child: TabBarView(
                      controller: tb,
                      children: [
                        AllNewsScreen(),
                        AllNewsScreen(),
                        AllNewsScreen(),
                        AllNewsScreen(),
                        AllNewsScreen(),
                        AllNewsScreen(),
                        // HealthTab(),
                        // NewsTab(),
                        // CancerTab(),
                        // MedicalTab(),
                        // LiveTab(),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Container tabItem(context,int index,String title){
    return Container(
        child: Column(
          children: [
            Container(
              child: Text(title,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "medium",
                    color:tb.index==index? Theme.of(context).accentTextTheme.headline5.color:
                    Theme.of(context).accentTextTheme.headline4.color
                ),),
            ),
            //Space
            SizedBox(height: 4,),
            //
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                  color:  tb.index==index?Theme.of(context).accentTextTheme.headline5.color:
                  Colors.transparent,
                  shape: BoxShape.circle
              ),
            )
          ],
        )
    );
  }
}
