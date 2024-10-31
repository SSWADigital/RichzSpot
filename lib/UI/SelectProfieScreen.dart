import 'package:flutter/material.dart';
import 'package:homital/UI/CreateNewProfile.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'PersonalInfoScreen.dart';
import 'YourAddressScreen.dart';

class SelectProfileScreen extends StatefulWidget {
  @override
  _SelectProfileScreenState createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  bool isSelect = false;
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
                            "Pilih Profil",
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
                //Space
                SizedBox(
                  height: 14,
                ),
                //Card
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            width: 1,
                            color: isSelect
                                ? Theme.of(context)
                                    .accentTextTheme
                                    .headline1
                                    .color
                                : Colors.transparent)),
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isSelect = !isSelect;
                        });
                      },
                      child: Container(
                        height: 110,
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 10, right: 5, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10, top: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Dimitri Petrenko
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/icons/ic_user.png",
                                            scale: 30,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text(
                                              "Agustinus Verry Ricki",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline2
                                                      .color),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //03 - 03 - 2033
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/icons/ic_cake.png",
                                            scale: 30,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text(
                                              "03 - 03 - 1980",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline2
                                                      .color),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //Male
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/icons/ic_gendar.png",
                                            scale: 30,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text(
                                              "Laki-laki",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline2
                                                      .color),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                profileDialogue();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Image.asset(
                                    "assets/icons/ic_menu.png",
                                    scale: 30,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //New profile
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: 44,
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.push(context,
                                SlidePageRoute(page: CreateNewProfile()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline5
                              .color
                              .withOpacity(0.2),
                          elevation: 0,
                          highlightElevation: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/ic_add.png",
                                scale: 45,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  "Akun baru",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline5
                                          .color,
                                      fontSize: 15,
                                      fontFamily: 'medium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                          Navigator.push(context,
                              SlidePageRoute(page: PersonalInfoScreen()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: isSelect
                            ? Theme.of(context).accentTextTheme.headline1.color
                            : Theme.of(context)
                                .primaryTextTheme
                                .headline3
                                .color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Pilih",
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

  void profileDialogue() {
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
              height: 155,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Profie: Agustinus Verry Ricki",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: new TextSpan(
                              text: "Ubah Profil?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
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
                              "Kembali",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            confirmDialogue();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Hapus",
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
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context,
                                SlidePageRoute(page: YourAddressScreen()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline5
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

  void confirmDialogue() {
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
              height: 160,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Konfrimasi",
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
                          padding: EdgeInsets.only(top: 5),
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: new TextSpan(
                              text: "Anda Yakin? ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                              children: <TextSpan>[
                                new TextSpan(
                                  text: "Agustinus Verry Ricki",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline2
                                          .color),
                                ),
                                new TextSpan(
                                  text: " profil?",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline3
                                          .color),
                                )
                              ],
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
                              "Kembali",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Hapus",
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
