import 'package:flutter/material.dart';
import 'package:homital/UI/QR.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'PaymentMethodScreen.dart';
import 'SelectProfieScreen.dart';

class YourBillingScreen extends StatefulWidget {
  @override
  _YourBillingScreenState createState() => _YourBillingScreenState();
}

class _YourBillingScreenState extends State<YourBillingScreen> {
  bool ispay = false;
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
                            "Pembayaran",
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
                //
                Expanded(
                    child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      //Space
                      SizedBox(
                        height: 25,
                      ),
                      //Detail
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Rincian",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline2
                                  .color),
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //Dimitri...
                      Container(
                        padding: EdgeInsets.only(left: 14, right: 9),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Image.asset(
                                          "assets/icons/ic_user.png",
                                          scale: 25,
                                        )),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //
                                          Container(
                                            child: Text(
                                              "Agustinus Very Ricki",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline2
                                                      .color),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Text(
                                              "Laki-laki, 03/03/1980",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context)
                                                      .accentTextTheme
                                                      .headline3
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
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                Navigator.push(
                                    context,
                                    SlidePageRoute(
                                        page: SelectProfileScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Ubah",
                                  style: TextStyle(
                                      fontSize: 12,
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
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Sample time
                                  Container(
                                    child: Text(
                                      "Waktu",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline2
                                              .color),
                                    ),
                                  ),
                                  //Space
                                  SizedBox(
                                    height: 8,
                                  ),
                                  //11 March 2020
                                  Container(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/ic_calendar.png",
                                          scale: 38,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "11 Maret 2022",
                                            style: TextStyle(
                                                fontSize: 12,
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
                                  //Space
                                  SizedBox(
                                    height: 8,
                                  ),
                                  //06:15 AM
                                  Container(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/ic_watch.png",
                                          scale: 36,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "06:15 AM",
                                            style: TextStyle(
                                                fontSize: 12,
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
                                  //Space
                                  SizedBox(
                                    height: 8,
                                  ),
                                  //87 Crown Street
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Image.asset(
                                              "assets/icons/ic_loc4.png",
                                              scale: 33,
                                            )),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Surakarta\nJawa Tengah",
                                            style: TextStyle(
                                                fontSize: 12,
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
                                ],
                              ),
                            ),
                            // Expanded(
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       //Sample time
                            //       Container(
                            //         child: Text(
                            //           "Check-up time",
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontFamily: "medium",
                            //               color: Theme.of(context)
                            //                   .accentTextTheme
                            //                   .headline2
                            //                   .color),
                            //         ),
                            //       ),
                            //       //Space
                            //       SizedBox(
                            //         height: 8,
                            //       ),
                            //       //11 March 2020
                            //       Container(
                            //         child: Row(
                            //           children: [
                            //             Image.asset(
                            //               "assets/icons/ic_calendar.png",
                            //               scale: 38,
                            //             ),
                            //             Container(
                            //               padding: EdgeInsets.only(left: 10),
                            //               child: Text(
                            //                 "11 March 2020",
                            //                 style: TextStyle(
                            //                     fontSize: 12,
                            //                     fontFamily: "medium",
                            //                     color: Theme.of(context)
                            //                         .accentTextTheme
                            //                         .headline3
                            //                         .color),
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //       //Space
                            //       SizedBox(
                            //         height: 8,
                            //       ),
                            //       //09:00 AM
                            //       Container(
                            //         child: Row(
                            //           children: [
                            //             Image.asset(
                            //               "assets/icons/ic_watch.png",
                            //               scale: 36,
                            //             ),
                            //             Container(
                            //               padding: EdgeInsets.only(left: 10),
                            //               child: Text(
                            //                 "09:00 AM",
                            //                 style: TextStyle(
                            //                     fontSize: 12,
                            //                     fontFamily: "medium",
                            //                     color: Theme.of(context)
                            //                         .accentTextTheme
                            //                         .headline3
                            //                         .color),
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //       //Space
                            //       SizedBox(
                            //         height: 8,
                            //       ),
                            //       //99 Crown Street
                            //       Container(
                            //         child: Row(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //                 padding: EdgeInsets.only(top: 3),
                            //                 child: Image.asset(
                            //                   "assets/icons/ic_loc4.png",
                            //                   scale: 33,
                            //                 )),
                            //             Container(
                            //               padding: EdgeInsets.only(left: 10),
                            //               child: Text(
                            //                 "99 Crown Street\nLondon city",
                            //                 style: TextStyle(
                            //                     fontSize: 12,
                            //                     fontFamily: "medium",
                            //                     color: Theme.of(context)
                            //                         .accentTextTheme
                            //                         .headline3
                            //                         .color),
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //Package
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Layanan",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline2
                                  .color),
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //img
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //img
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/imgs/checkup.jpg"))),
                            ),
                            //
                            Container(
                              height: 60,
                              padding: EdgeInsets.only(left: 12, bottom: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      "Konsultasi",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline2
                                              .color),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline1
                                              .color),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //Discount
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Diskon",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline2
                                  .color),
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //Promotion code
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            TextFormField(
                              // controller: houseNumbController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  // if(value.length>0){
                                  //   isSave=true;
                                  // }else{
                                  //   isSave=false;
                                  // }
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xFFC2C2C2))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xFFC2C2C2),
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xFFC2C2C2))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 0.5, color: Color(0xFFC2C2C2))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 0.5, color: Color(0xFFC2C2C2))),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 0.5, color: Color(0xFFC2C2C2))),
                                hintText: "Kode Promo",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline2
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
                      //Payment method
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Metode Pembayaran",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline2
                                  .color),
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //Card
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.push(context,
                                  SlidePageRoute(page: PaymentMethodScreen()));
                            },
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/ic_pay.png",
                                    scale: 14,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline2
                                              .color),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/icons/ic_forward.png",
                                    scale: 36,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Harga",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline2
                                      .color),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              "Rp.100.000",
                              style: TextStyle(
                                  fontSize: 16,
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
                  ),
                  //
                  MaterialButton(
                    height: 44,
                    minWidth: 145,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push(context, SlidePageRoute(page: qr()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: Colors.blue,
                    elevation: 0,
                    highlightElevation: 0,
                    child: Container(
                      child: Text(
                        "Bayar",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.subtitle2.color,
                            fontSize: 14,
                            fontFamily: 'medium'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
