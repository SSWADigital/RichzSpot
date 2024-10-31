import 'package:flutter/material.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:intl/intl.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
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
                  title: "Alert !!!",
                  subTile: "Card number is required !",
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
                            "Add Card",
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
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/imgs/new_Card_img.png"))),
                      ),
                      //Space
                      SizedBox(
                        height: 28,
                      ),
                      //Card Number
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            TextFormField(
                              maxLength: 16,
                              keyboardType: TextInputType.number,
                              controller: cardNumbController,
                              onChanged: (_) {
                                setState(() {
                                  checkOnChange();
                                });
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 14),
                                  labelText: "Card Number",
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline4
                                          .color),
                                  helperStyle:
                                      TextStyle(color: Colors.transparent)),
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
                      //Cardholder Name
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              onChanged: (_) {
                                setState(() {
                                  checkOnChange();
                                });
                              },
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 14),
                                labelText: "Cardholder Name",
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
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Expiry
                            Expanded(
                              child: Container(
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      onTap: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        openDatePicker(context);
                                      },
                                      // enabled: false,
                                      controller: expiryController,
                                      keyboardType: TextInputType.number,
                                      onChanged: (_) {
                                        setState(() {
                                          checkOnChange();
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 14),
                                        labelText: dateVal == null
                                            ? "Expiry"
                                            : dateVal,
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
                                  ],
                                ),
                              ),
                            ),
                            //Space
                            SizedBox(
                              width: 15,
                            ),
                            //Security Code
                            Expanded(
                              child: Container(
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      maxLength: 4,
                                      keyboardType: TextInputType.number,
                                      controller: securityController,
                                      onChanged: (_) {
                                        setState(() {
                                          checkOnChange();
                                        });
                                      },
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 14),
                                          labelText: "Security Code",
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "medium",
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline4
                                                  .color),
                                          helperStyle: TextStyle(
                                              color: Colors.transparent)),
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
                            ),
                          ],
                        ),
                      )
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
