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
import 'package:homital/pengguna/edit_profil.dart';
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
  String image_profil;

  Future lihatprofil() async {
    final prefs = await SharedPreferences.getInstance();

    id_user = (prefs.get('pegawai_id'));
    final Response = await http.get(
        Uri.parse("http://103.157.97.200/richzspot/user/getData/$id_user"));
    var profil = jsonDecode(Response.body);
    this.setState(() {
      if (Response.body == "false") {
        print("null");
      } else {
        // nama_user = profil[0]['username'] ?? "";
        nama_user = profil['user_nama_lengkap'] ?? "";
        nowa = profil['user_no_telp'] ?? "";
        image_profil = profil['user_foto'];
      }
      // gambar = datajson[0]['faskes_foto'];
    });
  }

  @override
  void initState() {
    _ambildata();
    lihatprofil();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 281,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff020438), Color(0xff284184)],
              ),
            ),
            padding: const EdgeInsets.only(
              // left: 128,
              // right: 127,
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
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: image_profil == null
                                  ? AssetImage("assets/icons/ic_profile_1.png")
                                  : NetworkImage(image_profil))),
                    ),
                    SizedBox(height: 17),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Text(
                            nama_user ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
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
                //Profile

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
                  onTap: () {
                    Navigator.push(
                        context, SlidePageRoute(page: edit_profil()));
                  },
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
                            "Edit Profil",
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

                // Space
                SizedBox(
                  height: 13,
                ),
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
              ],
            ),
          ),
          MaterialButton(
            onPressed: () async {
              logoutDialogue();
            },
            child: Container(
              width: 328,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xff020438),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x44000000),
                    blurRadius: 24,
                    offset: Offset(8, 8),
                  ),
                ],
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Keluar",
                    style: TextStyle(
                      color: Color(0xff020438),
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
                            prefs.remove('pegawai_nama');
                            prefs.remove('set_jab');
                            // Navigator.pop(context);
                            // Navigator.push(
                            //     context, SlidePageRoute(page: SignIn()));

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                                (route) => false);
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
