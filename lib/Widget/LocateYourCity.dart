import 'package:flutter/material.dart';
import 'package:homital/HomePageTabs/HomeScreen.dart';

class LocateYourCity extends StatefulWidget {
  @override
  _LocateYourCityState createState() => _LocateYourCityState();
}

class _LocateYourCityState extends State<LocateYourCity> {
  int _selectedItem = 0;
  onSwitch(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  List radioList = [
    "Surakarta",
    "Boyolali",
    "Klaten",
    "Sukoharjo",
    "Wonogiri",
    "Surabaya",
    "Yogyakarta",
  ];
  String loc;
  //
  Container radioWidget() {
    return Container(
        child: Column(
      children: List.generate(
          radioList.length,
          (index) => Container(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      onSwitch(index);
                      _selectedItem = index;
                      loc = radioList[index];
                    });
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 20, right: 16),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline4
                                    .color))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            radioList[index],
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: _selectedItem == index
                                    ? Theme.of(context)
                                        .accentTextTheme
                                        .headline2
                                        .color
                                    : Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .color),
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: Radio(
                            value: index,
                            onChanged: (val) {
                              setState(() {
                                _selectedItem = index;
                              });
                            },
                            groupValue: _selectedItem,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
    ));
  }

  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MediaQuery(
      data: queryData.copyWith(textScaleFactor: 1.0),
      child: Container(
        height: 560,
        child: Column(
          children: [
            //Space
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/icons/ic_locate.png",
              scale: 6,
            ),
            //Space
            SizedBox(
              height: 10,
            ),
            //Locate Your City
            Container(
              alignment: Alignment.center,
              child: Text(
                "Locate Your City",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "medium",
                    color: Theme.of(context).accentTextTheme.headline2.color),
              ),
            ),
            //Space
            SizedBox(
              height: 8,
            ),
            //Choose your city so...
            Container(
              alignment: Alignment.center,
              child: Text(
                "Choose your city so we can offer\nthe service that suit you",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "medium",
                    color: Theme.of(context).accentTextTheme.headline2.color),
              ),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            radioWidget(),
            //Space
            SizedBox(
              height: 30,
            ),
            //Select
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      height: 44,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.pop(context, loc);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      color: Theme.of(context).accentTextTheme.headline1.color,
                      elevation: 0,
                      highlightElevation: 0,
                      child: Container(
                        child: Text(
                          "Select",
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
          ],
        ),
      ),
    );
  }
}
