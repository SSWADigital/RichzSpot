import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
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

  final nameController = TextEditingController();
  final phoneNumController = TextEditingController();
  final emailController = TextEditingController();

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
    } else if (emailController.text.isEmpty) {
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
        emailController.text.isNotEmpty) {
      setState(() {
        isSave = true;
      });
    } else {
      isSave = false;
    }
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
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            "assets/imgs/pakricky.png",
                                          ))),
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
                                  labelText: "Agustinus Verry Ricki",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              genderDialogue();
                            },
                            child: Container(
                              child: Stack(
                                children: [
                                  TextFormField(
                                    enabled: false,
                                    onChanged: (_) {
                                      checkChanged();
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 14),
                                      labelText: genderVal == null
                                          ? "Laki-laki"
                                          : genderVal,
                                      labelStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "medium",
                                          color: genderVal == null
                                              ? Theme.of(context)
                                                  .accentTextTheme
                                                  .headline4
                                                  .color
                                              : Theme.of(context)
                                                  .accentTextTheme
                                                  .headline2
                                                  .color),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                                    end: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/icons/ic_drop_arrow.png",
                                          scale: 9,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
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
                                  labelText: "082338779999",
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
                                controller: emailController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 14),
                                  labelText: "Email",
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
                          check();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        color: isSave
                            ? Theme.of(context).accentTextTheme.headline1.color
                            : Theme.of(context)
                                .primaryTextTheme
                                .headline3
                                .color,
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
    "Male",
    "Female",
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
                          genderVal = genderList[index];
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          genderList[index],
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
