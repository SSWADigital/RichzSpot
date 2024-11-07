import 'package:flutter/material.dart';
import 'package:homital/pengguna/laporan/detail_absen_user.dart';
import 'package:homital/pengguna/pembayaran/pembayaran.dart';
import 'package:homital/pengguna/pembayaran/tagihan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homital/UI/BasicHeathScreen.dart';
import 'package:homital/UI/SelectAddressScreen.dart';
import 'package:homital/UI/YourAddressScreen.dart';
import 'package:homital/UI/webview.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:date_time_picker/date_time_picker.dart'; //detailabsensi

// import 'PickTimeScreen1.dart';

class detailabsensi extends StatefulWidget {
  @override
  _detailabsensiState createState() => _detailabsensiState();
}

class _detailabsensiState extends State<detailabsensi>
    with SingleTickerProviderStateMixin {
  TabController tb;
  List<Widget> _tabs = [
    cekabsenmasuk(),
    cekabsenmasuk(),
  ];
  List<IconData> _icons = [
    Icons.home,
    Icons.calendar_today,
  ];
  List judul = [
    "Masuk",
    "Keluar",
  ];

  List<String> _tabText = [
    'Beranda',
    'Jadwal',
    'Notifikasi',
    'Profil',
  ];
  List<Color> _tabColor = [
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
              ? Color(0xFF0477BE)
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Color(0xFF0477BE),
            padding: const EdgeInsets.only(
              top: 20,
              left: 13,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Detail Absensi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 328,
            height: 137,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 22,
                  offset: Offset(0, 4),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Rabu, 8 Maret 2023",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0477BE),
                    fontSize: 24,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            color: Color(0xFF0477BE),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "07 : 45",
                          style: TextStyle(
                            color: Color(0xffffa800),
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            color: Color(0xFF0477BE),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "-",
                          style: TextStyle(
                            color: Color(0xffffa800),
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          Container(
            width: 328,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1c000000),
                  blurRadius: 28,
                  offset: Offset(0, 4),
                ),
              ],
              color: Colors.white,
            ),
            child: Center(
              child: TabBar(
                labelColor: Color(0xff141414),
                unselectedLabelColor: Colors.grey,
                controller: tb,
                // isScrollable: true,
                tabs: List.generate(_tabs.length, (index) {
                  return Tab(
                    child: Center(
                        child: Text(
                      judul[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  );
                }),
              ),
            ),
          ),

//Anda dapat menambahkan lebih banyak widget Tab sesuai dengan kebutuhan. Pastikan juga sudah menginisialisasi controller tb sebelumnya.

          Expanded(
            child: TabBarView(
              controller: tb,
              children: _tabs,
            ),
          ),
        ],
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
