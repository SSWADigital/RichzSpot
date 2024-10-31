import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homital/UI/NewsScreen2.dart';
import 'package:homital/ModelClasses/Models.dart';
import 'package:homital/ModelClasses/Models.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AllNewsScreen extends StatefulWidget {
  @override
  _AllNewsScreenState createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  PageController _pageController;
  int currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onChangedFunction(int index) {
    setState(() {
      currentPage = index;
    });
  }

  Container customSlider() {
    return Container(
      height: 205,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 205,
              aspectRatio: 16 / 10,
              viewportFraction: 0.90,
              initialPage: 0,
              // ignore: non_constant_identifier_names
              onPageChanged: (int i, CarouselPageChangedReason) {
                setState(() {
                  currentPage = i;
                });
              },
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: allNewsScreenSlider.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(i.image))),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Stack(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Health
                              Container(
                                margin: EdgeInsets.only(bottom: 4),
                                width: 55,
                                height: 27,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .accentTextTheme
                                        .headline1
                                        .color,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  "Health",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .color),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  i.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      height: 1.2,
                                      color: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .color),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Dimitri - March 9, 2020",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .color),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          //dote
          Positioned.directional(
            textDirection: Directionality.of(context),
            bottom: 8,
            start: 0,
            end: 30,
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(3, (index) => buildDot(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //
  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.only(right: 7),
      width: currentPage == index ? 14 : 6,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: Theme.of(context).accentTextTheme.headline1.color),
        color: currentPage == index
            ? Theme.of(context).accentTextTheme.headline1.color
            : Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          //Space
          SizedBox(
            height: 5,
          ),
          //slide
          customSlider(),
          //Trending
          Container(
            padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "Trending",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color),
            ),
          ),
          //
          ListView.builder(
              itemCount: allNewsScreenList.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        //     Navigator.push(context, SlidePageRoute(page: NewsScreen2()));
                      },
                      child: Container(
                        height: 115,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 115,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          allNewsScreenList[index].image))),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //News
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            "NEWS",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "medium",
                                                color: Theme.of(context)
                                                    .accentTextTheme
                                                    .headline5
                                                    .color),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "March 11 , 2020",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "medium",
                                                color: Theme.of(context)
                                                    .accentTextTheme
                                                    .headline3
                                                    .color),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      allNewsScreenList[index].title,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "medium",
                                          color: Theme.of(context)
                                              .accentTextTheme
                                              .headline2
                                              .color),
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
