import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homital/UI/PickTimeScreen1.dart';
import 'package:homital/UI/PickTimeScreen1.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:intl/intl.dart';

class qr extends StatefulWidget {
  const qr({Key key}) : super(key: key);

  @override
  State<qr> createState() => _qrState();
}

class _qrState extends State<qr> {
  final cardNumbController = TextEditingController();
  final nameController = TextEditingController();
  final expiryController = TextEditingController();
  final securityController = TextEditingController();

  //
  DateTime currentDate = new DateTime.now();
  var dateVal;
  var now = new DateTime.now();
  Future<void> openDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != currentDate) {
      setState(() {
        dateVal = DateFormat('MM/yyyy').format(picked);
      });
    }
  }

  //
  bool isSave = false;
  checkOnChange() {
    setState(() {
      if (cardNumbController.text.length == 16 &&
          nameController.text.length > 0 &&
          dateVal != null &&
          securityController.text.length == 4) {
        isSave = true;
      } else {
        setState(() {
          isSave = false;
        });
      }
    });
  }

  //For validateCardNumb
  String validateCardNumb(String value) {
    if (value.isEmpty) {
      return "Invalid number";
    } else if (value.length < 16 || value.length > 16) {
      return "Invalid number";
    } else {
      return null;
    }
  }

  //For validateCardNumb
  String validateCVC(String value) {
    if (value.isEmpty) {
      return "Invalid number";
    } else if (value.length < 4 || value.length > 4) {
      return "Invalid number";
    } else {
      return null;
    }
  }

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void validate(name, card, month, year, cvc) {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
    } else {
      print('Form is invalid');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  check() {
    setState(() {
      if (cardNumbController.text.isEmpty ||
          cardNumbController.text.length < 16) {
        if (cardNumbController.text.length >= 1 &&
            cardNumbController.text.length < 16) {
          showDialog<void>(
              context: context,
              builder: (BuildContext dialogContext) {
                return Alert(
                  title: "Alert !!!",
                  subTile: "Card number must be 16 digit !",
                );
              });
        } else {
          showDialog<void>(
              context: context,
              builder: (BuildContext dialogContext) {
                return Alert(
                  title: "Disimpan !!!",
                  subTile: "Bukti Transaksi !",
                );
              });
        }
      } else if (nameController.text.isEmpty) {
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(
                title: "Alert !!!",
                subTile: "Cardholder name is required !",
              );
            });
      } else if (dateVal == null) {
        return showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(
                title: "Alert !!!",
                subTile: "Expiry date is required !",
              );
            });
      } else if (securityController.text.isEmpty ||
          securityController.text.length < 4) {
        if (securityController.text.length > 0 &&
            securityController.text.length < 4) {
          showDialog<void>(
              context: context,
              builder: (BuildContext dialogContext) {
                return Alert(
                  title: "Alert !!!",
                  subTile: "Security code must be 4 digit !",
                );
              });
        } else {
          showDialog<void>(
              context: context,
              builder: (BuildContext dialogContext) {
                return Alert(
                  title: "Alert !!!",
                  subTile: "Security code is required !",
                );
              });
        }
      } else {
        Navigator.pop(context);
      }
    });
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
                            "Janji Temu Dokter",
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
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Bukti Transaksi",
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
                      //Space
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Transaksi Berhasil, Nomor Transaksi Anda",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'medium',
                              color: Colors.grey),
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 12,
                      ),

                      //card img
                      Container(
                        width: double.infinity,
                        height: 200,
                        margin: EdgeInsets.symmetric(horizontal: 14.5),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/imgs/qr.png"))),
                      ),
                      //Space
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "No. Transaksi: 220408185310",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'medium',
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //Card Number

                      //Cardholder Name
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Tanggal Konsultasi",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Jam Konsultasi",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Faskes",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Dokter",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "08-04-2022",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "19:30:00",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Rs.Indriati",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Dr. Helena Wijaya",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'medium',
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline2
                                            .color),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),

                            //
                            //

                            //
                            //
                          ],
                        ),
                      ),
                      //Space

                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "* Harap Membawa Bukti Transaksi Ini",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'medium',
                              color: Colors.grey),
                        ),
                      ),

                      //
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 5,
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
                            borderRadius: BorderRadius.circular(6)),
                        color: Colors.blue,

                        //  isSave
                        //     ? Theme.of(context).accentTextTheme.headline1.color
                        //     : Theme.of(context)
                        //         .primaryTextTheme
                        //         .headline3
                        //         .color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Simpan",
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
}
