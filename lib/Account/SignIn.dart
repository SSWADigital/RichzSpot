import 'dart:convert';

import 'package:homital/UI/BasicHeathScreen.dart';
// import 'package:homital/UI/qrmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homital/admin/home_admi.dart';
import 'package:homital/pengguna/home_pengguna.dart';
// import 'package:homital/Account/daftar.dart';
import 'ForgotPasswordScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'PhoneNumberScreen.dart';
import 'package:homital/UI/HomePage.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:homital/Account/SignIn.dart';

String login_id;
String login_username;
String login_password;
String login_status;
String pegawaiid;
String pegawainama;
String pegawai_alamat;
String pegawai_no_hp;
String pegawai_foto;
String pegawai_tanggal_lahir;
String pegawai_email;

Future<void> _ambildata() async {
  final prefs = await SharedPreferences.getInstance();

  var iduser = (prefs.get('pegawai_id'));
  print(iduser);
  return iduser;
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _showClearButton = false;

  void initState() {
    super.initState();
    _ambildata();
    emailController.addListener(() {
      setState(() {
        _showClearButton = emailController.text.length > 0;
      });
    });
  }

  Widget _getClearButton() {
    if (!_showClearButton) {
      return Text("");
    }
    return InkWell(
      onTap: () {
        emailController.clear();
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/icons/ic_clear.png",
            scale: 4.3,
          )),
    );
  }

  //
  bool _obscureText = true;
  String jabatan;
  List<dynamic> pilihjabatan = [
    {
      "jabatan_nama": "Pegawai",
      "nilai": "p",
    },
    {
      "jabatan_nama": "Admin",
      "nilai": "a",
    },
  ];
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //Form Validation
//   var _formKey = GlobalKey<FormState>();
//   String _email;
//   String _password;

//   void _submit() async {
//     final isValid = _formKey.currentState.validate();
//     if (!isValid) {
//       return;
//     }
//     _formKey.currentState.save();
//     Navigator.push(context, SlidePageRoute(page: HomePage()));
//   }

//   bool isEmail(String input) => EmailValidator.validate(input);
//   bool isPhone(String input) =>
//       RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
//           .hasMatch(input);

//   String validateMobile(String value) {
//     String patttern = r'(^[0-9]*$)';
//     RegExp regExp = new RegExp(patttern);
//     if (value.length == 0) {
//       return "Invalid phone no";
//     }
//     return null;
//   }

// //
//   String validatePassword(String value) {
//     final RegExp _passwordRegExp = RegExp(
//       r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
//     );
//     Pattern pattern = "^(?=(.*\d){1})(.*\S)(?=.*[a-zA-Z\S])[0-9a-zA-Z\S]{8,}";
//     RegExp regex = new RegExp(pattern);
//     print(value);
//     if (value.isEmpty) {
//       return 'Invalid password';
//     } else if (value.length < 8) {
//       return "Password should be between 8-20 characters";
//     } else {
//       if (!_passwordRegExp.hasMatch(value))
//         return 'Use 8-20 characters from at least 2 categories:\nletters, numbers, special characters';
//       else
//         return null;
//     }
//   }

  bool checkBoxValue = false;
  _onChange(bool val) {
    setState(() {
      checkBoxValue = val;
    });
  }

  //============================================================================
  // List datauser;
  Future _login() async {
    print(emailController.text);
    print(passwordController.text);
    print(jabatan);

    if (emailController.text.isEmpty || emailController.text.isEmpty) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Pembritahuan !!!",
              subTile: "Akun data tidak benar!",
            );
          });
    }

    final Response = await http
        .post(Uri.parse("http://103.157.97.200/richzspot/login/login"), body: {
        "username": emailController.text,
        "password": passwordController.text,
    });

    var datauser = jsonDecode(Response.body);

    if (datauser == false) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Pembritahuan !!!",
              subTile: "Tidak ada Koneksi",
            );
          });
      //========================================================================
    } else if (datauser == "0") {
      showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Pembritahuan !!!",
              subTile: "Anda Belum Terdaftar",
            );
          });
      // } else if (datauser[0]['user_status'] == "a") {
      //   showDialog<void>(
      //       context: context,
      //       builder: (BuildContext dialogContext) {
      //         return Alert(
      //           title: "Pembritahuan !!!",
      //           subTile: "Menunggu Admin Menijau Akun Anda",
      //         );
      //       });
    } else {
      this.setState(() {
        // Navigator.push(context,
        //     SlidePageRoute(page: HomePage(pegawai_id: datauser[0]['nip'])));
        // datauser = jsonDecode(Response.body);

        login_id = datauser['user_id'];

        pegawaiid = datauser['user_id'];

        // pegawai_foto = datauser[0]['pegawai_foto'];
        // pegawai_tanggal_lahir = datauser[0]['pegawai_no_str'];
        // pegawai_email = datauser[0]['telemedicine_id'];
        print(pegawaiid);
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool("isUser", true);
      // prefs.setString("login_id", datauser[0]['login_id']);
      // prefs.setString("username", datauser[0]['usr_name']);
      prefs.setString("pegawai_id", datauser['user_id']);
      prefs.setString("departemen_id", datauser['departemen_id']);

      prefs.setString("role_kode", datauser['role_kode']);
      // prefs.setString("usr_when_create", datauser[0]['usr_when_create']);
      // prefs.setString("usr_loginname", datauser[0]['usr_loginname']);
      // prefs.setString("usr_email", datauser[0]['usr_email']);
      if (datauser['role_kode'] == "A") {
        // Navigator.push(context, SlidePageRoute(page: HomePagePengguna()));
        // datauser = jsonDecode(Response.body);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePagePengguna()),
            (route) => false);
      } else {
        Navigator.push(context, SlidePageRoute(page: HomePageAdmin()));
      }

      print(datauser);
      return datauser;
    }
  }

  //============================================================================
  // checkVal(BuildContext context) {
  //   if (emailController.text.isEmpty) {
  // return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext dialogContext) {
  //       return Alert(
  //         title: "Alert !!!",
  //         subTile: "Email is required !",
  //       );
  //     });
  //   } else if (passwordController.text.isEmpty ||
  //       passwordController.text.length < 3) {
  //     if (passwordController.text.length >= 1 &&
  //         passwordController.text.length < 3) {
  //       showDialog<void>(
  //           context: context,
  //           builder: (BuildContext dialogContext) {
  //             return Alert(
  //               title: "Alert !!!",
  //               subTile: "Password must be 3 digit !",
  //             );
  //           });
  //     } else {
  //       showDialog<void>(
  //           context: context,
  //           builder: (BuildContext dialogContext) {
  //             return Alert(
  //               title: "Alert !!!",
  //               subTile: "Password can't empty !",
  //             );
  //           });
  //     }
  //   } else {
  //     _login();
  //   }
  // }

  Future masuk() {
    if (jabatan == "p") {
      Navigator.push(context, SlidePageRoute(page: HomePagePengguna()));
      // datauser = jsonDecode(Response.body);

    } else {
      Navigator.push(context, SlidePageRoute(page: HomePageAdmin()));
    }
  }

  //============================================================================
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MediaQuery(
      data: queryData.copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: Scaffold(
          body: Form(
            // key: _formKey,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: 300,
                    // height: 300,

                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/icons/riclog.png",
                            ))),
                  ),
                  //Appbar
                  // Container(
                  //   height: 50,
                  //   child: Stack(
                  //     fit: StackFit.expand,
                  //     children: [
                  //       //back btn
                  //       Positioned.directional(
                  //         textDirection: Directionality.of(context),
                  //         start: -4,
                  //         top: 0,
                  //         bottom: 0,
                  //         child: InkWell(
                  //           onTap: () {
                  //             Navigator.pop(context);
                  //           },
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(10.0),
                  //             child: Image.asset(
                  //               "assets/icons/ic_back.png",
                  //               scale: 30,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          //Space
                          SizedBox(
                            height: 35,
                          ),
                          //Sign In
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                  fontSize: 30,
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
                          //Don't have an account?...
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                // FocusScope.of(context)
                                //     .requestFocus(FocusNode());
                                // Navigator.push(
                                //     context, SlidePageRoute(page: daftar()));
                              },
                              child: RichText(
                                text: new TextSpan(
                                  text: "Aplikasi Absensi Kepegawaian",
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
                          ),
                          //Space
                          SizedBox(
                            height: 50,
                          ),
                          //Email or Phone Number
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 14),
                                    labelText: "Masukan Email Anda ",
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
                            height: 17,
                          ),
                          //Password Text Field
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                TextFormField(
                                  obscureText: _obscureText,
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 14),
                                    labelText: "Password",
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
                                Positioned.directional(
                                  textDirection: Directionality.of(context),
                                  end: 8,
                                  top: 4,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _toggle();
                                      });
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _obscureText
                                            ? Image.asset(
                                                "assets/icons/ic_hide.png",
                                                scale: 3.7,
                                                color: Theme.of(context)
                                                    .accentTextTheme
                                                    .headline1
                                                    .color,
                                              )
                                            : Image.asset(
                                                "assets/icons/ic_seen.png",
                                                scale: 3.7,
                                                color: Theme.of(context)
                                                    .accentTextTheme
                                                    .headline1
                                                    .color,
                                              )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: const EdgeInsets.all(15.0),
                          //   padding: const EdgeInsets.all(3.0),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(
                          //           color: Theme.of(context)
                          //               .accentTextTheme
                          //               .headline4
                          //               .color)),
                          //   // padding: EdgeInsets.symmetric(horizontal: 16),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(1.0),
                          //     child: DropdownButton(
                          //       isExpanded: true,

                          //       hint: Text(
                          //         "   Jabatan",
                          //         style: TextStyle(
                          //             fontSize: 14,
                          //             fontFamily: "medium",
                          //             color: Theme.of(context)
                          //                 .accentTextTheme
                          //                 .headline4
                          //                 .color),
                          //         semanticsLabel: "Jabatan",
                          //       ),
                          //       // borderRadius: BorderRadius.circular(4),
                          //       value: jabatan,
                          //       items: pilihjabatan.map((item) {
                          //         return DropdownMenuItem(
                          //           child: Text(
                          //             item['jabatan_nama'],
                          //             style: TextStyle(
                          //                 fontSize: 14,
                          //                 fontFamily: "medium",
                          //                 color: Theme.of(context)
                          //                     .accentTextTheme
                          //                     .headline2
                          //                     .color),
                          //           ),
                          //           value: item['nilai'],
                          //         );
                          //       }).toList(),
                          //       onChanged: (value) {
                          //         setState(() {
                          //           jabatan = value;
                          //           print(jabatan);
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // ),

                          SizedBox(height: 40),

                          //SIGN IN button
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: MaterialButton(
                                    height: 44,
                                    onPressed: () {
                                      // Navigator.push(context,
                                      //     SlidePageRoute(page: HomePage()));
                                      setState(() {
                                        // masuk();
                                        _login();
                                      });
                                      // FocusScope.of(context)
                                      //     .requestFocus(FocusNode());
                                      // checkVal(context);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    color: Color(0xff020438),
                                    elevation: 0,
                                    highlightElevation: 0,
                                    child: Container(
                                      child: Text(
                                        "Masuk",
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
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 15),
                          //   alignment: Alignment.center,
                          //   child: Text(
                          //     "OR",
                          //     style: TextStyle(
                          //       color:
                          //           Theme.of(context).textTheme.headline2.color,
                          //       fontSize: 18,
                          //       fontFamily: 'medium',
                          //     ),
                          //   ),
                          // ),
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
                          //           child: Container(
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
                          //               .headline5
                          //               .color,
                          //           elevation: 0,
                          //           highlightElevation: 0,
                          //           child: Container(
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
                          //                       "assets/icons/ic_google.png",
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
                          //                       "Masuk akun Google",
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
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
