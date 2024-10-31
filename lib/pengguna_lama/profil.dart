import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homital/Account/SignIn.dart';
import 'package:homital/UI/AboutUs.dart';
import 'package:homital/UI/BasicHeathScreen.dart';
import 'package:homital/UI/HomePage.dart';
import 'package:homital/UI/PaymentMethodScreen.dart';
import 'package:homital/UI/PersonalInfoScreen.dart';
import 'package:homital/UI/SelectAddressScreen.dart';
import 'package:homital/UI/SelectProfieScreen.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class biodatapengguna extends StatefulWidget {
  @override
  _biodatapenggunaState createState() => _biodatapenggunaState();
}

class _biodatapenggunaState extends State<biodatapengguna> {
  Future<void> _ambildata() async {
    final prefs = await SharedPreferences.getInstance();

    iduser = (prefs.get('login_id'));
    print(iduser);
    return iduser;
  }

  String nama_user;
  String alamat;
  String nowa;
  String id_user = "";
  Future lihatprofil() async {
    final prefs = await SharedPreferences.getInstance();

    id_user = (prefs.get('pegawai_id'));

    final Response = await http.post(
        Uri.parse("http://103.157.97.200/api_absen_qr/id.php"),
        body: {"nip": id_user == "" ? pegawaiid : id_user});
    var profil = jsonDecode(Response.body);
    this.setState(() {
      if (Response.body == "false") {
        print("null");
      } else {
        // nama_user = profil[0]['username'] ?? "";
        nama_user = profil[0]['nama'] ?? "";
        alamat = profil[0]['alamat'] ?? "";
        nowa = profil[0]['no_wa'] ?? "";
      }

      // gambar = datajson[0]['faskes_foto'];
    });
  }

  @override
  void initState() {
    _ambildata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 360,
            height: 248,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff020438), Color(0xff284184)],
              ),
            ),
            padding: const EdgeInsets.only(
              left: 128,
              right: 127,
              top: 20,
              bottom: 34,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Profil",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 43),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: FlutterLogo(size: 70),
                    ),
                    SizedBox(height: 17),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          nama_user ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          nowa ?? "",
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
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                //Profile
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        fontFamily: "medium",
                        color:
                            Theme.of(context).accentTextTheme.headline2.color),
                  ),
                ),
                //Space
                SizedBox(
                  height: 15,
                ),
                //Profiel img

                //Space
                // SizedBox(
                //   height: 5,
                // ),
                //card
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 16,
                //   ),
                //   child: Card(
                //     elevation: 4,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(7)),
                //     margin: EdgeInsets.zero,
                //     child: Container(
                //       height: 50,
                //       padding: EdgeInsets.only(left: 13, right: 8),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Expanded(
                //             child: Container(
                //               child: RichText(
                //                 text: TextSpan(
                //                     text: "2  ",
                //                     style: TextStyle(
                //                         fontSize: 13,
                //                         fontFamily: "medium",
                //                         color: Theme.of(context)
                //                             .accentTextTheme
                //                             .headline5
                //                             .color),
                //                     children: [
                //                       TextSpan(
                //                           text: "advice ticket remaining",
                //                           style: TextStyle(
                //                               fontSize: 13,
                //                               fontFamily: "medium",
                //                               color: Theme.of(context)
                //                                   .accentTextTheme
                //                                   .headline4
                //                                   .color))
                //                     ]),
                //               ),
                //             ),
                //           ),
                //           Image.asset(
                //             "assets/icons/ic_forward.png",
                //             scale: 30,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //Space
                // SizedBox(
                //   height: 27,
                // ),
                //Profile Settings
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/ic_profile_1.png",
                          scale: 22,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 14),
                          child: Text(
                            "Ubah Settings",
                            style: TextStyle(
                                fontSize: 15,
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
                //Q & A History
                // InkWell(
                //   onTap: () {},
                //   child: Container(
                //     height: 45,
                //     padding: EdgeInsets.symmetric(horizontal: 16),
                //     child: Row(
                //       children: [
                //         Image.asset(
                //           "assets/icons/ic_history.png",
                //           scale: 22,
                //         ),
                //         Container(
                //           padding: EdgeInsets.only(left: 12),
                //           child: Text(
                //             "Q & A History",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 fontFamily: "medium",
                //                 color: Theme.of(context)
                //                     .accentTextTheme
                //                     .headline3
                //                     .color),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //Space
                // SizedBox(
                //   height: 13,
                // ),
                //Address
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context, SlidePageRoute(page: SelectAddressScreen()));
                //   },
                //   child: Container(
                //     height: 45,
                //     padding: EdgeInsets.symmetric(horizontal: 13),
                //     child: Row(
                //       children: [
                //         Image.asset(
                //           "assets/icons/ic_loc4.png",
                //           scale: 22,
                //         ),
                //         Container(
                //           padding: EdgeInsets.only(left: 15),
                //           child: Text(
                //             "Alamat",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 fontFamily: "medium",
                //                 color: Theme.of(context)
                //                     .accentTextTheme
                //                     .headline3
                //                     .color),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //Payment Method
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, SlidePageRoute(page: PaymentMethodScreen()));
                  },
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/ic_payment.png",
                          scale: 22,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Metode Pembayaran",
                            style: TextStyle(
                                fontSize: 15,
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
                //Space
                // SizedBox(
                //   height: 13,
                // ),
                // //Help Center
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context, SlidePageRoute(page: BasicHealthScreen()));
                //   }, //BasicHealthScreen
                //   child: Container(
                //     height: 45,
                //     padding: EdgeInsets.symmetric(horizontal: 16),
                //     child: Row(
                //       children: [
                //         Image.asset(
                //           "assets/icons/ic_help.png",
                //           scale: 22,
                //         ),
                //         Container(
                //           padding: EdgeInsets.only(left: 12),
                //           child: Text(
                //             "Customer Service",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 fontFamily: "medium",
                //                 color: Theme.of(context)
                //                     .accentTextTheme
                //                     .headline3
                //                     .color),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //Hotline
                // InkWell(
                //   onTap: () {},
                //   child: Container(
                //     height: 45,
                //     padding: EdgeInsets.symmetric(horizontal: 16),
                //     child: Row(
                //       children: [
                //         Image.asset(
                //           "assets/icons/ic_hotline.png",
                //           scale: 22,
                //         ),
                //         Container(
                //           padding: EdgeInsets.only(left: 12),
                //           child: Text(
                //             "Hotline",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 fontFamily: "medium",
                //                 color: Theme.of(context)
                //                     .accentTextTheme
                //                     .headline3
                //                     .color),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //About Us
                InkWell(
                  onTap: () {
                    Navigator.push(context, SlidePageRoute(page: AboutUs()));
                  },
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/ic_about.png",
                          scale: 22,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Informasi",
                            style: TextStyle(
                                fontSize: 15,
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
                //Space
                // SizedBox(
                //   height: 13,
                // ),
                //Logout
                InkWell(
                  onTap: () {
                    logoutDialogue();
                  },
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset("assets/icons/ic_logout.png",
                            scale: 20,
                            color: Theme.of(context)
                                .accentTextTheme
                                .headline1
                                .color),
                        Container(
                          padding: EdgeInsets.only(left: 11),
                          child: Text(
                            "Keluar",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline1
                                    .color),
                          ),
                        )
                      ],
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

  void logoutDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: EdgeInsets.all(30),
            child: Container(
              height: 164,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Keluar",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .color),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 9),
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: new TextSpan(
                              text: "Anda Yakin ?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "medium",
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Tidak",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline1
                                      .color),
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove('pegawai_id');
                            prefs.remove('set_jab');
                            prefs.remove('pegawai_nama');

                            // Navigator.pop(context);
                            Navigator.push(
                                context, SlidePageRoute(page: SignIn()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Keluar",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline1
                                      .color),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
