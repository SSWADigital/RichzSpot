import 'package:flutter/material.dart';
import 'package:homital/ModelClasses/Models.dart';
class NewsScreen2 extends StatefulWidget {
  @override
  _NewsScreen2State createState() => _NewsScreen2State();
}

class _NewsScreen2State extends State<NewsScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              //
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/imgs/coronavirus_test_img.jpg")
                  )
                ),
              ),
              //Social Section
              Container(
                height: 20,
                child: Stack(
                  clipBehavior: Clip.none, children: [
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      top: -20,
                      start: 0,
                      end: 0,
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).textTheme.subtitle2.color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Image.asset("assets/icons/ic_fb_2.png",scale: 18,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Image.asset("assets/icons/ic_twitter.png",scale: 18,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Image.asset("assets/icons/ic_linkedIn.png",scale: 18,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Image.asset("assets/icons/ic_mail.png",scale: 18,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Image.asset("assets/icons/ic_pinterest.png",scale: 18,),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("Share",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline3.color
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Image.asset("assets/icons/ic_share.png",scale: 21,),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Space
              SizedBox(height: 30,),
              //Health
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Health
                    Container(
                      child: Text("Health",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "medium",
                        color: Theme.of(context).accentTextTheme.headline5.color
                      ),),
                    ),
                    //Marach 11, 2020
                    Container(
                      child: Text("March 11, 2020",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "medium",
                            color: Theme.of(context).accentTextTheme.headline4.color
                        ),),
                    ),
                  ],
                ),
              ),
              //COVID-19
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                child: Text("COVID-19 symptoms: what are they and should i see a doctor?",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: "medium",
                      color: Theme.of(context).accentTextTheme.headline2.color
                  ),),
              ),
              //Lorem ipsun dolor...
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                child: Text("Lorem ipsum dolor sit amet, consec adipiscing elit."
                    "Praesent et cons Nulla scelerisque ante inc mauris pulvinar,"
                    "ac sollicitudin purus consecte Proin in suscipit nisl, vitae fertum ipsum.",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "medium",
                      color: Theme.of(context).accentTextTheme.headline3.color
                  ),),
              ),
              //img
              Container(
                width: double.infinity,
                height: 160,
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/imgs/coronavirus_img.jpg")
                  )
                ),
              ),
              //Lorem ipsun dolor...
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                child: Text("Lorem ipsum dolor sit amet, consec adipiscing elit."
                    "Praesent et cons Nulla scelerisque ante inc mauris pulvinar,"
                    "ac sollicitudin purus consecte Proin in suscipit nisl, vitae fertum ipsum.",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "medium",
                      color: Theme.of(context).accentTextTheme.headline3.color
                  ),),
              ),
              //Source:
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                alignment: Alignment.centerLeft,
                child: Text("Source: ABCZ News",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color
                ),),
              ),
              //Divider
              Divider(
                height: 6,
                color: Theme.of(context).textTheme.headline5.color,
                thickness: 6,
              ),
              //Trending
              Container(
                padding: EdgeInsets.only(left: 20,top: 15,bottom: 12),
                alignment: Alignment.centerLeft,
                child: Text("Trending",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "medium",
                      color: Theme.of(context).accentTextTheme.headline2.color
                  ),),
              ),
              //
              ListView.builder(
                  itemCount: allNewsScreenList.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: InkWell(
                          onTap: (){
                          },
                          child: Container(
                            height: 110,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(allNewsScreenList[index].image)
                                      )
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //News
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text("NEWS",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontFamily: "medium",
                                                        color: Theme.of(context).accentTextTheme.headline5.color
                                                    ),),
                                                ),
                                                Container(
                                                  child: Text("March 11 , 2020",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontFamily: "medium",
                                                        color: Theme.of(context).accentTextTheme.headline4.color
                                                    ),),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Text(allNewsScreenList[index].title,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context).accentTextTheme.headline2.color
                                              ),),
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
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
