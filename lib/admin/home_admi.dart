import 'package:flutter/material.dart';
import 'package:homital/HomePageTabs/HomeScreen.dart';
import 'package:homital/HomePageTabs/NotificationScreen.dart';
import 'package:homital/HomePageTabs/CommunityScreen.dart';
import 'package:homital/HomePageTabs/ProfileScreen.dart';
import 'package:homital/HomePageTabs/ScheduleScreen.dart';
import 'package:homital/HomePageTabs/riwayat.dart';
import 'package:homital/UI/absensi.dart';
import 'package:homital/admin/cek_absen.dart';
import 'package:homital/admin/daftar_absen.dart';
import 'package:homital/admin/tambah_user.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin>
    with SingleTickerProviderStateMixin {
  TabController tb;
  @override
  void initState() {
    super.initState();
    tb = TabController(length: 3, vsync: this);
    tb.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  final theImage = Image.asset(
    "assets/icons/ic_schedule1.png",
  );

  /// Did Change Dependencies
  @override
  void didChangeDependencies() {
    precacheImage(theImage.image, context);
    super.didChangeDependencies();
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
                //
                Expanded(
                  child: TabBarView(
                      controller: tb,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        tabel_absen(),
                        // userbaru(),
                        // HomeScreen(),
                        // ScheduleScreen(),
                        // CommunityScreen(),
                        NotificationScreen(),
                        ProfileScreen(),
                      ]),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 60,
              padding: EdgeInsets.only(left: 4),
              child: TabBar(
                  controller: tb,
                  labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  tabs: [
                    Tab(
                      child: tb.index == 0
                          ? tabItem1(context, 0, "assets/icons/tab1.png", 10,
                              "Beranda")
                          : tabItem(0, "assets/icons/ic_home2.png", 20),
                    ),
                    Tab(
                      child: tb.index == 1
                          ? tabItem1(context, 0, "assets/icons/tab3.png", 10,
                              "Riwayat")
                          : tabItem(1, "assets/icons/ic_communityTab2.png", 20),
                    ),
                    // Tab(
                    //   child: tb.index == 2
                    //       ? tabItem1(context, 0, "assets/icons/tab3.png", 10,
                    //           "Diskusi")
                    //       : tabItem(2, "assets/icons/ic_communityTab2.png", 20),
                    // ),
                    // Tab(
                    //   child: tb.index == 3
                    //       ? tabItem1(
                    //           context, 0, "assets/icons/tab5.png", 10, "Pesan")
                    //       : tabItem(3, "assets/icons/ic_notification2.png", 20),
                    // ),
                    Tab(
                      child: tb.index == 2
                          ? tabItem1(
                              context, 0, "assets/icons/tab4.png", 10, "Profil")
                          : tabItem(4, "assets/icons/ic_profile2.png", 18.0),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

Container tabItem1(context, int index, String img, double sc, String title) {
  return Container(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.directional(
          top: -22,
          start: 0,
          end: 0,
          textDirection: Directionality.of(context),
          child: Container(
            child: Column(
              children: [
                Image.asset(
                  img,
                  scale: sc,
                ),
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "medium",
                        color: Colors.blue[900]
                        // Theme.of(context).accentTextTheme.headline1.color
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

//1
Container tabItem(int index, String img, double sc) {
  return Container(
    child: Image.asset(
      img,
      scale: sc,
    ),
  );
}
