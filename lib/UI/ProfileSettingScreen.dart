import 'package:flutter/material.dart';
class ProfileSettingScreen extends StatefulWidget {
  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
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
                        start: -1.5,
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
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Profile Settings",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'medium',
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Space
                SizedBox(height: 20,),
                //Card
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(6),
                        ),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Dimitri Petrenko
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/icons/ic_user.png",scale: 30,),
                                          Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text("Dimitri Petrenko",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context).accentTextTheme.headline3.color
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //03 - 03 - 2033
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/icons/ic_cake.png",scale: 30,),
                                          Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text("03 - 03 - 2033",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context).accentTextTheme.headline3.color
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //Male
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/icons/ic_gendar.png",scale: 30,),
                                          Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text("Male",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context).accentTextTheme.headline3.color
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Image.asset("assets/icons/ic_menu.png",scale: 30,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //New profile
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: 44,
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(6)),
                          color:  Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.2),
                          elevation: 0,
                          highlightElevation: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/ic_add.png",scale: 43,),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "New profile",
                                  style: TextStyle(
                                      color:  Theme.of(context).accentTextTheme.headline5.color,
                                      fontSize: 14,
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
        ),
      ),
    );
  }
}
