import 'package:flutter/material.dart';
import 'package:homital/Account/SignIn.dart';
import 'package:homital/pengguna/laporan/cek_absensi_keluar.dart';
import 'package:homital/pengguna/laporan/cek_absensi_masuk.dart';
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
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart'; //detailabsensi

// import 'PickTimeScreen1.dart';

class detailabsensi extends StatefulWidget {
  const detailabsensi({Key key, this.absensiId}) : super(key: key);
  final String absensiId;
  @override
  _detailabsensiState createState() => _detailabsensiState();
}

class _detailabsensiState extends State<detailabsensi>
    with SingleTickerProviderStateMixin {
  TabController tb;
  List<Widget> _tabs = [];
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

  String chek = "";

  String _masuk;
  String _keluar;

  String absensiId; // mengambil _data absensi_id
  String idUser; // mengambil _data id_user
  String tanggal; // mengambil _data tanggal
  String checkIn; // mengambil _data check_in
  String checkOut; // mengambil _data check_out
  String locCheckIn; // mengambil _data loc_check_in
  String locCheckOut; // mengambil _data loc_check_out
  String fotoCheckIn; // mengambil _data foto_check_in
  String fotoCheckOut;

  String cek_absen;

  Future ambildata() async {
    var id = widget.absensiId;
    final Response = await http.get(
      Uri.parse(
          "http://103.157.97.200/richzspot/absen/getAbsenHistoryDetail/$id"),
    );
    var _data = jsonDecode(Response.body);
    if (_data == false) {
      chek = "Belum Ada Data";

      this.setState(() {
        cek_absen = "0";
      });
    } else {
      this.setState(() {
        absensiId = _data['absen_id'];
        idUser = _data['id_user'];
        tanggal = _data['tanggal'];
        checkIn = _data['absen_checkin'];
        checkOut = _data['absen_checkout'];
        locCheckIn = _data['absen_checkin_lokasi'];
        locCheckOut = _data['absen_checkout_lokasi'];
        fotoCheckIn = _data['absen_checkin_foto'];
        fotoCheckOut = _data['absen_checkout_foto'];
      });
    }
  }

  @override
  void initState() {
    // Menambahkan widget ke dalam list _tabs
    _tabs.add(CekAbsen_Masuk(absensiId: widget.absensiId));
    _tabs.add(CekAbsen_Keluar(absensiId: widget.absensiId));

    super.initState();
    ambildata();
    tb = TabController(length: _tabs.length, vsync: this);
    tb.addListener(() {
      setState(() {
        _selectedTabIndex = tb.index;
        // _tabColor = List.generate(_tabs.length, (index) {
        //   return index == _selectedTabIndex
        //       ? Color(0xff020438)
        //       : Colors.grey[600];
        // }
        // );
      });
    });
  }

  String formatDate(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(date);
    return formattedDate;
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
            color: Color(0xff020438),
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
                  tanggal == null ? tanggal ?? "" : formatDate(tanggal ?? ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff020438),
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
                            color: Color(0xff020438),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          checkIn ?? "-",
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
                            color: Color(0xff020438),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          checkOut ?? "-",
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
