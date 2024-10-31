import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
class ServiceWidget extends StatefulWidget {
  const ServiceWidget({Key key}) : super(key: key);

  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {

  List<Map<String,String>> tags =[
    {
      "img":"assets/icons/ic_gender2.png",
      "title":"Any gender",
    },
    {
      "img":"assets/icons/ic_cake.png",
      "title":"Any age",
    },
    {
      "img":"assets/icons/ic_test_b.png",
      "title":"13 Tests",
    },
    {
      "img":"assets/icons/ic_file.png",
      "title":"4 Categories check-up",
    },
  ];

  List<String> listOfTags = [];
  List<String> tagsList = ['apple', 'banana', 'orange', 'kiwi' , ''];
  List<String> selectedTags = [];

  _sugestionList({@required List<String> tags , @required String suggestion}) {
    List<String> modifiedList = [];
    modifiedList.addAll(tags);
    modifiedList.retainWhere((text) => text.toLowerCase().contains(suggestion.toLowerCase()));
    if(suggestion.length >=2) {
      return modifiedList;
    }
    else {
      return null;
    }
  }


  _generateTags() {
    return selectedTags.isEmpty ?
    Container()
        :
    Container(
      alignment: Alignment.topLeft,
      child: Tags(
        alignment: WrapAlignment.center,
        itemCount: selectedTags.length,
        itemBuilder: (index) {
          return ItemTags(
            index: index,
            title: selectedTags[index],
            color: Colors.blue,
            activeColor: Colors.red,
            onPressed: (Item item) {
              print('pressed');
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0.0,
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
//                textColor: ,
            textColor: Colors.white,
            textActiveColor: Colors.white,
            removeButton: ItemTagsRemoveButton(
                color: Colors.black,
                backgroundColor: Colors.transparent,
                size: 14,
                onRemoved: () {
                  _onSuggestionRemoved(selectedTags[index]);
                  return true;
                }),
            textOverflow: TextOverflow.ellipsis,
          );
        },
      ),
    );
  }

  _onSuggestionSelected(String value) {
    final String exists = tagsList.firstWhere((text) => text==value,orElse: (){return null;});
    if(exists !=null) {
      final String isAlreadyInSelectedList = selectedTags.firstWhere((text)=> text==value,orElse: () {return null;});

      if(isAlreadyInSelectedList ==null) {
        setState(() {
          selectedTags.add(value);
          tagsList.remove(value);
        });
      }
    }
  }

  _onSuggestionRemoved(String value) {
    final String exists = selectedTags.firstWhere((text) => text==value,orElse: () {return null;});
    if(exists !=null) {
      setState(() {
        selectedTags.remove(value);
        tagsList.add(value);
      });
    }
  }

  _addSuggestion(String value) {
    final String exists = tagsList.firstWhere((text) => text ==value,orElse: () {return null;});
    if(exists !=null) {
      final String isAlreadyInSelectedList = selectedTags.firstWhere((text) => text ==value,orElse: () {return null;});
      if(isAlreadyInSelectedList ==null) {
        setState(() {
          selectedTags.add(value);
          tagsList.remove(value);
        });
      }
    }
    else {
      final String isAlreadyInSelectedList = selectedTags.firstWhere((text) => text==value,orElse: () {return null;});
      if(isAlreadyInSelectedList ==null) {
        setState(() {
          selectedTags.add(value);
        });
      }
    }
  }

  Widget tag(){
    return Container(
      child: Tags(
        key: _globalKey,
        itemCount:tags.length==null? 0 : tags.length,
        columns: 3,
        itemBuilder: (index){
          return ItemTags(index: index,
            title: tags[index]["title"],
            textStyle: TextStyle(
              fontSize: 14
            ),
            pressEnabled: false,
            combine: ItemTagsCombine.withTextAfter,
            onPressed: (i) => print(i),
            onLongPressed: (i) => print(i),
            image: ItemTagsImage(
                image: AssetImage(tags[index]["img"],) // OR NetworkImage("https://...image.png")
            ),
          );
              
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();

  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return StatefulBuilder(
        builder: (BuildContext ctx, StateSetter stateSetter) {
          return MediaQuery(
            data: queryData.copyWith(textScaleFactor: 1.0),
            child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.9 - 30,
                child: Column(
                  children: [
                    //Service
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Theme
                                      .of(context)
                                      .primaryTextTheme
                                      .headline3
                                      .color
                              )
                          )
                      ),
                      alignment: Alignment.center,
                      child: Text("Service",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "medium",
                            color: Theme
                                .of(context)
                                .accentTextTheme
                                .headline2
                                .color
                        ),),
                    ),
                    //
                    Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                //   Navigator.push(context, _basicHealthScreenRoute());
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    //Space
                                    SizedBox(height: 15,),
                                    //top
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          //img
                                          Container(
                                            width: 90,
                                            height: 90,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(7),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/imgs/checkup.jpg")
                                                )
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(left: 10),
                                              height: 90,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  //Basic health examination...
                                                  Container(
                                                    child: Text(
                                                      "Basic health examination",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: "medium",
                                                          color: Theme
                                                              .of(context)
                                                              .accentTextTheme
                                                              .headline2
                                                              .color
                                                      ),),
                                                  ),
                                                  //Lorem...
                                                  Container(
                                                    child: Text(
                                                      "Lorem ipsum dolor sit amet, consec adipiscing elit. Praesent et cons...",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: "medium",
                                                          color: Theme
                                                              .of(context)
                                                              .accentTextTheme
                                                              .headline4
                                                              .color
                                                      ),),
                                                  ),
                                                  //Detail
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets
                                                              .only(right: 2),
                                                          child: Text("Detail",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily: "medium",
                                                                color: Theme
                                                                    .of(context)
                                                                    .accentTextTheme
                                                                    .headline5
                                                                    .color
                                                            ),),
                                                        ),
                                                        Image.asset(
                                                          'assets/icons/ic_forward.png',
                                                          scale: 50,)
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //Space
                                    SizedBox(height: 15,), //Space
                                    tagWidget(),
                                    SizedBox(height: 15,),
                                    //Price Book now btn
                                    Container(
                                      height: 75,
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                width: 1,
                                                color: Theme.of(context).primaryTextTheme.headline3.color
                                            ),
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Theme.of(context).primaryTextTheme.headline3.color
                                            ),
                                          )
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text("Price",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontFamily: "medium",
                                                          color: Theme.of(context).accentTextTheme.headline2.color
                                                      ),),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(top: 4),
                                                    child: Text("\$ 1200",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: "medium",
                                                          color: Theme.of(context).accentTextTheme.headline1.color
                                                      ),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          //
                                          MaterialButton(
                                            height: 44,
                                            minWidth:145,
                                            onPressed: () {
                                              FocusScope.of(context).requestFocus(FocusNode());
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(6)),
                                            color:  Theme.of(context).accentTextTheme.headline1.color,
                                            elevation: 0,
                                            highlightElevation: 0,
                                            child: Container(
                                              child: Text(
                                                "Book now",
                                                style: TextStyle(
                                                    color:  Theme.of(context).textTheme.subtitle2.color,
                                                    fontSize: 14,
                                                    fontFamily: 'medium'),
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
                      ),
                    )
                  ],
                )
            ),
          );
        }
    );
  }
  Widget tagWidget(){
    return   //
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFFFBC02D).withOpacity(0.3)
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/icons/ic_gender2.png",scale: 30,),
                            Container(
                              padding: EdgeInsets.only(left: 4),
                              child: Text("Any gender",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "medium",
                                    color: Color(0xFFFBC02D)
                                ),),
                            )
                          ],
                        ),
                      )),
                  //Space
                  SizedBox(width: 8,),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3)
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/icons/ic_cake.png",scale: 30,),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text("Any age",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline5.color
                                ),),
                            )
                          ],
                        ),
                      )),
                  //Space
                  SizedBox(width: 8,),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context).accentTextTheme.headline1.color.withOpacity(0.3)
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/icons/ic_test_b.png",scale: 30,),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text("13 Tests",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline1.color
                                ),),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            //Space
            SizedBox(height: 10,),
            //4 Categories check-up
            Row(
              children: [
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).accentTextTheme.headline6.color.withOpacity(0.3)
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/icons/ic_file.png",scale: 30,),
                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Text("4 Categories check-up",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context).accentTextTheme.headline6.color
                          ),),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
  }
}
