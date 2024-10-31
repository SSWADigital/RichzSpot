import 'package:flutter/material.dart';
import 'package:homital/DoctorListScreenTabs/DokterTelehealth.dart';
import 'package:homital/NewsTabs/MedicalTab.dart';
import 'package:homital/UI/CategoriesScreen.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'HospitalScreen.dart';

class doktertelehalth1 extends StatefulWidget {
  const doktertelehalth1({Key key}) : super(key: key);

  @override
  State<doktertelehalth1> createState() => _doktertelehalth1State();
}

class _doktertelehalth1State extends State<doktertelehalth1>
    with SingleTickerProviderStateMixin {
  @override
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
                            "Telehealth",
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
                      //search icon
                      Positioned(
                        right: 4,
                        top: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                SlidePageRoute(page: CategoriesScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/icons/ic_search.png",
                              scale: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Space
                // SizedBox(
                //   child: DokterTelehealth(),
                // ),
                Expanded(child: DokterTelehealth()),

                //  Expanded(
                //  DokterTelehealth()
                //     // Dentist(),
                //     // Orthopodist(),
                //     // Surgeon(),
                //   ]),
                // ),

                //TabBar

                //

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
