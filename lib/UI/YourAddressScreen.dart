import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class YourAddressScreen extends StatefulWidget {
  @override
  _YourAddressScreenState createState() => _YourAddressScreenState();
}

class _YourAddressScreenState extends State<YourAddressScreen> {
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

  Completer<GoogleMapController> _mapcontroller = Completer();

  final Geolocator geolocator = Geolocator();
  String lat, lng;
  _getCurrentLocation() {
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
    //  final coordinates = new Coordinates(lat, long);
    // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // pickuploc = addresses.first.addressLine;
    // city = addresses.first.locality;
    // country = addresses.first.countryName;
    // s_pickuploc.sink.add(pickuploc);
  }

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
  }

  //
  Widget googleMap(BuildContext context) {
    return currentLocation == null
        ? Container()
        : Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 16.0,
              ),
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
                      Positioned(
                        left: -4,
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
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Rumah Sakit Indriati",
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
                //map
                // Expanded(
                //     child: Container(
                //       child: googleMap(context),
                //     )
                // ),
                //
                Expanded(
                    child: ListView(
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
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: houseNumbController,
                                  keyboardType: TextInputType.text,
                                  onChanged: (_) {
                                    checkChanged();
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 14),
                                    labelText: "Rumah Sakit Indriati ",
                                    labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline4
                                            .color),
                                  ),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline2
                                          .color),
                                ),
                              ],
                            ),
                          ),
                          //City
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: cityController,
                                  enabled: true,
                                  onChanged: (_) {
                                    checkChanged();
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 14,
                                    ),
                                    labelText: "city",
                                    labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline4
                                            .color),
                                  ),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline2
                                          .color),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/icons/ic_drop_arrow.png",
                                          scale: 8,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .color,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          //District or Street
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                TextFormField(
                                  enabled: true,
                                  controller: districtController,
                                  onChanged: (_) {
                                    checkChanged();
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 14),
                                    labelText: "District or Street",
                                    labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context)
                                            .accentTextTheme
                                            .headline4
                                            .color),
                                  ),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "medium",
                                      color: Theme.of(context)
                                          .accentTextTheme
                                          .headline2
                                          .color),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/icons/ic_drop_arrow.png",
                                          scale: 8,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .color,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 5,
            color: Colors.white,
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
                          if (isSave == true) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.pop(context);
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: isSave
                            ? Theme.of(context).accentTextTheme.headline1.color
                            : Theme.of(context)
                                .primaryTextTheme
                                .headline3
                                .color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Save",
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
}
