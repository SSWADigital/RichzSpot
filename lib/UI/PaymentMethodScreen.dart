import 'package:flutter/material.dart';
import 'package:homital/NewsTabs/MedicalTab.dart';
import 'package:homital/UI/AddCard.dart';
import 'package:homital/animation/SlideRightRoute.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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
                            "Metode Pembayaran",
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
                    ],
                  ),
                ),
                //img
                Image.asset(
                  "assets/icons/ic_payment_2.png",
                  scale: 2,
                ),
                Container(
                  height: 50,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        top: -40,
                        start: 0,
                        end: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Anda tidak memiliki metode pembayaran.\nTambah Baru.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline3
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
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 70,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 44,
                        onPressed: () {
                          selectPayment();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        color:
                            Theme.of(context).accentTextTheme.headline1.color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Tambah Baru",
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.subtitle2.color,
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

  void selectPayment() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        builder: (ctx) {
          return SelectPaymentWidget();
        });
  }
}

class SelectPaymentWidget extends StatefulWidget {
  @override
  _SelectPaymentWidgetState createState() => _SelectPaymentWidgetState();
}

class _SelectPaymentWidgetState extends State<SelectPaymentWidget> {
  var _selectedItem;
  bool isTap = false;
  onSwitch(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  List cardList = [
    "GoPay",
    "OVO",
    "ShopeePay",
  ];

  //
  Container cardWidget() {
    return Container(
        child: Column(
      children: List.generate(
          cardList.length,
          (index) => Container(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      onSwitch(index);
                      _selectedItem = index;
                      isTap = true;
                    });
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline4
                                    .color))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            cardList[index],
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: _selectedItem == index
                                    ? Theme.of(context)
                                        .accentTextTheme
                                        .headline2
                                        .color
                                    : Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .color),
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: Radio(
                            value: index,
                            onChanged: (val) {
                              setState(() {
                                _selectedItem = index;
                              });
                            },
                            groupValue: _selectedItem,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: 470,
      child: Column(
        children: [
          //Space
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/icons/ic_dolor.png",
            scale: 6,
          ),
          //Space
          SizedBox(
            height: 10,
          ),
          //Select Payment Method
          Container(
            alignment: Alignment.center,
            child: Text(
              "Pilih Metode Pembayaran",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color),
            ),
          ),
          //Space
          SizedBox(
            height: 8,
          ),
          //Choose Payment method on your demand
          Container(
            alignment: Alignment.center,
            child: Text(
              "Pilih metode pembayaran sesuai keinginan anda",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline4.color),
            ),
          ),
          //Space
          SizedBox(
            height: 30,
          ),
          //
          cardWidget(),
          //Space
          SizedBox(
            height: 40,
          ),
          //Select
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 44,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (isTap == true) {
                        Navigator.pop(context);
                        Navigator.push(
                            context, SlidePageRoute(page: AddCard()));
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: isTap
                        ? Theme.of(context).accentTextTheme.headline1.color
                        : Theme.of(context).primaryTextTheme.headline3.color,
                    elevation: 0,
                    highlightElevation: 0,
                    child: Container(
                      child: Text(
                        "Pilih ",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.subtitle2.color,
                            fontSize: 15,
                            fontFamily: 'medium'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
