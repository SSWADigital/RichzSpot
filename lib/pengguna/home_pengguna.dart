import 'package:flutter/material.dart';
import 'package:homital/HomePageTabs/HomeScreen.dart';
import 'package:homital/HomePageTabs/NotificationScreen.dart';
import 'package:homital/HomePageTabs/CommunityScreen.dart';
import 'package:homital/HomePageTabs/ProfileScreen.dart';
import 'package:homital/HomePageTabs/ScheduleScreen.dart';
import 'package:homital/HomePageTabs/riwayat.dart';
import 'package:homital/UI/absensi.dart';
import 'package:homital/pengguna/beranda_pengguna.dart';
import 'package:homital/pengguna/pengguna_beranda.dart';
import 'package:homital/pengguna/profil.dart';
import 'package:homital/pengguna/riwayat.dart';
import 'package:homital/pengguna/spp.dart';

class HomePagePengguna extends StatefulWidget {
  @override
  _HomePagePenggunaState createState() => _HomePagePenggunaState();
}

class _HomePagePenggunaState extends State<HomePagePengguna>
    with SingleTickerProviderStateMixin {
  TabController tb;
  List<Widget> _tabs = [
    berandaPengguna(),
    laporanabsen(),
    laporanpembayaran(),
    biodatapengguna(),
  ];
  List<IconData> _icons = [
    Icons.home,
    Icons.calendar_today,
    Icons.book_sharp,
    Icons.person,
  ];
  List judul = [
    "Beranda",
    "Riwayat",
    "Tunjangan",
    "Profil",
  ];

  List<String> _tabText = ['Beranda', 'Jadwal', 'Notifikasi', 'Profil'];
  List<Color> _tabColor = [
    Colors.grey[600],
    Colors.grey[600],
    Colors.grey[600],
    Colors.grey[600],
  ];

  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    tb = TabController(length: _tabs.length, vsync: this);
    tb.addListener(() {
      setState(() {
        _selectedTabIndex = tb.index;
        _tabColor = List.generate(_tabs.length, (index) {
          return index == _selectedTabIndex
              ? Color(0xff020438)
              : Colors.grey[600];
        });
      });
    });
  }

  @override
  void dispose() {
    tb.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tb,
        children: _tabs,
      ),
      bottomNavigationBar: Material(
        elevation: 4,
        child: Container(
          height: 67,
          child: TabBar(
            controller: tb,
            indicatorColor: Colors.transparent,
            tabs: List.generate(_tabs.length, (index) {
              return Tab(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _icons[index],
                      size: 26,
                      color: _tabColor[index],
                    ),
                    Text(
                      judul[index],
                      style: TextStyle(
                        fontSize: 9,
                        color: _tabColor[index],
                      ),
                    ),
                  ],
                ),
              ));
            }),
          ),
        ),
      ),
    );
  }
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

Container tabItem4(context, int index, String img, double sc, String title) {
  return Container(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.directional(
          top: 0,
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
                      color: Colors.black,
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
