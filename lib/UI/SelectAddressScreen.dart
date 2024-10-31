import 'package:flutter/material.dart';
import 'package:homital/UI/YourAddressScreen.dart';
import 'package:homital/animation/SlideRightRoute.dart';
class SelectAddressScreen extends StatefulWidget {
  @override
  _SelectAddressScreenState createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  bool isSelect=false;
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
                      Positioned(
                        left: -4,
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
                            "Select address",
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
                SizedBox(height: 12,),
                //Card
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10),
                    side: BorderSide(
                        width: 1,
                        color: isSelect?Theme.of(context).accentTextTheme.headline1.color:Colors.transparent
                    )),
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isSelect=true;
                        });
                      },
                      child: Container(
                        height: 105,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 13,right: 8,top: 13,bottom: 13),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/icons/ic_loc1.png",scale: 30,),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //87 Crown Street
                                    Container(
                                      child: Text("87 Crown Street",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline3.color
                                        ),),
                                    ),
                                    //London City
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 3),
                                      child: Text("London City",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline3.color
                                        ),),
                                    ),
                                    //ZIP: WC2B 6BL
                                    Container(
                                      child: Text("ZIP: WC2B 6BL",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline3.color
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                addressDialogue();
                              },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Image.asset("assets/icons/ic_menu.png",scale: 30,))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //New address
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: 44,
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.push(context, SlidePageRoute(page: YourAddressScreen()));
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
                                  "New Address",
                                  style: TextStyle(
                                      color:  Theme.of(context).accentTextTheme.headline5.color,
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
            elevation: 5,
            color: Colors.white,
            child: Container(
              height: 70,
              child:  Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 44,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(6)),
                        color: isSelect? Theme.of(context).accentTextTheme.headline1.color:
                        Theme.of(context).primaryTextTheme.headline3.color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Select",
                            style: TextStyle(
                                color:  Theme.of(context).textTheme.subtitle2.color,
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

  void addressDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
            builder: (context,setState){
              return  Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                insetPadding: EdgeInsets.all(30),
                child: Container(
                  height: 160,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                     Container(
                       child: Column(
                         children: [
                           Container(
                             alignment: Alignment.centerLeft,
                             child: Text("Address: 87 Crown Street",
                               style: TextStyle(
                                   fontSize: 18,
                                   fontFamily: "medium",
                                   color: Theme.of(context).accentTextTheme.headline2.color
                               ),),
                           ),
                           Container(
                             padding: EdgeInsets.only(top: 5),
                             alignment: Alignment.centerLeft,
                             child: Text("What do you wanna do to this address?",
                               style: TextStyle(
                                   fontSize: 13,
                                   fontFamily: "medium",
                                   color: Theme.of(context).accentTextTheme.headline3.color
                               ),),
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
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text("Cancel",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline3.color
                                ),),
                              ),
                            ),
                            //Space
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: (){
                                confirmationDialogue();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text("Delete",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline1.color
                                  ),),
                              ),
                            ),
                            //Space
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text("Edit",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline5.color
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }

  void confirmationDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
            builder: (context,setState){
              return  Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                insetPadding: EdgeInsets.all(30),
                child: Container(
                  height: 160,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      Container(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Confirmation",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "medium",
                                    color: Theme.of(context).textTheme.headline1.color
                                ),),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: new TextSpan(
                                  text: "Do you really want to delete ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline3.color
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: "87 Crown street",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline2.color
                                        ),
                                    ),
                                    new TextSpan(
                                      text: " address?",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline3.color
                                      ),
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
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text("Cancel",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline3.color
                                  ),),
                              ),
                            ),
                            //Space
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text("Delete",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline1.color
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }
  //_yourAddressScreenRoute
  Route _yourAddressScreenRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => YourAddressScreen(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
