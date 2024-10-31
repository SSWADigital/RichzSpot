import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homital/Widget/Slide.dart';
import 'package:homital/Account/SignIn.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'HomePage.dart';

class IntroducationScreen extends StatefulWidget {
  @override
  _IntroducationScreenState createState() => _IntroducationScreenState();
}

class _IntroducationScreenState extends State<IntroducationScreen> {
  int currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  List<Widget> _pages = [
    Slide(
        title: "Home Care",
        discription: "Sampel diambil "
            "di rumah.\nMemberikan hasil yang cepat dan akurat",
        img: "assets/imgs/slide_img1.png"),
    Slide(
        title: "Waktu yang Fleksibel",
        discription: "Pilih waktu "
            "pengambilan sampel dan check-up\nsesuai permintaan anda.",
        img: "assets/imgs/slide_img2.png"),
    Slide(
        title: "Informasi Kesehatan",
        discription: "Ngobrol dan dapatkan"
            " saran kesehatan dari\ndokter berpengalaman.",
        img: "assets/imgs/slide_img3.png"),
  ];

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.only(right: 7),
      width: currentPage == index ? 25 : 7,
      height: 7,
      decoration: BoxDecoration(
          color: currentPage == index
              ? Theme.of(context).accentTextTheme.headline1.color
              : Theme.of(context).textTheme.headline4.color,
          borderRadius: BorderRadius.circular(3.5)),
    );
  }

  String swipe = "Geser ke Kiri";
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
                      //Skip
                      Positioned.directional(
                        top: 6,
                        bottom: 0,
                        end: 14,
                        textDirection: Directionality.of(context),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Lewati",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'medium',
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline2
                                      .color),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    //  fit: StackFit.expand,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: PageView.builder(
                            physics: ClampingScrollPhysics(),
                            itemCount: _pages.length,
                            controller: _pageController,
                            onPageChanged: (value) {
                              setState(() {
                                currentPage = value;
                              });
                            },
                            itemBuilder: (context, index) {
                              return _pages[index];
                            }),
                      ),
                      //dote
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        bottom: 20,
                        start: 0,
                        end: 0,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                _pages.length, (index) => buildDot(index)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                Spacer(),

                //Space
                SizedBox(
                  height: 50,
                ),
                //Swipe Left
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      if (currentPage == 2) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        currentPage == 2 ? "Lanjut" : "Geser ke kiri",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "medium",
                            color: currentPage == 2
                                ? Theme.of(context).textTheme.headline2.color
                                : Theme.of(context).textTheme.headline3.color),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
