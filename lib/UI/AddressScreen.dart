import 'package:flutter/material.dart';
import 'package:homital/UI/SelectAddressScreen.dart';
import 'package:homital/animation/SlideRightRoute.dart';
class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        top: 0,
                        bottom: 0,
                        start: 0,
                        end: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Address",
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
                //Card
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Card(
                     elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(6)),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons/ic_loc1.png",scale: 30,),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //87 Crown Street
                                  Container(
                                    child: Text("87 Crown Street",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline3.color
                                    ),),
                                  ),
                                  //London City
                                  Container(
                                    child: Text("London City",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline3.color
                                      ),),
                                  ),
                                  //ZIP: WC2B 6BL
                                  Container(
                                    child: Text("ZIP: WC2B 6BL",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline3.color
                                      ),),
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

                //New address
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: 44,
                          onPressed: () {
                            Navigator.push(context, SlidePageRoute(page: SelectAddressScreen()));
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
                                  "New address",
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
