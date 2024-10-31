import 'package:flutter/material.dart';
import 'package:homital/Widget/Alert.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  //
  bool _obscureText = true;
  bool _obscureText2 = true;

  void _toggle(int i) {
   if(i==1){
     setState(() {
       _obscureText = !_obscureText;
     });
   }else if(i==2){
     setState(() {
       _obscureText2 = !_obscureText2;
     });
   }
  }
  //
  check(BuildContext context) {
    if (passwordController.text.isEmpty||passwordController.text.length < 6) {
        if(passwordController.text.length >0 && passwordController.text.length < 6){
          showDialog<void>(
              context: context,
              builder: (BuildContext dialogContext) {
                return Alert(title: "Alert !!!", subTile: "Password must be 6 digit !",);
              }
          );
        }else {
          showDialog<void>(
              context: context,
              builder: (BuildContext dialogContext) {
                return Alert(
                  title: "Alert !!!", subTile: "Password can't empty !",);
              }
          );
        }
    } else if (confirmPasswordController.text == confirmPasswordController.text ) {
      if(confirmPasswordController.text.isEmpty ){
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(title: "Alert !!!",
                subTile: "Confirm Password can't empty !",);
            }
        );
      }else if(passwordController.text != confirmPasswordController.text){
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(title: "Alert !!!",
                subTile: "Confirm Password must be match !",);
            }
        );
      }else{
       Navigator.pop(context);
      }
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
                        SizedBox(height: 70,),
                        //Change your password
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("Change your password",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                        ),
                        //Space
                        SizedBox(height: 38,),
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
                                      color: Theme.of(context).textTheme.headline3.color
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline2.color
                                ),
                              ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                end: 8,
                                top: 4,
                                child: InkWell(
                                  onTap: () {
                                    _toggle(1);
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _obscureText
                                          ? Image.asset(
                                        "assets/icons/ic_hide.png",
                                        scale: 3.7,
                                        color: Theme.of(context).textTheme.headline4.color,
                                      )
                                          : Image.asset(
                                        "assets/icons/ic_seen.png",
                                        scale: 3.7,
                                        color: Theme.of(context).textTheme.headline4.color,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 17,),
                        //Confirm Password Text Field
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Stack(
                            children: [
                              TextFormField(
                                obscureText: _obscureText2,
                                controller: confirmPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 14),
                                  labelText: "Confirm Password",
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
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                end: 8,
                                top: 4,
                                child: InkWell(
                                  onTap: () {
                                    _toggle(2);
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _obscureText2
                                          ? Image.asset(
                                        "assets/icons/ic_hide.png",
                                        scale: 3.7,
                                        color: Theme.of(context).textTheme.headline4.color,
                                      )
                                          : Image.asset(
                                        "assets/icons/ic_seen.png",
                                        scale: 3.7,
                                        color: Theme.of(context).textTheme.headline4.color,
                                      )),
                                ),
                              )
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
                                    "Change Password",
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
