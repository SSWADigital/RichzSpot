import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homital/Account/SignIn.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class edit_profil extends StatefulWidget {
  @override
  _edit_profilState createState() => _edit_profilState();
}

class _edit_profilState extends State<edit_profil> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //
  DateTime currentDate = new DateTime.now();
  var dateVal;
  var now = new DateTime.now();
  Future<void> openDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != currentDate) {
      setState(() {
        dateVal = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tgllahirController = TextEditingController();

  String nama_user;
  String alamat_;
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
        nameController.text = profil['user_nama_lengkap'] ?? "";
        phoneNumController.text = profil['user_no_telp'] ?? "";
        image_profil = profil['user_foto'];
        dateVal = profil['user_tgl_lahir'] ?? "";
        alamat.text = profil['user_alamat'] ?? "";
        jenis = profil['user_jenis_kelamin'] ?? "";
      }
      // gambar = datajson[0]['faskes_foto'];
    });
  }

  Future _edit() async {
    final prefs = await SharedPreferences.getInstance();

    id_user = (prefs.get('pegawai_id'));
    if (_image != null) {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://103.157.97.200/richzspot/user/updateData/$id_user'));
      request.fields.addAll({
        'user_nama_lengkap': nameController.text,
        'user_no_telp': phoneNumController.text,
        'pasien_alamat': alamat.text,
        "user_tgl_lahir": dateVal,
      });
      request.files
          .add(await http.MultipartFile.fromPath('user_foto', _image.path));

      http.StreamedResponse response = await request.send();

      showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Pembritahuan !!!",
              subTile: "Berhasil Edit Profil",
            );
          });
      // Navigator.pop(context);
    } else {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://103.157.97.200/richzspot/user/updateData/$id_user'));
      request.fields.addAll({
        'user_nama_lengkap': nameController.text,
        'user_no_telp': phoneNumController.text,
        'pasien_alamat': alamat.text,
        "user_tgl_lahir": dateVal,
      });

      http.StreamedResponse response = await request.send();

      showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Pembritahuan !!!",
              subTile: " Berhasil Edit Profil",
            );
          });
      // Navigator.pop(context);
    }
  }

  String jenis;
  List<dynamic> pilihjenis = [
    {
      "jenis_nama": "Laki-laki",
      "nilai": "L",
    },
    {
      "jenis_nama": "Perempuan",
      "nilai": "P",
    },
  ];

  check() {
    if (nameController.text.isEmpty) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Alert !!!",
              subTile: "First name is required !",
            );
          });
    } else if (genderVal == null) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Alert !!!",
              subTile: "Gender is required !",
            );
          });
    } else if (dateVal == null) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Alert !!!",
              subTile: "Date of birth is required !",
            );
          });
    } else if (phoneNumController.text.isEmpty) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Alert !!!",
              subTile: "Phone number is required !",
            );
          });
    } else if (alamat.text.isEmpty) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Alert !!!",
              subTile: "Email is required !",
            );
          });
    } else {
      Navigator.pop(context);
    }
  }

  bool isSave = false;
  checkChanged() {
    if (nameController.text.isNotEmpty &&
        genderVal != null &&
        dateVal != null &&
        phoneNumController.text.isNotEmpty &&
        alamat.text.isNotEmpty) {
      setState(() {
        isSave = true;
      });
    } else {
      isSave = false;
    }
  }

  MediaQueryData queryData;
  @override
  void initState() {
    lihatprofil();
    // TODO: implement initState
    super.initState();
  }

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
                            "Informasi Pribadi",
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
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => getImage(),
                                child: _image != null
                                    ? Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(_image))),
                                        child: Stack(
                                          children: [
                                            Positioned.directional(
                                              textDirection:
                                                  Directionality.of(context),
                                              bottom: 1,
                                              end: 1,
                                              child: Image.asset(
                                                "assets/icons/ic_edit_cam.png",
                                                scale: 3.5,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: 80,
                                        height: 80,
                                        decoration: image_profil == null
                                            ? BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/icons/p1.png")))
                                            : BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        image_profil))),
                                        child: Stack(
                                          children: [
                                            Positioned.directional(
                                              textDirection:
                                                  Directionality.of(context),
                                              bottom: 1,
                                              end: 1,
                                              child: Image.asset(
                                                "assets/icons/ic_edit_cam.png",
                                                scale: 3.5,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 30,
                        ),
                        //First name & Last name
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: nameController,
                                onChanged: (_) {
                                  checkChanged();
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 14),
                                  labelText: "Nama",
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline4
                                          .color),
                                ),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .accentTextTheme
                                        .headline2
                                        .color),
                              ),
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //Gender
                        Container(
                          height: 50,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline4
                                      .color)),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text(
                                "Jenis Kelamin",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .accentTextTheme
                                        .headline4
                                        .color),
                                semanticsLabel: "Jenis Kelamin",
                              ),
                              value: jenis,
                              items: pilihjenis.map((item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item['jenis_nama'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                  ),
                                  value: item['nilai'],
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  jenis = value;
                                  print(jenis);
                                });
                              },
                            ),
                          ),
                        ),

                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        //   child: InkWell(
                        //     onTap: () {
                        //       FocusScope.of(context).requestFocus(FocusNode());
                        //       genderDialogue();
                        //     },
                        //     child: Container(
                        //       child: Stack(
                        //         children: [
                        //           TextFormField(
                        //             enabled: false,
                        //             onChanged: (_) {
                        //               checkChanged();
                        //             },
                        //             decoration: InputDecoration(
                        //               contentPadding: EdgeInsets.only(left: 14),
                        //               labelText: genderVal == null
                        //                   ? "Jenis Kelamin"
                        //                   : genderVal,
                        //               labelStyle: TextStyle(
                        //                   fontSize: 14,
                        //                   fontFamily: "medium",
                        //                   color: genderVal == null
                        //                       ? Theme.of(context)
                        //                           .accentTextTheme
                        //                           .headline4
                        //                           .color
                        //                       : Theme.of(context)
                        //                           .accentTextTheme
                        //                           .headline2
                        //                           .color),
                        //               disabledBorder: OutlineInputBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(4),
                        //                   borderSide: BorderSide(
                        //                       width: 1,
                        //                       color: Theme.of(context)
                        //                           .primaryTextTheme
                        //                           .headline2
                        //                           .color)),
                        //             ),
                        //           ),
                        //           Positioned.directional(
                        //             textDirection: Directionality.of(context),
                        //             end: 0,
                        //             top: 0,
                        //             bottom: 0,
                        //             child: Padding(
                        //                 padding: const EdgeInsets.all(8.0),
                        //                 child: Image.asset(
                        //                   "assets/icons/ic_drop_arrow.png",
                        //                   scale: 9,
                        //                 )),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //Date of birth
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: InkWell(
                            onTap: () {
                              openDatePicker(context);
                            },
                            child: Stack(
                              children: [
                                TextFormField(
                                  enabled: false,
                                  onChanged: (_) {
                                    checkChanged();
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 14),
                                    labelText: dateVal == null
                                        ? "Tanggal Lahir"
                                        : dateVal.toString(),
                                    labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: dateVal == null
                                            ? Theme.of(context)
                                                .accentTextTheme
                                                .headline4
                                                .color
                                            : Theme.of(context)
                                                .accentTextTheme
                                                .headline2
                                                .color),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Theme.of(context)
                                                .primaryTextTheme
                                                .headline2
                                                .color)),
                                  ),
                                ),
                                Positioned.directional(
                                  textDirection: Directionality.of(context),
                                  end: 8,
                                  top: 5,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/icons/ic_calendar.png",
                                        scale: 25,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //Phone number
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: phoneNumController,
                                keyboardType: TextInputType.number,
                                onChanged: (_) {
                                  checkChanged();
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 14),
                                  labelText: "No Hp",
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline4
                                          .color),
                                ),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .accentTextTheme
                                        .headline2
                                        .color),
                              ),
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //Email
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Stack(
                            children: [
                              TextFormField(
                                onChanged: (_) {
                                  checkChanged();
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: alamat,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 14),
                                  labelText: "Alamat",
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline4
                                          .color),
                                ),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .accentTextTheme
                                        .headline2
                                        .color),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 70,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 44,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _edit();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        color:
                            Theme.of(context).accentTextTheme.headline2.color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.subtitle2.color,
                                fontSize: 15,
                                fontFamily: 'medium'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  List genderList = [
    "Laki-laki",
    "perempuan",
  ];
  String genderVal;
  void genderDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(genderList.length, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          genderVal = genderList[index]["kode"];
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          genderList[index]["jenis_kelamin"],
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline2
                                  .color),
                        ),
                      ),
                    );
                  })),
            ),
          );
        });
      },
    );
  }
}
