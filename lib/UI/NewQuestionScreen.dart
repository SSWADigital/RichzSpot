import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NewQuestionScreen extends StatefulWidget {
  @override
  _NewQuestionScreenState createState() => _NewQuestionScreenState();
}

class _NewQuestionScreenState extends State<NewQuestionScreen> {
  bool isSend=false;
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
                            "New question",
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
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        //Space
                        SizedBox(height: 10,),
                        //card
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            margin: EdgeInsets.zero,
                            child: Container(
                              height: 52,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Image.asset("assets/icons/ic_user.png",scale: 26,),
                                  Expanded(
                                      child:Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Text("Who is asking?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline5.color
                                        ),),
                                      ) ),
                                  Image.asset("assets/icons/ic_forward.png",scale: 32,),
                                ],
                              ),
                            ),
                          )
                        ),
                        //Space
                        SizedBox(height: 22,),
                        //TextField
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryTextTheme.headline3.color
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextFormField(
                            maxLines: 5,
                            onChanged: (value){
                              setState(() {
                                if(value.length>0){
                                  isSend=true;
                                }else{
                                  isSend=false;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder:InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                errorBorder:  InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter your question here",
                                hintStyle: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15,
                                  color: Theme.of(context).textTheme.headline3.color,
                                )
                            ),
                            style: TextStyle(
                                color: Theme.of(context).accentTextTheme.headline2.color,
                                fontSize: 15,
                                fontFamily: "medium"
                            ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 5,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child:  Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
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
                              color: isSend? Theme.of(context).accentTextTheme.headline1.color:
                              Theme.of(context).primaryTextTheme.headline3.color,
                              elevation: 0,
                              highlightElevation: 0,
                              child: Container(
                                child: Text(
                                  "Send",
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
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
