import 'package:flutter/material.dart';
import 'package:homital/Account/SignIn.dart';
import 'package:homital/UI/HomePage.dart';
class Slide extends StatefulWidget {
  final String title;
  final String discription;
  final String img;

  Slide({this.title, this.discription, this.img});

  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //
          Container(
            child: Column(
              children: [
                //Space
                SizedBox(height: 40,),
                //Home Check-Up
                Container(
                  child: Text(widget.title,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "bold",
                        color: Theme.of(context).accentTextTheme.headline2.color
                    ),),
                ),
                //Samples are taken at home.
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(widget.discription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "medium",
                        color: Theme.of(context).accentTextTheme.headline3.color
                    ),),
                ),
                //Space
                SizedBox(height: 40,),
                Image.asset(widget.img,height: MediaQuery.of(context).size.height*0.4,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
