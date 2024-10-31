import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:intl/intl.dart';
class CreateNewProfile extends StatefulWidget {
  @override
  _CreateNewProfileState createState() => _CreateNewProfileState();
}

class _CreateNewProfileState extends State<CreateNewProfile> {
  bool checkBoxValue=false;
  _onChange(bool val){
    setState(() {
      checkBoxValue = val;
    });
  }


  DateTime currentDate = new DateTime.now();
  var dateVal;
  var now = new DateTime.now();
  Future<void> openDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != currentDate){
      setState(() {
         dateVal = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  final nameController = TextEditingController();
  final phoneNumController = TextEditingController();
  final emailController = TextEditingController();

  //

  check (){
    if(nameController.text.isEmpty){
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(title: "Alert !!!",subTile: "First name is required !",);
          }
      );
    }else if(relativeVal==null){
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(title: "Alert !!!",subTile: "Relative is required !",);
          }
      );
    }else if(genderVal==null){
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(title: "Alert !!!",subTile: "Gender is required !",);
          }
      );
    }else if(dateVal==null){
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(title: "Alert !!!",subTile: "Date of birth is required !",);
          }
      );
    }else if(phoneNumController.text.isEmpty){
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(title: "Alert !!!",subTile: "Phone number is required !",);
          }
      );
    }else if(emailController.text.isEmpty){
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(title: "Alert !!!",subTile: "Email is required !",);
          }
      );
    }else{
    Navigator.pop(context);
    }
  }
  //
  bool isSave=false;
 checkChanged(){
  if(nameController.text.isNotEmpty && relativeVal != null && genderVal != null &&
      dateVal != null && phoneNumController.text.isNotEmpty && emailController.text.isNotEmpty){
    setState(() {
      isSave = true;
    });
  }else{
    isSave =false;
  }
}
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
                            "Create new profile",
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
                Expanded(
                  child: ListView(
                    children: [
                      //Space
                      SizedBox(height: 24,),
                      //First name & Last name
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: nameController,
                              onChanged: (_){
                                checkChanged();
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 14),
                                labelText: "First name & Last name",
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline4.color
                                ),
                              ),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline2.color
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(height: 20,),
                      //Relative & Gender
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  relativeDialogue();
                                },
                                child: Container(
                                  child: Stack(
                                    children: [
                                      TextFormField(
                                        enabled: false,
                                        onChanged: (_){
                                          checkChanged();
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 14),
                                          labelText: relativeVal==null?"Relative":relativeVal,
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "medium",
                                              color:relativeVal==null?
                                              Theme.of(context).accentTextTheme.headline4.color:
                                              Theme.of(context).accentTextTheme.headline2.color
                                          ),
                                        ),
                                      ),
                                      Positioned.directional(
                                        textDirection: Directionality.of(context),
                                        end: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:Image.asset(
                                              "assets/icons/ic_drop_arrow.png",
                                              scale: 9,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //space
                            SizedBox(width: 10,),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  genderDialogue();
                                },
                                child: Container(
                                  child: Stack(
                                    children: [
                                      TextFormField(
                                        enabled: false,
                                        onChanged: (_){
                                          checkChanged();
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 14),
                                          labelText: genderVal==null?"Gender":genderVal,
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "medium",
                                              color: genderVal==null?
                                              Theme.of(context).accentTextTheme.headline4.color:
                                              Theme.of(context).accentTextTheme.headline2.color
                                          ),
                                        ),
                                      ),
                                      Positioned.directional(
                                        textDirection: Directionality.of(context),
                                        end: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:Image.asset(
                                              "assets/icons/ic_drop_arrow.png",
                                              scale: 9,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(height: 20,),
                      //Date of birth
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(
                          onTap: (){
                            openDatePicker(context);
                          },
                          child: Stack(
                            children: [
                              TextFormField(
                                enabled: false,
                                onChanged: (_){
                                  checkChanged();
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 14),
                                  labelText: dateVal==null?"Date of birth":dateVal.toString(),
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: dateVal==null? Theme.of(context).accentTextTheme.headline4.color:
                                      Theme.of(context).accentTextTheme.headline2.color
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                end: 8,
                                top: 5,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:Image.asset(
                                      "assets/icons/ic_calendar.png",
                                      scale: 25,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Space
                      SizedBox(height: 20,),
                      //Phone number
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: phoneNumController,
                              keyboardType: TextInputType.number,
                              onChanged: (_){
                                checkChanged();
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 14),
                                labelText: "Phone number",
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline4.color
                                ),
                              ),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline2.color
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(height: 20,),
                      //Email
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            TextFormField(
                              onChanged: (_){
                                checkChanged();
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 14),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline4.color
                                ),
                              ),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline2.color
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(height: 5,),
                      //Sat as default
                      Container(
                        padding: EdgeInsets.only(left: 0,),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  checkBoxValue=!checkBoxValue;
                                });
                              },
                              child: Container(
                                child: Row(
                                  //  clipBehavior: Clip.none,
                                  children: [
                                    Transform.scale(
                                      scale: 0.8,
                                      child: Checkbox(value: checkBoxValue,
                                        activeColor: Theme.of(context).accentTextTheme.headline1.color,
                                        onChanged:_onChange,
                                      ),
                                    ),
                                    //
                                    Transform.translate(
                                      offset: Offset(-8.0,0.0),
                                      child: Container(
                                        child: Text("Sat as default",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "medium",
                                              color: Theme.of(context).accentTextTheme.headline4.color
                                          ),),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 70,
              child:  Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 44,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          check();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(6)),
                         color: isSave? Theme.of(context).accentTextTheme.headline1.color:
                         Theme.of(context).primaryTextTheme.headline3.color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Save",
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
          ),
        ),
      ),
    );
  }
  //
List relativeList =[
  "Father",
  "Mother",
  "Brother",
  "Sister",
  "Son",
];
  String relativeVal;
  void relativeDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
            builder: (context,setState){
              return  Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                insetPadding: EdgeInsets.all(30),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(relativeList.length, (index){
                      return InkWell(
                        onTap: (){
                          setState(() {
                           relativeVal = relativeList[index];
                           Navigator.pop(context);
                          });
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(relativeList[index],
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                        ),
                      );
                    })
                  ),
                ),
              );
            }
        );
      },
    );
  }
  //
  List genderList =[
    "Male",
    "Female",
  ];
  String genderVal;
  void genderDialogue(){
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
            builder: (context,setState){
              return  Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                insetPadding: EdgeInsets.all(30),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(genderList.length, (index){
                        return InkWell(
                          onTap: (){
                            setState(() {
                              genderVal = genderList[index];
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            child: Text(genderList[index],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline2.color
                              ),),
                          ),
                        );
                      })
                  ),
                ),
              );
            }
        );
      },
    );
  }
}
