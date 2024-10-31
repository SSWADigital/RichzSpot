import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  ScrollController _scrollController = new ScrollController();
  final _textFieldController = TextEditingController();
  bool isSend = false;
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
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .headline3
                                  .color))),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //back btn
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        start: -8,
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
                        start: 48,
                        end: 0,
                        child: Container(
                          height: 40,
                          child: Row(
                            children: [
                              //Img
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("assets/imgs/dc1.png"))),
                                child: Stack(
                                  children: [
                                    //
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .accentTextTheme
                                                .headline6
                                                .color),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Dr. Helena Wijaya",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'medium',
                                            color: Theme.of(context)
                                                .accentTextTheme
                                                .headline2
                                                .color),
                                      ),
                                    ),
                                    //Space
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      child: Text(
                                        "Sedang Aktif",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'medium',
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                .color),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //List
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      controller: _scrollController,
                      reverse: true,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //Send
                              _buildResiver(context),
                              _buildSender(context)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).textTheme.subtitle2.color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Stack(
                      children: [
                        Positioned.directional(
                            textDirection: Directionality.of(context),
                            start: -3,
                            top: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                getImage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/icons/ic_picker.png",
                                  scale: 25,
                                ),
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 55.0),
                            child: TextFormField(
                              controller: _textFieldController,
                              onChanged: (value) {
                                setState(() {
                                  if (value.length > 0) {
                                    isSend = true;
                                  } else {
                                    isSend = false;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 12),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "Tulis Pertanyaan Anda",
                                  hintStyle: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .color,
                                  )),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline2
                                      .color,
                                  fontSize: 16,
                                  fontFamily: "medium"),
                            )),
                        Positioned.directional(
                            textDirection: Directionality.of(context),
                            end: -6,
                            top: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/icons/ic_sender_2.png",
                                  scale: 24,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Resiver
Widget _buildResiver(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Img
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/imgs/dc1.png"))),
                ),
                //Space
                SizedBox(
                  width: 14,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryTextTheme.headline5.color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )),
                  child: Text(
                    "Tanyakan apa saja tentang\nmasalah kesehatan Anda",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "medium",
                        color: Theme.of(context).textTheme.headline1.color),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 44),
              child: Text(
                "2 minutes ago",
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: "medium",
                    color: Theme.of(context).textTheme.headline2.color),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

//Sender
Widget _buildSender(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentTextTheme.headline1.color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )),
              child: Text(
                "Hello dokter, 1 minggu ini gigi saya terasa nyeri",
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "medium",
                    color: Theme.of(context).textTheme.subtitle2.color),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
