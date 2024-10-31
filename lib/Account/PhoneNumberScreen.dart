import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homital/Account/OTPScreen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:homital/UI/HomePage.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:homital/animation/SlideRightRoute.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _controller = TextEditingController();
  String selectedcode, selectedCountry, img;
  bool isConfirm = false;
  //
  check(BuildContext context) {
    if (_controller.text.isEmpty) {
      showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Alert !!!",
              subTile: "Phone number is required !",
            );
          });
    } else if (_controller.text.length > 0 && _controller.text.length < 10) {
      isConfirm = true;
      showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Alert !!!",
              subTile: "Invalid phone number !",
            );
          });
    } else {
      Navigator.push(context, SlidePageRoute(page: OTPScreen()));
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
                    ],
                  ),
                ),
                //
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        //Space
                        SizedBox(
                          height: 35,
                        ),
                        //Your phone number
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          child: Text(
                            "Nomer Handphone Anda",
                            style: TextStyle(
                                fontSize: 24,
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
                          height: 12,
                        ),
                        //Already have an account?...
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          child: RichText(
                            text: new TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                              text: "Sudah memiliki akun?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: " Masuk!",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline5
                                            .color),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pop(context);
                                      }),
                              ],
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 50,
                        ),
                        //Country Code and Mobile Number
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 44,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .headline5
                                        .color,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned.directional(
                                      textDirection: Directionality.of(context),
                                      end: 0,
                                      top: -10,
                                      bottom: 0,
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // country code
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                selectedCountry == null
                                                    ? "+44"
                                                    : selectedCountry,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: "medium",
                                                    fontSize: 15,
                                                    color: Theme.of(context)
                                                        .accentTextTheme
                                                        .headline2
                                                        .color),
                                              ),
                                            ),
                                            //Down Arrow
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    right: 10,
                                                    top: 15),
                                                child: Image.asset(
                                                  "assets/icons/ic_drop_arrow.png",
                                                  scale: 7,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned.directional(
                                      textDirection: Directionality.of(context),
                                      start: -18,
                                      top: 0,
                                      end: 0,
                                      bottom: 0,
                                      child: Theme(
                                        data: ThemeData(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                        ),
                                        child: Container(
                                          child: CountryCodePicker(
                                            flagWidth: 30,
                                            onChanged: (country) {
                                              setState(() {
                                                selectedCountry =
                                                    country.dialCode;
                                                selectedcode = country.code;
                                              });
                                            },
                                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                            initialSelection: 'GB',
                                            favorite: ['+44', 'UK'],
                                            // optional. Shows only country name and flag
                                            showCountryOnly: false,
                                            showFlagDialog: true,
                                            showFlag: true,
                                            // optional. Shows only country name and flag when popup is closed.
                                            showOnlyCountryWhenClosed: false,
                                            // optional. aligns the flag and the Text left
                                            alignLeft: false,
                                            textStyle: TextStyle(
                                                color: Colors.transparent,
                                                fontFamily: "medium",
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Space
                              SizedBox(
                                width: 12,
                              ),
                              //Mobile Number Text Field
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned.directional(
                                        textDirection:
                                            Directionality.of(context),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: _controller,
                                          onChanged: (value) {
                                            setState(() {
                                              if (value.length > 0) {
                                                isConfirm = true;
                                              } else {
                                                isConfirm = false;
                                              }
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 4),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            hintText: "098888xxxx",
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "medium",
                                            ),
                                          ),
                                          style: TextStyle(
                                              fontSize: 15,
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
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 100,
                        ),
                        //Confirm
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  height: 44,
                                  onPressed: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    check(context);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  color: isConfirm
                                      ? Theme.of(context)
                                          .accentTextTheme
                                          .headline1
                                          .color
                                      : Theme.of(context)
                                          .primaryTextTheme
                                          .headline3
                                          .color,
                                  elevation: 0,
                                  highlightElevation: 0,
                                  child: Container(
                                    child: Text(
                                      "Konfirmasi",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .color,
                                          fontSize: 15,
                                          fontFamily: 'medium'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //OR
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          child: Text(
                            "atau",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline2
                                  .color,
                              fontSize: 18,
                              fontFamily: 'medium',
                            ),
                          ),
                        ),
                        //CONTINUE WITH FACEBOOK
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         child: MaterialButton(
                        //           height: 44,
                        //           onPressed: () {
                        //             FocusScope.of(context)
                        //                 .requestFocus(FocusNode());
                        //             Navigator.push(context,
                        //                 SlidePageRoute(page: HomePage()));
                        //           },
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(4)),
                        //           color: Theme.of(context)
                        //               .accentTextTheme
                        //               .subtitle1
                        //               .color,
                        //           elevation: 0,
                        //           highlightElevation: 0,
                        //           child:

                        //            Container(
                        //             height: 44,
                        //             child: Stack(
                        //               clipBehavior: Clip.none,
                        //               fit: StackFit.expand,
                        //               children: [
                        //                 Positioned.directional(
                        //                     textDirection:
                        //                         Directionality.of(context),
                        //                     start: -19,
                        //                     top: 0,
                        //                     bottom: 0,
                        //                     child: Image.asset(
                        //                       "assets/icons/ic_fb.png",
                        //                       scale: 3.2,
                        //                     )),
                        //                 Positioned.directional(
                        //                   textDirection:
                        //                       Directionality.of(context),
                        //                   start: 0,
                        //                   end: 0,
                        //                   top: 0,
                        //                   bottom: 0,
                        //                   child: Container(
                        //                     alignment: Alignment.center,
                        //                     child: Text(
                        //                       "Continue with Facebook",
                        //                       style: TextStyle(
                        //                         fontFamily: 'medium',
                        //                         fontSize: 15,
                        //                         color: Theme.of(context)
                        //                             .textTheme
                        //                             .subtitle2
                        //                             .color,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //Space
                        SizedBox(
                          height: 12,
                        ),
                        //CONTINUE WITH GOOGLE
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  height: 44,
                                  onPressed: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    Navigator.push(context,
                                        SlidePageRoute(page: HomePage()));
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline5
                                      .color,
                                  elevation: 0,
                                  highlightElevation: 0,
                                  child: Container(
                                    height: 44,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      fit: StackFit.expand,
                                      children: [
                                        Positioned.directional(
                                            textDirection:
                                                Directionality.of(context),
                                            start: -19,
                                            top: 0,
                                            bottom: 0,
                                            child: Image.asset(
                                              "assets/icons/ic_google.png",
                                              scale: 3.2,
                                            )),
                                        Positioned.directional(
                                          textDirection:
                                              Directionality.of(context),
                                          start: 0,
                                          end: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Masuk akun Google",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                                fontSize: 15,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2
                                                    .color,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
