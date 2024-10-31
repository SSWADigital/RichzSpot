import 'package:flutter/material.dart';
import 'package:homital/Account/SignIn.dart';
import 'package:homital/DoctorListScreenTabs/TabScreen1.dart';
import 'package:homital/main.dart';
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

// import 'PickTimeScreen1.dart';
class laporanpembayaran extends StatefulWidget {
  @override
  _laporanpembayaranState createState() => _laporanpembayaranState();
}

class _laporanpembayaranState extends State<laporanpembayaran>
    with SingleTickerProviderStateMixin {
  TextEditingController txttanggal = TextEditingController();
  List<Map<String, dynamic>> list = [
    {
      "img": "assets/imgs/download 1.png",
      "name": "Rumah Sakit Indriati",
      "jarak": "200 m",
      "msgStatus": "New message",
      "timing": "21 minutes ago",
      "color": 0xFF4CAF50,
    },
    {
      "img": "assets/imgs/rs1.png",
      "name": "Rumah Sakit Moewardi",
      "jarak": "3 km",
      "msgStatus": "Ongoing",
      "timing": "32 minutes ago",
      "color": 0xFF4285f4,
    },
    {
      "img": "assets/imgs/rs2.png",
      "name": "Rumah Sakit JIH Surakarta",
      "jarak": "2 km",
      "msgStatus": "Ended 13:02",
      "timing": "2 days ago",
      "color": 0xAA5c5c8a,
    },
  ];

  List<Map<String, dynamic>> absen = [
    {
      "tanggal": "08 Maret 2023",
      "masuk": "07:30",
      "keluar": "-",
      "keterangan": "-",
    },
    {
      "tanggal": "07 Maret 2023",
      "masuk": "07:30",
      "keluar": "13:30",
      "keterangan": "-",
    },
    {
      "tanggal": "06 Maret 2023",
      "masuk": "07:30",
      "keluar": "13:30",
      "keterangan": "-",
    },
  ];
  TabController tb;

  int _selectedTabIndex = 0;

  String chek = "";

  String _masuk;
  String _keluar;

  String absensiId; // mengambil _data absensi_id
  String idUser; // mengambil _data id_user
  String tanggal; // mengambil _data tanggal
  String gaji; // mengambil _data check_in
  String jmlh_absen; // mengambil _data check_out
  String t_tranpot; // mengambil _data loc_check_in
  String t_lembur; // mengambil _data loc_check_out
  String t_makan;
  String t_absen; // mengambil _data foto_check_in
  String total_gaji;

  String cek_absen;

  Future ambildata() async {
    final Response = await http.post(
        Uri.parse("http://103.157.97.200/api_absen_qr/gaji.php"),
        body: {"pegawai_id": iduser == "" ? pegawaiid : iduser});
    var _data = jsonDecode(Response.body);
    if (_data == false) {
      chek = "Belum Ada Data";

      this.setState(() {
        cek_absen = "0";
      });
    } else {
      this.setState(() {
        absensiId = _data[0]['absensi_id'];
        idUser = _data[0]['id_user'];
        tanggal = _data[0]['tanggal'];
        gaji = _data[0]['gaji'];
        jmlh_absen = _data[0]['jumlah_absensi'];
        t_tranpot = _data[0]['total_tunjangan_transport'];
        t_absen = _data[0]['loc_check_out'];
        t_makan = _data[0]['total_tunjangan_makan'];
        t_lembur = _data[0]['total_lembur'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ambildata();
    tb = TabController(length: 2, vsync: this);
    tb.addListener(_handleTabSelection);
    tapIndex;
  }

  void _handleTabSelection() {
    setState(() {});
  }

  // List _tanggal = [
  //   "assets/imgs/download 1.png",
  //   "assets/imgs/rs1.png",
  //   "assets/imgs/rs2.png",
  //  ];
  int tapIndex;

  bool isTap = false;
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MediaQuery(
      data: queryData.copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 281,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 248,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff020438),
                                    Color(0xff284184)
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 152,
                                top: 40,
                                bottom: 138,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/imgs/dc1.png"))),
                                      ),
                                      SizedBox(width: 17),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Hi, Samara",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "01234567",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 294,
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 60,
                                  vertical: 16,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sisa Tagihan SPP",
                                          style: TextStyle(
                                            color: Color(0xff020438),
                                            fontSize: 12,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        gaji == null
                                            ? Text(
                                                "Rp.0",
                                                style: TextStyle(
                                                  color: Color(0xfff11d1d),
                                                  fontSize: 24,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )
                                            : Text(
                                                NumberFormat.currency(
                                                        locale: 'id_ID',
                                                        symbol: 'Rp',
                                                        decimalDigits: 0)
                                                    .format(int.parse(gaji)),
                                                style: TextStyle(
                                                  color: Color(0xfff11d1d),
                                                  fontSize: 24,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                      isScrollable: true,
                      tabs: [
                        Tab(
                          child: Center(
                              child: Text(
                            'Tagihan',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ),
                        Tab(
                          child: Center(
                              child: Text(
                            'Riwayat',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
//Anda dapat menambahkan lebih banyak widget Tab sesuai dengan kebutuhan. Pastikan juga sudah menginisialisasi controller tb sebelumnya.

              Expanded(
                child: TabBarView(controller: tb, children: [
                  tagihandetail(),
                  pembayaranlunas(),

                  // Endocrine(),
                  // Dentist(),
                  // Orthopodist(),
                  // Surgeon(),
                ]),
              ),

              // Container(
              //   height: MediaQuery.of(context).size.height * 0.4,
              //   child: googleMap(context),
              // )
              // Expanded(
              //     child: ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: absen.length,
              //         itemBuilder: (context, index) {
              //           return Container(
              //             padding:
              //                 EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //             child: Card(
              //               elevation: 4,
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15),
              //                   side: BorderSide(
              //                       width: 1,
              //                       color: tapIndex == index
              //                           ? Theme.of(context)
              //                               .accentTextTheme
              //                               .headline1
              //                               .color
              //                           : Colors.transparent)),
              //               margin: EdgeInsets.zero,
              //               child: InkWell(
              //                 onTap: () {
              //                   setState(() {
              //                     tapIndex = index;
              //                     isTap = true;
              //                   });
              //                 },
              //                 child: Container(
              //                   width: 328,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(14),
              //                     boxShadow: [
              //                       BoxShadow(
              //                         color: Color(0x07000000),
              //                         blurRadius: 16,
              //                         offset: Offset(0, 5),
              //                       ),
              //                     ],
              //                     color: Colors.white,
              //                   ),
              //                   padding: const EdgeInsets.symmetric(
              //                     horizontal: 8,
              //                     vertical: 14,
              //                   ),
              //                   child: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         absen[index]["tanggal"] ?? "",
              //                         style: TextStyle(
              //                           color: Color(0xff284184),
              //                           fontSize: 14,
              //                           fontFamily: "Inter",
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                       SizedBox(height: 16),
              //                       Container(
              //                         width: double.infinity,
              //                         child: Row(
              //                           mainAxisSize: MainAxisSize.min,
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.center,
              //                           children: [
              //                             Column(
              //                               mainAxisSize: MainAxisSize.min,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.start,
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Text(
              //                                   "Check In",
              //                                   style: TextStyle(
              //                                     color: Color(0xff141414),
              //                                     fontSize: 14,
              //                                   ),
              //                                 ),
              //                                 SizedBox(height: 8),
              //                                 Text(
              //                                   "Check Out",
              //                                   style: TextStyle(
              //                                     color: Color(0xff141414),
              //                                     fontSize: 14,
              //                                   ),
              //                                 ),
              //                                 SizedBox(height: 8),
              //                                 Text(
              //                                   "Keterangan",
              //                                   style: TextStyle(
              //                                     color: Color(0xff141414),
              //                                     fontSize: 14,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             SizedBox(width: 190),
              //                             Expanded(
              //                               child: Column(
              //                                 mainAxisSize: MainAxisSize.max,
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.center,
              //                                 children: [
              //                                   Text(
              //                                     absen[index]["masuk"] ?? "",
              //                                     style: TextStyle(
              //                                       color: Color(0xff141414),
              //                                       fontSize: 14,
              //                                     ),
              //                                   ),
              //                                   SizedBox(height: 8),
              //                                   Text(
              //                                     absen[index]["keluar"] ?? "-",
              //                                     style: TextStyle(
              //                                       color: Color(0xff141414),
              //                                       fontSize: 14,
              //                                     ),
              //                                   ),
              //                                   SizedBox(height: 8),
              //                                   Text(
              //                                     "-",
              //                                     style: TextStyle(
              //                                       color: Color(0xff141414),
              //                                       fontSize: 14,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           );
              //         })),

              // Container(
              //   decoration: BoxDecoration(
              //       color: Theme.of(context).textTheme.subtitle2.color,
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(20),
              //         topRight: Radius.circular(20),
              //       )),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       //Space
              //       Container(
              //         height: 20,
              //         child: Stack(
              //           clipBehavior: Clip.none,
              //           children: [
              //             Positioned.directional(
              //                 textDirection: Directionality.of(context),
              //                 top: -10,
              //                 start: 0,
              //                 end: 0,
              //                 child: Container(
              //                   height: 40,
              //                   width: double.infinity,
              //                   decoration: BoxDecoration(
              //                       color: Theme.of(context)
              //                           .accentTextTheme
              //                           .bodyText1
              //                           .color,
              //                       borderRadius: BorderRadius.only(
              //                         topLeft: Radius.circular(20),
              //                         topRight: Radius.circular(20),
              //                       )),
              //                 )),
              //           ],
              //         ),
              //       ),
              //       //House number or Apartmant

              //       //City

              //       //District or Street
              //     ],
              //   ),
              // ),
              //Space

              //Basic health examination
              // Container(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 16,
              //   ),
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "Lokasi Anda",
              //     style: TextStyle(
              //         fontSize: 18,
              //         fontFamily: "medium",
              //         color: Theme.of(context).accentTextTheme.headline2.color),
              //   ),
              // ),
              //Space

              //Space
              // SizedBox(
              //   height: 12,
              // ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width - 80,
              //       child: TextField(
              //         controller: _locationController,
              //         decoration: InputDecoration(
              //           hintText: "Keterangan Tempat",
              //         ),
              //       ),
              //     ),
              //     SizedBox(height: 16),
              //     ElevatedButton(
              //       onPressed: _getImage,
              //       child: Text("Pilih Gambar"),
              //     ),
              //   ],
              // ),

              //wrap////////////////////////////////////////////////////////////////////////////////////////////

              //Space
              // SizedBox(
              //   height: 20,
              // ),

              // //Space
              // SizedBox(
              //   height: 10,
              // ),
              // testItem(),
              // //Space
              // SizedBox(
              //   height: 20,
              // ),
              // //Our 4 categories check-up
              // Container(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 16,
              //   ),
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "Our 4 categories check-up",
              //     style: TextStyle(
              //         fontSize: 18,
              //         fontFamily: "medium",
              //         color: Theme.of(context).accentTextTheme.headline2.color),
              //   ),
              // ),
              // //Space
              // SizedBox(
              //   height: 10,
              // ),
              // checkUpItem(),
              // //Space
              // SizedBox(
              //   height: 80,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  //Appbar
  Widget appBar() {
    return //Img
        Container(
      width: double.infinity,
      height: 188,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/imgs/libartry_img.jpg"))),
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 16, top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //back btn
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .color
                        .withOpacity(0.9)),
                child: Image.asset(
                  "assets/icons/ic_back.png",
                  scale: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container verticalDivider() {
    return //Divider
        Container(
      height: 30,
      padding: EdgeInsets.only(left: 25),
      child: Row(
        children: [
          VerticalDivider(
            width: 2,
            thickness: 2,
            indent: 2,
            endIndent: 2,
            color: Theme.of(context).accentTextTheme.headline5.color,
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////

// class LocationAttendancePage extends StatefulWidget {
//   @override
//   _LocationAttendancePageState createState() => _LocationAttendancePageState();
// }

// class _LocationAttendancePageState extends State<LocationAttendancePage> {
//   GoogleMapController _mapController;
//   LatLng _currentPosition;
//   Marker _currentMarker;
//   TextEditingController _locationController;
//   File _image;

//   @override
//   void initState() {
//     super.initState();

//     // Mengambil posisi saat ini dan menginisialisasi marker
//     _getCurrentLocation().then((position) {
//       setState(() {
//         _currentPosition = position;
//         _currentMarker = Marker(
//           markerId: MarkerId("current_position"),
//           position: _currentPosition,
//         );
//       });
//     });

//     // Menginisialisasi controller untuk TextField lokasi
//     _locationController = TextEditingController();
//   }

//   void _moveCameraToCurrentPosition() {
//     if (_currentPosition != null) {
//       _mapController
//           .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target: _currentPosition,
//         zoom: 16.0,
//       )));
//     }
//   }

//   @override
//   void dispose() {
//     _locationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Absensi Lokasi"),
//       ),
//       body: Stack(
//         children: [
//           // Widget untuk menampilkan peta
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target:
//                   _currentPosition, // Gunakan posisi saat ini sebagai posisi awal peta
//               zoom: 15,
//             ),
//             markers: _currentMarker != null
//                 ? Set<Marker>.of([_currentMarker])
//                 : null, // Ubah dari Set menjadi Set.of
//           ),
//           // Widget untuk menampilkan keterangan lokasi dan tombol untuk memilih gambar
//           Positioned(
//             left: 16,
//             bottom: 16,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width - 80,
//                   child: TextField(
//                     controller: _locationController,
//                     decoration: InputDecoration(
//                       hintText: "Keterangan Tempat",
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: _getImage,
//                   child: Text("Pilih Gambar"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Callback yang dipanggil saat peta selesai dibuat
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }

//   // Fungsi untuk mengambil posisi saat ini menggunakan package geolocator
//   Future<LatLng> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     return LatLng(position.latitude, position.longitude);
//   }

//   // Fungsi untuk memilih gambar dari galeri menggunakan package image_picker
//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print("Gambar tidak dipilih.");
//       }
//     });
//   }
// }