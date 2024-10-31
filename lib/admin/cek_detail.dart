import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homital/UI/YourBillingScreen.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:homital/UI/DoctorInformationScreen.dart';
import 'package:homital/Theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class DetailAbsenMasuk extends StatefulWidget {
  @override
  _DetailAbsenMasukState createState() => _DetailAbsenMasukState();
}

class _DetailAbsenMasukState extends State<DetailAbsenMasuk> {
  GoogleMapController _mapController;
  LatLng _currentPosition;
  Marker _currentMarker;
  TextEditingController _locationController;
  File _image;

  //Tests Items

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

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("Gambar tidak dipilih.");
      }
    });
  }

  List<dynamic> data = [];
  List datajson;
  String chek = "";
  Future ambildata() async {
    final Response = await http.post(
        Uri.parse("http://103.157.97.200/api_absen_qr/histori_absen.php"),
        body: {"pegawai_id": "000051", "aksi": "2"});
    if (Response.body == "false") {
      chek = "Belum Ada Data";
    } else {
      this.setState(() {
        data = jsonDecode(Response.body);
      });
    }
  }

  int _currentIndex = 0;

  @override
  void initState() {
    // _getLocationPermission();
    // _getCurrentLocation();
    super.initState();

    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
    // addMarkers();
    // _locationController.text = lat + lng;
    myfung();
    ambildata();
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

  //  String _locationMessage = '';

  // Future<void> getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     _locationMessage =
  //         'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
  //   });

  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark placemark = placemarks[0];

  //   setState(() {
  //     _locationMessage =
  //         'Alamat: ${placemark.name}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}, ${placemark.postalCode}';
  //   });
  // }

  Future<void> _getgambar() async {
    try {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Widget googleMap(BuildContext context) {
    return Container(
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
  String _timeString;
  String jam;
  String _formatDatejam(DateTime datejam) {
    return DateFormat('HH:mm:ss').format(datejam);
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  void _getjam() {
    final DateTime now = DateTime.now();
    final String formattedDatejam = _formatDateTime(now);
    setState(() {
      jam = formattedDatejam;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.4,
          //   child: googleMap(context),
          // )
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                //Homitel

                //Space
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 380,
                    height: 180,
                    child: Stack(
                      children: [
                        Container(
                          width: 380,
                          height: 180,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 380,
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.only(
                                  left: 144,
                                  right: 31,
                                  top: 23,
                                  bottom: 37,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 228,
                                      height: 37,
                                      child: Text(
                                        "Anonymous",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.50),
                                    SizedBox(
                                      width: 228,
                                      height: 26,
                                      child: Text(
                                        "Departemen",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.50),
                                    SizedBox(
                                      width: 228,
                                      height: 30,
                                      child: Text(
                                        "No.12345",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 21.47,
                          top: 23.37,
                          child: Container(
                            width: 97.75,
                            height: 122.41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: googleMap(context),
                ),
                // Row(
                //   children: [
                //     Container(
                //       padding: EdgeInsets.symmetric(
                //         horizontal: 16,
                //       ),
                //       child: Text(
                //         lat ?? "",
                //         style: TextStyle(
                //             fontSize: 14,
                //             fontFamily: "medium",
                //             color: Theme.of(context)
                //                 .accentTextTheme
                //                 .headline3
                //                 .color),
                //       ),
                //     ),
                //     Container(
                //       padding: EdgeInsets.symmetric(
                //         horizontal: 16,
                //       ),
                //       child: Text(
                //         lng ?? "",
                //         style: TextStyle(
                //             fontSize: 14,
                //             fontFamily: "medium",
                //             color: Theme.of(context)
                //                 .accentTextTheme
                //                 .headline3
                //                 .color),
                //       ),
                //     ),
                //   ],
                // ),
                // RaisedButton(
                //   child: Text("Absen"),
                //   onPressed: () async {
                //     // Get the image
                //     await _getgambar();
                //     // Show the popup
                //     _getjam();
                //     doabsen(context);
                //   },
                // ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 16,
                //   ),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Daftar Absensi Hari ini",
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontFamily: "medium",
                //         color: Theme.of(context)
                //             .accentTextTheme
                //             .headline2
                //             .color),
                //   ),
                // ),

                //////////////////////////////////////////////////
                // Padding(
                //   padding: EdgeInsets.all(16.0),
                //   child: Table(
                //     border: TableBorder.all(
                //       color: Colors.black,
                //       width: 1.0,
                //       style: BorderStyle.solid,
                //     ),
                //     children: [
                //       TableRow(
                //         decoration: BoxDecoration(
                //           color: Colors.blue,
                //         ),
                //         children: [
                //           TableCell(
                //             child: Padding(
                //               padding: EdgeInsets.all(8.0),
                //               child: Text(
                //                 'Nama',
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           TableCell(
                //             child: Padding(
                //               padding: EdgeInsets.all(8.0),
                //               child: Text(
                //                 'Masuk',
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           TableCell(
                //             child: Padding(
                //               padding: EdgeInsets.all(8.0),
                //               child: Text(
                //                 'Pulang',
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       ...data.map((item) {
                //         return TableRow(
                //           children: [
                //             TableCell(
                //               child: Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text(
                //                     "User"), //Text(item['column1'].toString()),
                //               ),
                //             ),
                //             TableCell(
                //               child: Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text(item['jam_masuk'].toString()),
                //               ),
                //             ),
                //             TableCell(
                //               child: Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text(item['jam_pulang'].toString()),
                //               ),
                //             ),
                //           ],
                //         );
                //       }).toList(),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Theme.of(context).textTheme.subtitle2.color,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20),
          //         topRight: Radius.circular(20),
          //       )),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       //Space
          //       Container(
          //         height: 20,
          //         child: Stack(
          //           clipBehavior: Clip.none,
          //           children: [
          //             Positioned.directional(
          //                 textDirection: Directionality.of(context),
          //                 top: -10,
          //                 start: 0,
          //                 end: 0,
          //                 child: Container(
          //                   height: 40,
          //                   width: double.infinity,
          //                   decoration: BoxDecoration(
          //                       color: Theme.of(context)
          //                           .accentTextTheme
          //                           .bodyText1
          //                           .color,
          //                       borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(20),
          //                         topRight: Radius.circular(20),
          //                       )),
          //                 )),
          //           ],
          //         ),
          //       ),
          //       //House number or Apartmant

          //       //City

          //       //District or Street
          //     ],
          //   ),
          // ),
          //Space

          //Basic health examination
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 16,
          //   ),
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     "Lokasi Anda",
          //     style: TextStyle(
          //         fontSize: 18,
          //         fontFamily: "medium",
          //         color: Theme.of(context).accentTextTheme.headline2.color),
          //   ),
          // ),
          //Space

          //Space
          // SizedBox(
          //   height: 12,
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       width: MediaQuery.of(context).size.width - 80,
          //       child: TextField(
          //         controller: _locationController,
          //         decoration: InputDecoration(
          //           hintText: "Keterangan Tempat",
          //         ),
          //       ),
          //     ),
          //     SizedBox(height: 16),
          //     ElevatedButton(
          //       onPressed: _getImage,
          //       child: Text("Pilih Gambar"),
          //     ),
          //   ],
          // ),

          //wrap////////////////////////////////////////////////////////////////////////////////////////////

          //Space
          // SizedBox(
          //   height: 20,
          // ),

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
        ],
      ),
    );
  }

  //note : Belumbias di buat kondisi saat dokter aktif dia di alihkan ke halaman registrasi
  Container itemWidget(String img, String title, String subTitle) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.push(
            context, SlidePageRoute(page: DoctorInformationScreen()));
      },
      child: new Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //img
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      width: 100,
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(img))),
                    ),
                  ),
                  //Dr. Dimitri
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "medium",
                          color: Theme.of(context).textTheme.headline1.color),
                    ),
                  ),
                  //Dentist
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.directional(
                textDirection: Directionality.of(context),
                end: -1,
                top: -21,
                child: Container(
                  width: 65,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/ic_bg.png"))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/ic_star.png",
                        scale: 38,
                        color: Theme.of(context).textTheme.subtitle2.color,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 3, right: 7),
                        child: Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "medium",
                              color:
                                  Theme.of(context).textTheme.subtitle2.color),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }

//alternatif demo
  Container itemWidget2(String img1, String title1, String subTitle1) {
    return Container(
        child: InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.push(context, SlidePageRoute(page: YourBillingScreen()));
      },
      child: new Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //img
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      width: 100,
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(img1))),
                    ),
                  ),
                  //Dr. Dimitri
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      title1,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "medium",
                          color: Theme.of(context).textTheme.headline1.color),
                    ),
                  ),
                  //Dentist
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      subTitle1,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.directional(
                textDirection: Directionality.of(context),
                end: -1,
                top: -21,
                child: Container(
                  width: 65,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/ic_bg.png"))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/ic_star.png",
                        scale: 38,
                        color: Theme.of(context).textTheme.subtitle2.color,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 3, right: 7),
                        child: Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "medium",
                              color:
                                  Theme.of(context).textTheme.subtitle2.color),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}