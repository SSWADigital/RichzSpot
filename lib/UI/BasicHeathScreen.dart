import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homital/DoctorListScreenTabs/DokterTelehealth.dart';
import 'package:homital/UI/posisi.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

import 'YourBillingScreen.dart';

class BasicHealthScreen extends StatefulWidget {
  @override
  _BasicHealthScreenState createState() => _BasicHealthScreenState();
}

class _BasicHealthScreenState extends State<BasicHealthScreen> {
  List _testList = [
    "Urea",
    "Creatinine",
    "Glucose",
    "LDL cholest",
    "HDL cholest",
    "Trighlycerid",
    "GGT",
    "Cholesterol",
    "SGOT",
    "Urine analyse",
    "CBC",
  ];
  List _checkUpList = [
    "Internal management examinations",
    "X-ray",
    "ECG",
    "Color abdominal ultrasound overview",
  ];
  //Tests Items
  Container testItem() {
    return Container(
        child: Column(
      children: List.generate(
          _testList.length,
          (index) => Container(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .headline4
                                  .color))),
                  child: Container(
                    child: Text(
                      _testList[index],
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline3
                              .color),
                    ),
                  ),
                ),
              )),
    ));
  }

  //Tests Items
  Container checkUpItem() {
    return Container(
        child: Column(
      children: List.generate(
          _checkUpList.length,
          (index) => Container(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .headline4
                                  .color))),
                  child: Container(
                    child: Text(
                      _checkUpList[index],
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline3
                              .color),
                    ),
                  ),
                ),
              )),
    ));
  }

  ScrollController _scrollController;
  bool isTitle = false;
  Color _text = Colors.transparent;
  myfung() {
    _scrollController = ScrollController()
      ..addListener(
        () => _isAppBarExpanded
            ? _text != Theme.of(context).textTheme.caption.color
                ? setState(
                    () {
                      _text = Theme.of(context).textTheme.caption.color;
                      isTitle = true;
                      // _icon = Theme.of(context).textTheme.caption.color;
                      // theme= true;
                      print('setState is called');
                    },
                  )
                : {}
            : _text != Colors.transparent
                ? setState(() {
                    print('setState is called');
                    _text = Colors.transparent;
                    isTitle = false;
                    //_icon = Theme.of(context).textTheme.bodyText1.color;
                  })
                : {},
      );
  }

  bool locStatus = false;
  _getLocationPermission() async {
    var status = await Permission.camera.status;
    if (status.isLimited) {
      setState(() {
        locStatus = true;
        _getCurrentLocation();
      });
    } else if (status.isDenied) {
      setState(() {
        locStatus = true;
        _getCurrentLocation();
      });
    }
  }

  LatLng currentLocation;
  LatLng lok = LatLng(-7.544760, 110.792069);
  Future<BitmapDescriptor> markerbitmap = BitmapDescriptor.fromAssetImage(
    ImageConfiguration(),
    "assets/icons/ic_about.png",
  );

  Completer<GoogleMapController> _mapcontroller = Completer();

  final Geolocator geolocator = Geolocator();
  String lat, lng;
  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    ).then((Position position) {
      setState(() {
        locStatus = true;
        currentLocation = new LatLng(position.latitude, position.longitude);
        lat = position.latitude.toString();
        lng = position.longitude.toString();
        getaddress(position.latitude, position.longitude);
      });
    }).catchError((e) {
      print(e);
    });

    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/icons/ic_about.png",
    );

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(currentLocation.toString()),
      position: currentLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Starting Point ',
        // snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapcontroller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    currentLocation = position.target;
  }

  void _onCameraIdle() {
    getaddress(currentLocation.latitude, currentLocation.longitude);
  }

  void getaddress(double lat, double long) async {
    //    final coordinates =  Coordinates(lat, long);
    //   var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    //   pickuploc = addresses.first.addressLine;
    //   city = addresses.first.locality;
    //   country = addresses.first.countryName;
    //   s_pickuploc.sink.add(pickuploc);
  }

// final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

  Future<void> goToPosition() async {
    setState(() {
      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      ).then((Position position) async {
        currentLocation = new LatLng(position.latitude, position.longitude);
        getaddress(position.latitude, position.longitude);
        CameraPosition position1 = CameraPosition(
          target: currentLocation,
          zoom: 16.0,
        );
        GoogleMapController controller = await _mapcontroller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(position1));
      }).catchError((e) {
        print(e);
      });
    });
  }

  @override
  void initState() {
    _getLocationPermission();
    _getCurrentLocation();
    super.initState();
    // addMarkers();
    myfung();
    //  _pageController = PageController();
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (188 - kToolbarHeight);
  }

  //
  Set<Marker> markers = Set();

  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/icons/ic_about.png",
    );

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(currentLocation.toString()),
      position: currentLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: markerbitmap, //Icon for Marker
    ));

    String imgurl = "https://www.fluttercampus.com/img/car.png";
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
        .buffer
        .asUint8List();

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(lok.toString()),
      position: lok, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Car Point ',
        snippet: 'Car Marker',
      ),
      icon: BitmapDescriptor.fromBytes(bytes), //Icon for Marker
    ));

    setState(() {
      //refresh UI
    });
  }

  Widget googleMap(BuildContext context) {
    return currentLocation == null
        ? Container()
        : Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(-7.544760, 110.792069), //currentLocation
                zoom: 16.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("marker2"),
                  position: const LatLng(-7.544760, 110.792069),
                ),
              },
              onMapCreated: _onMapCreated,
              onCameraMove: _onCameraMove,
              onCameraIdle: _onCameraIdle,
              myLocationEnabled: locStatus,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: true,
            ),
          );
  }

  final houseNumbController = new TextEditingController();
  final cityController = new TextEditingController();
  final districtController = new TextEditingController();

  //
  bool isSave = false;
  checkChanged() {
    if (houseNumbController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        districtController.text.isNotEmpty) {
      setState(() {
        isSave = true;
      });
    } else {
      setState(() {
        isSave = false;
      });
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
          body: CustomScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                expandedHeight: 188,
                leading: isTitle
                    ? Transform.translate(
                        offset: Offset(-8.0, 0.0),
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
                      )
                    : //back btn
                    Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 16, top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //back btn
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .color
                                        .withOpacity(0.9)),
                                child: Image.asset(
                                  "assets/icons/ic_back.png",
                                  scale: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Informasi Rumah Sakit",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "medium",
                        fontWeight: FontWeight.w700,
                        color: _text),
                  ),
                  background: Image.asset(
                    "assets/imgs/download 1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(delegate: SliverChildListDelegate([_buildWidget()]))
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Harga",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline2
                                      .color),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              "Rp.100.000",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline1
                                      .color),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  MaterialButton(
                    height: 44,
                    minWidth: 145,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push(
                          context, SlidePageRoute(page: MapScreen()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: Theme.of(context).accentTextTheme.headline1.color,
                    elevation: 0,
                    highlightElevation: 0,
                    child: Container(
                      child: Text(
                        "Pesan Sekarang",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.subtitle2.color,
                            fontSize: 14,
                            fontFamily: 'medium'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Appbar
  Widget appBar() {
    return //Img
        Container(
      width: double.infinity,
      height: 188,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/imgs/libartry_img.jpg"))),
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 16, top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //back btn
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .color
                        .withOpacity(0.9)),
                child: Image.asset(
                  "assets/icons/ic_back.png",
                  scale: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidget() {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: googleMap(context),
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).textTheme.subtitle2.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Space
                Container(
                  height: 20,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.directional(
                          textDirection: Directionality.of(context),
                          top: -10,
                          start: 0,
                          end: 0,
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .bodyText1
                                    .color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                )),
                          )),
                    ],
                  ),
                ),
                //House number or Apartmant

                //City

                //District or Street
              ],
            ),
          ),
          //Space
          SizedBox(
            height: 4,
          ),
          //Basic health examination
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "Rumah Sakit Indriati",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color),
            ),
          ),
          //Space
          SizedBox(
            height: 10,
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              lat ?? "",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline3.color),
            ),
          ),
          //Space
          SizedBox(
            height: 12,
          ),

          //wrap
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                //
                //
                //
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Card(
                          color: Colors.blue[200],
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          margin: EdgeInsets.zero,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 2,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/imgs/dc1.png"))),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            // Positioned.directional(
                                            //   textDirection:
                                            //       Directionality.of(context),
                                            //   top: -1,
                                            //   end: 0,
                                            //   child: Container(
                                            //     width: 12,
                                            //     height: 12,
                                            //     decoration: BoxDecoration(
                                            //         shape: BoxShape.circle,
                                            //         color: Theme.of(context)
                                            //             .accentTextTheme
                                            //             .headline6
                                            //             .color),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Dr. Helena Wijaya ",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "medium",
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
                                                  "Dokter Mata",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "medium",
                                                      color: Theme.of(context)
                                                          .accentTextTheme
                                                          .headline3
                                                          .color),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      //
                                      InkWell(
                                        onTap: () {
                                          // conservationDialogue();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Image.asset(
                                            "assets/icons/ic_menu.png",
                                            scale: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                // Container(
                                //   padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       //
                                //       Container(
                                //         child: Text(
                                //           "",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Color(0xFF4CAF50)),
                                //         ),
                                //       ),
                                //       //
                                //       Container(
                                //         child: Text(
                                //           "03/03/2022",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Theme.of(context)
                                //                   .accentTextTheme
                                //                   .headline3
                                //                   .color),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),

                      //Space
                      SizedBox(
                        width: 8,
                      ),

                      Expanded(
                        flex: 5,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          margin: EdgeInsets.zero,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 2,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/imgs/d3.png"))),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            // Positioned.directional(
                                            //   textDirection:
                                            //       Directionality.of(context),
                                            //   top: -1,
                                            //   end: 0,
                                            //   child: Container(
                                            //     width: 12,
                                            //     height: 12,
                                            //     decoration: BoxDecoration(
                                            //         shape: BoxShape.circle,
                                            //         color: Theme.of(context)
                                            //             .accentTextTheme
                                            //             .headline6
                                            //             .color),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Dr. Tri Ajika Wjaya ",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "medium",
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
                                                  "Dokter Gigi",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "medium",
                                                      color: Theme.of(context)
                                                          .accentTextTheme
                                                          .headline3
                                                          .color),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      //
                                      InkWell(
                                        onTap: () {
                                          // conservationDialogue();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Image.asset(
                                            "assets/icons/ic_menu.png",
                                            scale: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                // Container(
                                //   padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       //
                                //       Container(
                                //         child: Text(
                                //           "",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Color(0xFF4CAF50)),
                                //         ),
                                //       ),
                                //       //
                                //       Container(
                                //         child: Text(
                                //           "03/03/2022",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Theme.of(context)
                                //                   .accentTextTheme
                                //                   .headline3
                                //                   .color),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                //

                //Space
                SizedBox(
                  height: 10,
                ),

                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          margin: EdgeInsets.zero,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 2,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/imgs/d2.png"))),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            // Positioned.directional(
                                            //   textDirection:
                                            //       Directionality.of(context),
                                            //   top: -1,
                                            //   end: 0,
                                            //   child: Container(
                                            //     width: 12,
                                            //     height: 12,
                                            //     decoration: BoxDecoration(
                                            //         shape: BoxShape.circle,
                                            //         color: Theme.of(context)
                                            //             .accentTextTheme
                                            //             .headline6
                                            //             .color),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Dr. Yoga Hartono ",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "medium",
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
                                                  "Dokter THT",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "medium",
                                                      color: Theme.of(context)
                                                          .accentTextTheme
                                                          .headline3
                                                          .color),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      //
                                      InkWell(
                                        onTap: () {
                                          // conservationDialogue();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Image.asset(
                                            "assets/icons/ic_menu.png",
                                            scale: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                // Container(
                                //   padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       //
                                //       Container(
                                //         child: Text(
                                //           "",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Color(0xFF4CAF50)),
                                //         ),
                                //       ),
                                //       //
                                //       Container(
                                //         child: Text(
                                //           "03/03/2022",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Theme.of(context)
                                //                   .accentTextTheme
                                //                   .headline3
                                //                   .color),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),

                      //Space
                      SizedBox(
                        width: 8,
                      ),

                      Expanded(
                        flex: 5,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          margin: EdgeInsets.zero,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 2,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/imgs/dc3.png"))),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            // Positioned.directional(
                                            //   textDirection:
                                            //       Directionality.of(context),
                                            //   top: -1,
                                            //   end: 0,
                                            //   child: Container(
                                            //     width: 12,
                                            //     height: 12,
                                            //     decoration: BoxDecoration(
                                            //         shape: BoxShape.circle,
                                            //         color: Theme.of(context)
                                            //             .accentTextTheme
                                            //             .headline6
                                            //             .color),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Dr. Erlita Natalia ",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "medium",
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
                                                  "Dokter Umum",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "medium",
                                                      color: Theme.of(context)
                                                          .accentTextTheme
                                                          .headline3
                                                          .color),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      //
                                      InkWell(
                                        onTap: () {
                                          // conservationDialogue();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Image.asset(
                                            "assets/icons/ic_menu.png",
                                            scale: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                // Container(
                                //   padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       //
                                //       Container(
                                //         child: Text(
                                //           "",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Color(0xFF4CAF50)),
                                //         ),
                                //       ),
                                //       //
                                //       Container(
                                //         child: Text(
                                //           "03/03/2022",
                                //           style: TextStyle(
                                //               fontSize: 12,
                                //               fontFamily: "medium",
                                //               color: Theme.of(context)
                                //                   .accentTextTheme
                                //                   .headline3
                                //                   .color),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Space
          SizedBox(
            height: 20,
          ),

          //Price Book now btn
          // Container(
          //   height: 75,
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   decoration: BoxDecoration(
          //       border: Border(
          //     top: BorderSide(
          //         width: 1,
          //         color: Theme.of(context).primaryTextTheme.headline3.color),
          //     bottom: BorderSide(
          //         width: 1,
          //         color: Theme.of(context).primaryTextTheme.headline3.color),
          //   )),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Container(
          //                 child: Text(
          //                   "Harga",
          //                   style: TextStyle(
          //                       fontSize: 13,
          //                       fontFamily: "medium",
          //                       color: Theme.of(context)
          //                           .accentTextTheme
          //                           .headline2
          //                           .color),
          //                 ),
          //               ),
          //               Container(
          //                 padding: EdgeInsets.only(top: 4),
          //                 child: Text(
          //                   "Rp 1.664.000",
          //                   style: TextStyle(
          //                       fontSize: 16,
          //                       fontFamily: "medium",
          //                       color: Theme.of(context)
          //                           .accentTextTheme
          //                           .headline1
          //                           .color),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       //
          //       MaterialButton(
          //         height: 44,
          //         minWidth: 145,
          //         onPressed: () {
          //           FocusScope.of(context).requestFocus(FocusNode());
          //           Navigator.push(
          //               context, SlidePageRoute(page: YourBillingScreen()));
          //         },
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(6)),
          //         color: Theme.of(context).accentTextTheme.headline1.color,
          //         elevation: 0,
          //         highlightElevation: 0,
          //         child: Container(
          //           child: Text(
          //             "Pesan Sekarang",
          //             style: TextStyle(
          //                 color: Theme.of(context).textTheme.subtitle2.color,
          //                 fontSize: 14,
          //                 fontFamily: 'medium'),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //Space
          // SizedBox(
          //   height: 20,
          // ),
          //Your benefit
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 16,
          //   ),
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     "Keuntungan yang di dapat",
          //     style: TextStyle(
          //         fontSize: 18,
          //         fontFamily: "medium",
          //         color: Theme.of(context).accentTextTheme.headline2.color),
          //   ),
          // ),
          // //Space
          // SizedBox(
          //   height: 20,
          // ),
          // //Take sample
          // Container(
          //   padding: EdgeInsets.only(left: 13, right: 16),
          //   child: Row(
          //     children: [
          //       Container(
          //         child: Image.asset(
          //           "assets/icons/ic_house.png",
          //           scale: 8,
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(left: 15),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               //
          //               Container(
          //                 child: RichText(
          //                   text: TextSpan(
          //                       text: "Ambil sampel di rumah Anda ",
          //                       style: TextStyle(
          //                           fontSize: 14,
          //                           fontFamily: "medium",
          //                           color: Theme.of(context)
          //                               .accentTextTheme
          //                               .headline3
          //                               .color),
          //                       children: [
          //                         TextSpan(
          //                           text: "GRATIS",
          //                           style: TextStyle(
          //                               fontSize: 14,
          //                               fontFamily: "medium",
          //                               color: Theme.of(context)
          //                                   .accentTextTheme
          //                                   .headline1
          //                                   .color),
          //                         )
          //                       ]),
          //                 ),
          //               ),
          //               //
          //               Container(
          //                 padding: EdgeInsets.only(top: 6),
          //                 child: Text(
          //                   "Perawat kami akan datang dan mengambil sampel di rumah Anda.",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontFamily: "medium",
          //                       color: Theme.of(context)
          //                           .accentTextTheme
          //                           .headline3
          //                           .color),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // //Space
          // SizedBox(
          //   height: 20,
          // ),
          // //Doctor consult....
          // Container(
          //   padding: EdgeInsets.only(left: 13, right: 16),
          //   child: Row(
          //     children: [
          //       Container(
          //         child: Image.asset(
          //           "assets/icons/ic_doctor_1.png",
          //           scale: 8,
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(left: 15),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               //
          //               Container(
          //                 child: RichText(
          //                   text: TextSpan(
          //                       text: "Konsultasi online ",
          //                       style: TextStyle(
          //                           fontSize: 14,
          //                           fontFamily: "medium",
          //                           color: Theme.of(context)
          //                               .accentTextTheme
          //                               .headline3
          //                               .color),
          //                       children: [
          //                         TextSpan(
          //                           text: "GRATIS",
          //                           style: TextStyle(
          //                               fontSize: 14,
          //                               fontFamily: "medium",
          //                               color: Theme.of(context)
          //                                   .accentTextTheme
          //                                   .headline1
          //                                   .color),
          //                         )
          //                       ]),
          //                 ),
          //               ),
          //               //
          //               Container(
          //                 padding: EdgeInsets.only(top: 6),
          //                 child: Text(
          //                   "Dapatkan saran dari dokter kami yang berpengalaman dan profesional.",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontFamily: "medium",
          //                       color: Theme.of(context)
          //                           .accentTextTheme
          //                           .headline3
          //                           .color),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // //Space
          // SizedBox(
          //   height: 20,
          // ),
          // //Result send...
          // Container(
          //   padding: EdgeInsets.only(left: 13, right: 16),
          //   child: Row(
          //     children: [
          //       Container(
          //         child: Image.asset(
          //           "assets/icons/ic_mobile.png",
          //           scale: 8,
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(left: 15),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               //
          //               Container(
          //                 child: RichText(
          //                   text: TextSpan(
          //                     text:
          //                         "Hasil di kirim langsung di smartphone Anda ",
          //                     style: TextStyle(
          //                         fontSize: 14,
          //                         fontFamily: "medium",
          //                         color: Theme.of(context)
          //                             .accentTextTheme
          //                             .headline3
          //                             .color),
          //                   ),
          //                 ),
          //               ),
          //               //
          //               Container(
          //                 padding: EdgeInsets.only(top: 6),
          //                 child: Text(
          //                   "Hasil pemeriksaan akan dikirimkan ke\nsmartphone Anda dengan cepat.",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontFamily: "medium",
          //                       color: Theme.of(context)
          //                           .accentTextTheme
          //                           .headline3
          //                           .color),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // //Space
          // SizedBox(
          //   height: 20,
          // ),
          // //Divider
          // Divider(
          //   height: 1,
          //   color: Theme.of(context).primaryTextTheme.headline3.color,
          //   thickness: 1,
          // ),
          // //Space
          // SizedBox(
          //   height: 20,
          // ),
          // //Our process
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 16,
          //   ),
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     "Prosedur",
          //     style: TextStyle(
          //         fontSize: 18,
          //         fontFamily: "medium",
          //         color: Theme.of(context).accentTextTheme.headline2.color),
          //   ),
          // ),
          // //Space
          // SizedBox(
          //   height: 8,
          // ),
          // //1
          // Container(
          //   padding: EdgeInsets.only(left: 14, right: 16),
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         "assets/icons/ic_one.png",
          //         scale: 20,
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(left: 10),
          //           child: Text(
          //             "Perawat kami datang ke tempat Anda untuk mengambil sampel.",
          //             style: TextStyle(
          //                 fontSize: 12,
          //                 fontFamily: 'medium',
          //                 color: Theme.of(context)
          //                     .accentTextTheme
          //                     .headline3
          //                     .color),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // //Divider
          // verticalDivider(),
          // //2
          // Container(
          //   padding: EdgeInsets.only(left: 14, right: 16),
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         "assets/icons/ic_two.png",
          //         scale: 20,
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(left: 10),
          //           child: Text(
          //             "Bawa sampel Anda ke fasilitas kesehatan untuk dianalisis.",
          //             style: TextStyle(
          //                 fontSize: 12,
          //                 fontFamily: 'medium',
          //                 color: Theme.of(context)
          //                     .accentTextTheme
          //                     .headline3
          //                     .color),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // //Divider
          // verticalDivider(),
          // //3
          // Container(
          //   padding: EdgeInsets.only(left: 14, right: 16),
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         "assets/icons/ic_three.png",
          //         scale: 20,
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(left: 10),
          //           child: Text(
          //             "Hasil dikirim ke ponsel Anda melalui aplikasi Dua 1 Care.",
          //             style: TextStyle(
          //                 fontSize: 12,
          //                 fontFamily: 'medium',
          //                 color: Theme.of(context)
          //                     .accentTextTheme
          //                     .headline3
          //                     .color),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // //Divider
          // verticalDivider(),
          // //4
          // Container(
          //   padding: EdgeInsets.only(left: 14, right: 16),
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         "assets/icons/ic_four.png",
          //         scale: 20,
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(left: 10),
          //           child: Text(
          //             "Dokter kami akan menghubungi dan memberi Anda konsultasi.",
          //             style: TextStyle(
          //                 fontSize: 12,
          //                 fontFamily: 'medium',
          //                 color: Theme.of(context)
          //                     .accentTextTheme
          //                     .headline3
          //                     .color),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // //Space
          // SizedBox(
          //   height: 20,
          // ),
          // //Divider
          // Divider(
          //   height: 6,
          //   color: Theme.of(context).primaryTextTheme.headline3.color,
          //   thickness: 6,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          //Our 13 test

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              lng ?? "",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color),
            ),
          ),

          // //Space
          // SizedBox(
          //   height: 10,
          // ),
          // testItem(),
          // //Space
          // SizedBox(
          //   height: 20,
          // ),
          // //Our 4 categories check-up
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 16,
          //   ),
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     "Our 4 categories check-up",
          //     style: TextStyle(
          //         fontSize: 18,
          //         fontFamily: "medium",
          //         color: Theme.of(context).accentTextTheme.headline2.color),
          //   ),
          // ),
          // //Space
          // SizedBox(
          //   height: 10,
          // ),
          // checkUpItem(),
          // //Space
          // SizedBox(
          //   height: 80,
          // ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text("Dessert (100g serving)")),
                DataColumn(label: Text("Calories")),
                DataColumn(label: Text("Fat (g)")),
                // DataColumn(label: Text("Protein (g)")),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("Senin")),
                    DataCell(Text("05:00")),
                    DataCell(Text("21:00")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("Selasa")),
                    DataCell(Text("05:00")),
                    DataCell(Text("21:00")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("Rabu")),
                    DataCell(Text("05:00")),
                    DataCell(Text("21:00")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("Kamis")),
                    DataCell(Text("05:00")),
                    DataCell(Text("21:00")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("Jumaat")),
                    DataCell(Text("05:00")),
                    DataCell(Text("21:00")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("Sabtu")),
                    DataCell(Text("05:00")),
                    DataCell(Text("21:00")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container verticalDivider() {
    return //Divider
        Container(
      height: 30,
      padding: EdgeInsets.only(left: 25),
      child: Row(
        children: [
          VerticalDivider(
            width: 2,
            thickness: 2,
            indent: 2,
            endIndent: 2,
            color: Theme.of(context).accentTextTheme.headline5.color,
          ),
        ],
      ),
    );
  }
}
