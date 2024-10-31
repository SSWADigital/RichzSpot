import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'OTPScreen2.dart';
class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController emailController = new TextEditingController();
  check (BuildContext context){
    if(emailController.text.isEmpty){
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(title: "Alert !!!",subTile: "Email is required !",);
          }
      );
    }else{
      Navigator.push(context, SlidePageRoute(page: OTPScreen2(email: email,)));
    }
  }
String email;
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
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 18,
                                fontWeight: FontWeight.w700,
                              fontFamily: 'medium',
                              color: Theme.of(context).accentTextTheme.headline2.color
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
                        SizedBox(height: 40,),
                        //Change your password
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("Enter the email address you signed up with "
                              "we'll send you an email that will let you choose "
                              "another password.",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                        ),
                        //Space
                        SizedBox(height: 38,),
                        //Your Email
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: emailController,
                                onChanged: (val){
                                  setState(() {
                                    email = val;
                                  });
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 5,left: 14),
                                  labelText: "Your Email",
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context).textTheme.headline3.color
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline2.color
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 30,),
                        //CHANGE PASSWORD button
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  height: 44,
                                  onPressed: () {
                                    check(context);
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(4)),
                                  color:  Theme.of(context).accentTextTheme.headline1.color,
                                  elevation: 0,
                                  highlightElevation: 0,
                                  child: Text(
                                    "Reset Password",
                                    style: TextStyle(
                                        color:  Theme.of(context).textTheme.subtitle2.color,
                                        fontSize: 15,
                                        fontFamily: 'medium'),
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
