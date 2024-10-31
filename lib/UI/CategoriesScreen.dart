import 'package:flutter/material.dart';
import 'package:homital/NewsTabs/MedicalTab.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'HospitalScreen.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatefulWidget {
  String title;
  CategoriesScreen({this.title});
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Map<String, String>> list = [
    {
      "img": "assets/icons/ic_endocrine.png",
      "title": "Endocrine",
    },
    {
      "img": "assets/icons/ic_andrology.png",
      "title": "THT",
    },
    {
      "img": "assets/icons/ic_nutrition.png",
      "title": "Gizi",
    },
    {
      "img": "assets/icons/ic_dermatology.png",
      "title": "Dermatologi",
    },
    {
      "img": "assets/icons/ic_heart.png",
      "title": "Jantung",
    },
    {
      "img": "assets/icons/ic_neurology.png",
      "title": "Neurology",
    },
  ];
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
                            "Spesialis",
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
                  child: ListView(
                    children: [
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //Search for specialist
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 42,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2
                                    .color),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 14, bottom: 10, right: 45),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Cari Dokter",
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "medium",
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .color),
                              ),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline2
                                      .color),
                            ),
                            Positioned.directional(
                              textDirection: Directionality.of(context),
                              end: 8,
                              top: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/icons/ic_search.png",
                                      scale: 24,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //list
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 12.0,
                            runSpacing: 10.0,
                            children: List.generate(list.length, (index) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.4 +
                                    10,
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: InkWell(
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      Navigator.push(
                                          context,
                                          SlidePageRoute(
                                              page: HospitalScreen()));
                                    },
                                    child: Container(
                                      height: 64,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            list[index]["img"],
                                            scale: 20,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Text(
                                                list[index]["title"],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "medium",
                                                    color: Theme.of(context)
                                                        .accentTextTheme
                                                        .headline3
                                                        .color),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
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
