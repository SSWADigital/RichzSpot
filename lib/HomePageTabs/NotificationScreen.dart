import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

TextEditingController _nameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _absentNumberController = TextEditingController();
TextEditingController _classController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              //Space
              SizedBox(
                height: 15,
              ),
              //Notification
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    Container(
                      child: Text(
                        "Pengguna",
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            fontFamily: "medium",
                            color: Theme.of(context)
                                .accentTextTheme
                                .headline2
                                .color),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          markDialogue();
                        },
                        child: Image.asset(
                          "assets/icons/ic_checked.png",
                          scale: 20,
                        ))
                  ],
                ),
              ),
              //Space
              SizedBox(
                height: 25,
              ),
              //Divider
              Divider(
                height: 1,
                color: Theme.of(context).primaryTextTheme.headline4.color,
                thickness: 1,
                indent: 18,
                endIndent: 18,
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    //Space
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 16.0),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.blue,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/150?img=1',
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Nama',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Nomor Telepon',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _absentNumberController,
                              decoration: InputDecoration(
                                labelText: 'Nomor Absen',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _classController,
                              decoration: InputDecoration(
                                labelText: 'Kelas',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Kata Sandi',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 32.0),
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Implement save form data
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              child: Text('Simpan'),
                            ),
                          ]),
                    ),
                    //Space
                    //Space
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void markDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: EdgeInsets.all(30),
            child: Container(
              height: 170,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Mark as all read?",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "All the unread notification will be mark as readed.",
                            style: TextStyle(
                                fontSize: 14,
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
                  //
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline4
                                      .color),
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline5
                                      .color),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
