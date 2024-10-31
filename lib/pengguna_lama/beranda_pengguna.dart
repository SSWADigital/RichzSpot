import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homital/Account/SignIn.dart';
import 'package:homital/DoctorListScreenTabs/DokterTelehealth.dart';
import 'package:homital/UI/posisi.dart';
import 'package:homital/Widget/Alert.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:homital/main.dart';
// import 'package:homital/pengguna/jurnal/jurnal.dart';
import 'package:homital/pengguna/laporan/laporan_absensi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'YourBillingScreen.dart';

class berandaPengguna extends StatefulWidget {
  @override
  _berandaPenggunaState createState() => _berandaPenggunaState();
}

class _berandaPenggunaState extends State<berandaPengguna> {
  //Tests Items

  GoogleMapController _mapController;
  LatLng _currentPosition;
  Marker _currentMarker;
  TextEditingController _locationController;
  File _image;

  //Tests Items

  ScrollController _scrollController;
  bool isTitle = false;
  Color _text = Colors.transparent;

  bool isTap = false;
  int tapIndex;
  List<Map<String, dynamic>> absen = [
    {
      "nama": "Erda",
      "masuk": "07:30",
      "keluar": "-",
      "keterangan": "-",
    },
    {
      "nama": "Tanti",
      "masuk": "07:30",
      "keluar": "13:30",
      "keterangan": "-",
    },
    {
      "nama": "Aji",
      "masuk": "07:30",
      "keluar": "13:30",
      "keterangan": "-",
    },
  ];

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
    if (this.mounted) {
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
    } else {}
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
    if (this.mounted) {
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
  }

  // Future<void> _getImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print("Gambar tidak dipilih.");
  //     }
  //   });
  // }

  List<dynamic> data = [];
  List datajson;
  String chek = "";

  String _masuk;
  String _keluar;

  String cek_absen;
  Future ambildata() async {
    final prefs = await SharedPreferences.getInstance();

    id_user = (prefs.get('pegawai_id'));
    final Response = await http.post(
        Uri.parse("http://103.157.97.200/api_absen_qr/riwayat_absen.php"),
        body: {"pegawai_id": id_user == "" ? pegawaiid : id_user, "aksi": "1"});
    var _data = jsonDecode(Response.body);
    if (_data == false) {
      chek = "Belum Ada Data";

      this.setState(() {
        cek_absen = "0";
      });
    } else {
      this.setState(() {
        _masuk = _data[0]['check_in'] == null ? "-" : _data[0]['check_in'];
        _keluar = _data[0]['check_out'] == null ? "-" : _data[0]['check_out'];
        if (_data[0]['check_out'] != null) {
          cek_absen = "1";
        }
      });
    }
  }

  /////////////////////////////////////////////////////////////
  String nama_user;
  String alamat;
  String nowa;
  String id_user = "";
  Future lihatprofil() async {
    final prefs = await SharedPreferences.getInstance();

    id_user = (prefs.get('pegawai_id'));

    final Response = await http.post(
        Uri.parse("http://103.157.97.200/api_absen_qr/id.php"),
        body: {"nip": id_user == "" ? pegawaiid : id_user});
    var profil = jsonDecode(Response.body);
    this.setState(() {
      if (Response.body == "false") {
        print("null");
      } else {
        // nama_user = profil[0]['username'] ?? "";
        nama_user = profil[0]['nama'] ?? "";
        alamat = profil[0]['alamat'] ?? "";
        nowa = profil[0]['no_wa'] ?? "";
      }

      // gambar = datajson[0]['faskes_foto'];
    });
  }

  List jurnal_list;
  Future data_jurnal() async {
    final prefs = await SharedPreferences.getInstance();

    var id_user = (prefs.get('pegawai_id'));
    final Response = await http.post(
        Uri.parse("http://103.157.97.200/api_absen_qr/jurnal_cek.php"),
        body: {"nip": id_user == "" ? pegawaiid : id_user});
    var _data = jsonDecode(Response.body);
    if (_data == 0) {
      chek = "Belum Ada Data";

      this.setState(() {
        cek_absen = "0";
      });
    } else {
      this.setState(() {
        jurnal_list = _data;
      });
    }
  }

  @override
  void initState() {
    tapIndex;
    _getLocationPermission();
    _getCurrentLocation();
    _getpeta();
    super.initState();
    lihatprofil();
    ambildata();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    data_jurnal();
    super.initState();
    // addMarkers();
    // _locationController.text = lat + lng;
    myfung();
    // ambildata();
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

  ///////// versi geolakator 2023
  GoogleMapController mapController;
  LatLng _center;

  Future<void> _getpeta() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (this.mounted) {
      setState(() {
        _center = LatLng(position.latitude, position.longitude);
      });
    }
    // setState(() {
    //   _center = LatLng(position.latitude, position.longitude);
    // });
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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

  String perintah;

  Future _absen() async {
    if (perintah == 'm') {
      var req = http.MultipartRequest(
          'POST', Uri.parse('http://103.157.97.200/api_absen_qr/absen_v2.php'));
      req.fields.addAll({
        'id_user': iduser == "" ? pegawaiid : iduser,
        'check_in': jam,
        'loc_check_in': '$lat,$lng',
        'perintah': 'm'
      });
      req.files
          .add(await http.MultipartFile.fromPath('foto_check_in', _image.path));
      http.StreamedResponse response = await req.send();

      if (response.statusCode == 200) {
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(
                title: "Berhasil Absen",
                subTile: " Selamat Bekerja ",
              );
            });

        // print(response);

      }
      this.setState(() {
        cek_absen = "2";
      });

      ambildata();
    } else if (perintah == "p") {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://103.157.97.200/api_absen_qr/absen_v2.php'));
      request.fields.addAll({
        'id_user': iduser == "" ? pegawaiid : iduser,
        'check_out': jam,
        'loc_check_out': '$lat,$lng',
        'perintah': 'p'
      });
      request.files.add(
          await http.MultipartFile.fromPath('foto_check_out', _image.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(
                title: "Berhasil Absen",
                subTile: " Selamat Beristirahat ",
              );
            });

        // print(response);
      }
      ambildata();
    }
  }

  String getDateFormatted() {
    initializeDateFormatting('id_ID', null);
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());
    return formattedDate;
  }

  Widget googleMap2(BuildContext context) {
    return currentLocation == null
        ? Container()
        : Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 16.0,
              ),
              // onMapCreated: _onMapCreated,
              // onCameraMove: _onCameraMove,
              // onCameraIdle: _onCameraIdle,
              myLocationEnabled: locStatus,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: true,
            ),
          );
  }

  Widget googleMap(BuildContext context) {
    return currentLocation == null
        ? Container()
        : Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: currentLocation, //currentLocation
                zoom: 16.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("marker2"),
                  position: currentLocation,
                ),
              },
              onMapCreated: _onMapCreated,
              onCameraMove: _onCameraMove,
              onCameraIdle: _onCameraIdle,
              myLocationEnabled: locStatus,
              zoomControlsEnabled: false,
              // myLocationButtonEnabled: true,
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

  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MediaQuery(
      data: queryData.copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 281,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 248,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff020438),
                                    Color(0xff284184)
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                left: 16,
                                // right: 152,
                                top: 40,
                                bottom: 138,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/imgs/dc1.png"))),
                                      ),
                                      SizedBox(width: 17),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Hi,",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                nama_user ?? "",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            nowa ?? "",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _timeString,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  getDateFormatted(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3f000000),
                                    blurRadius: 22,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 16,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Check In",
                                        style: TextStyle(
                                          color: Color(0xff020438),
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        _masuk ?? "-",
                                        style: TextStyle(
                                          color: Color(0xffffa800),
                                          fontSize: 16,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 64),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Check Out",
                                        style: TextStyle(
                                          color: Color(0xff020438),
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        _keluar ?? "-",
                                        style: TextStyle(
                                          color: Color(0xffffa800),
                                          fontSize: 16,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.4,
              //   child: googleMap(context),
              // ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    //Homitel
                    Center(
                      child: Container(
                        width: 328,
                        height: 340,
                        child: Stack(
                          children: [
                            Container(
                              width: 328,
                              height: 340,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xffd9d9d9),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    width: 340,
                                    height: 340,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: (_center == null)
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : googleMap2(context)
                                    // : GoogleMap(
                                    //     onMapCreated: _onMapCreated,
                                    //     initialCameraPosition: CameraPosition(
                                    //       target: _center,
                                    //       zoom: 11.0,
                                    //     ),
                                    //   ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    //         color: Theme.of(context)
                    //             .accentTextTheme
                    //             .headline2
                    //             .color),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
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
                    // ),
                    SizedBox(
                      height: 10,
                    ),

                    //////////////////////////////////////////////////
                  ],
                ),
              ),
              // Expanded(
              //   child: jurnal_list == null
              //       ? Container(
              //           padding: const EdgeInsets.all(16),
              //           child: Center(
              //             child: Text(
              //               'Tidak ada jobdesk hari ini. Silakan hubungi admin untuk menambahkan jobdesk.',
              //               style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 20,
              //               ),
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //         )
              //       :

              //       //Homitel
              //       Container(
              //           child: ListView.builder(
              //               shrinkWrap: true,
              //               itemCount:
              //                   jurnal_list == null ? 0 : jurnal_list.length,
              //               itemBuilder: (context, index) {
              //                 return Container(
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: 16, vertical: 8),
              //                   child: Card(
              //                     elevation: 4,
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(15),
              //                         side: BorderSide(
              //                             width: 1,
              //                             color: tapIndex == index
              //                                 ? Theme.of(context)
              //                                     .accentTextTheme
              //                                     .headline1
              //                                     .color
              //                                 : Colors.transparent)),
              //                     margin: EdgeInsets.zero,
              //                     child: InkWell(
              //                       onTap: () {
              //                         setState(() {
              //                           tapIndex = index;
              //                           isTap = true;
              //                           Navigator.push(
              //                               context,
              //                               SlidePageRoute(
              //                                   page: JournalScreen()));
              //                         });
              //                       },
              //                       child: Container(
              //                         width: 328,
              //                         height: 118,
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(12),
              //                           border: Border.all(
              //                             color: Colors.black,
              //                             width: 1,
              //                           ),
              //                           boxShadow: [
              //                             BoxShadow(
              //                               color: Color(0x3f000000),
              //                               blurRadius: 4,
              //                               offset: Offset(0, 4),
              //                             ),
              //                           ],
              //                           color: Colors.white,
              //                         ),
              //                         child: Stack(
              //                           children: [
              //                             Positioned(
              //                               left: 17,
              //                               top: 59,
              //                               child: SizedBox(
              //                                 width: 276,
              //                                 height: 45,
              //                                 child: Text(
              //                                   jurnal_list[index]
              //                                           ["deskripsi"] ??
              //                                       "",
              //                                   style: TextStyle(
              //                                     color: Colors.black,
              //                                     fontSize: 14,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Positioned(
              //                               left: 14,
              //                               top: 34,
              //                               child: SizedBox(
              //                                 width: 191.90,
              //                                 height: 15.51,
              //                                 child: Text(
              //                                   jurnal_list[index]["proyek"] ??
              //                                       "",
              //                                   style: TextStyle(
              //                                     color: Color(0xff1400ff),
              //                                     fontSize: 14,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Positioned(
              //                               left: 265,
              //                               top: 63,
              //                               child: MaterialButton(
              //                                 onPressed: () {
              //                                   Navigator.push(
              //                                       context,
              //                                       SlidePageRoute(
              //                                           page: JournalScreen()));
              //                                 },
              //                                 child: Container(
              //                                   width: 80,
              //                                   height: 40,
              //                                   decoration: BoxDecoration(
              //                                     borderRadius:
              //                                         BorderRadius.circular(8),
              //                                     border: Border.all(
              //                                       color: Color(0xf2ffffff),
              //                                       width: 1,
              //                                     ),
              //                                     color: Colors.black,
              //                                   ),
              //                                   padding: const EdgeInsets.only(
              //                                     top: 3,
              //                                     bottom: 2,
              //                                   ),
              //                                   child: Center(
              //                                     child: Text(
              //                                       "Cek",
              //                                       textAlign: TextAlign.center,
              //                                       style: TextStyle(
              //                                         color: Colors.white,
              //                                         fontSize: 12,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Positioned(
              //                               left: 310,
              //                               top: 12,
              //                               child: Column(
              //                                 children: [
              //                                   Visibility(
              //                                     visible: jurnal_list[index]
              //                                                 ["status"] ==
              //                                             "s"
              //                                         ? true
              //                                         : false,
              //                                     child: Container(
              //                                       width: 60,
              //                                       height: 30,
              //                                       decoration: BoxDecoration(
              //                                         borderRadius:
              //                                             BorderRadius.circular(
              //                                                 8),
              //                                         border: Border.all(
              //                                           color:
              //                                               Color(0xff000aff),
              //                                           width: 1,
              //                                         ),
              //                                         color: Colors.white,
              //                                       ),
              //                                       padding:
              //                                           const EdgeInsets.only(
              //                                         top: 2,
              //                                         bottom: 1,
              //                                       ),
              //                                       child: Row(
              //                                         mainAxisSize:
              //                                             MainAxisSize.min,
              //                                         mainAxisAlignment:
              //                                             MainAxisAlignment
              //                                                 .center,
              //                                         crossAxisAlignment:
              //                                             CrossAxisAlignment
              //                                                 .center,
              //                                         children: [
              //                                           Text(
              //                                             "Finished",
              //                                             textAlign:
              //                                                 TextAlign.center,
              //                                             style: TextStyle(
              //                                               color: Color(
              //                                                   0xff000aff),
              //                                               fontSize: 12,
              //                                             ),
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Visibility(
              //                                     visible: jurnal_list[index]
              //                                                 ["status"] ==
              //                                             "p"
              //                                         ? true
              //                                         : false,
              //                                     child: Container(
              //                                       width: 60,
              //                                       height: 30,
              //                                       decoration: BoxDecoration(
              //                                         borderRadius:
              //                                             BorderRadius.circular(
              //                                                 8),
              //                                         border: Border.all(
              //                                           color:
              //                                               Color(0xff0a4700),
              //                                           width: 1,
              //                                         ),
              //                                         color: Colors.white,
              //                                       ),
              //                                       padding:
              //                                           const EdgeInsets.only(
              //                                         top: 2,
              //                                         bottom: 1,
              //                                       ),
              //                                       child: Row(
              //                                         mainAxisSize:
              //                                             MainAxisSize.min,
              //                                         mainAxisAlignment:
              //                                             MainAxisAlignment
              //                                                 .center,
              //                                         crossAxisAlignment:
              //                                             CrossAxisAlignment
              //                                                 .center,
              //                                         children: [
              //                                           Text(
              //                                             "Process",
              //                                             textAlign:
              //                                                 TextAlign.center,
              //                                             style: TextStyle(
              //                                               color: Color(
              //                                                   0xff0a4700),
              //                                               fontSize: 12,
              //                                             ),
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Visibility(
              //                                     visible: jurnal_list[index]
              //                                                 ["status"] ==
              //                                             "n"
              //                                         ? true
              //                                         : false,
              //                                     child: Container(
              //                                       width: 60,
              //                                       height: 30,
              //                                       decoration: BoxDecoration(
              //                                         borderRadius:
              //                                             BorderRadius.circular(
              //                                                 8),
              //                                         border: Border.all(
              //                                           color:
              //                                               Color(0xffff0000),
              //                                           width: 1,
              //                                         ),
              //                                         color: Colors.white,
              //                                       ),
              //                                       padding:
              //                                           const EdgeInsets.only(
              //                                         top: 2,
              //                                         bottom: 1,
              //                                       ),
              //                                       child: Row(
              //                                         mainAxisSize:
              //                                             MainAxisSize.min,
              //                                         mainAxisAlignment:
              //                                             MainAxisAlignment
              //                                                 .center,
              //                                         crossAxisAlignment:
              //                                             CrossAxisAlignment
              //                                                 .center,
              //                                         children: [
              //                                           Text(
              //                                             "Pending",
              //                                             textAlign:
              //                                                 TextAlign.center,
              //                                             style: TextStyle(
              //                                               color: Color(
              //                                                   0xffff0000),
              //                                               fontSize: 12,
              //                                             ),
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             Positioned(
              //                               left: 17,
              //                               top: 12,
              //                               child: SizedBox(
              //                                 width: 162,
              //                                 height: 20,
              //                                 child: Text(
              //                                   jurnal_list[index]
              //                                           ["tanggal_dibuat"] ??
              //                                       "",
              //                                   style: TextStyle(
              //                                     color: Color(0xff1400ff),
              //                                     fontSize: 14,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 );
              //               })

              //           // Stack(
              //           //   children: [
              //           //     Container(
              //           //       width: 328,
              //           //       height: 340,
              //           //       decoration: BoxDecoration(
              //           //         borderRadius: BorderRadius.circular(12),
              //           //         color: Color(0xffd9d9d9),
              //           //       ),
              //           //     ),
              //           //     Positioned.fill(
              //           //       child: Align(
              //           //         alignment: Alignment.topLeft,
              //           //         child: Container(
              //           //             width: 340,
              //           //             height: 340,
              //           //             decoration: BoxDecoration(
              //           //               borderRadius: BorderRadius.circular(12),
              //           //             ),
              //           //             child: (_center == null)
              //           //                 ? Center(
              //           //                     child: CircularProgressIndicator())
              //           //                 : googleMap2(context)
              //           //             // : GoogleMap(
              //           //             //     onMapCreated: _onMapCreated,
              //           //             //     initialCameraPosition: CameraPosition(
              //           //             //       target: _center,
              //           //             //       zoom: 11.0,
              //           //             //     ),
              //           //             //   ),
              //           //             ),
              //           //       ),
              //           //     ),
              //           //   ],
              //           // ),
              //           ),

              //   // Container(
              //   //   padding: EdgeInsets.symmetric(
              //   //     horizontal: 16,
              //   //   ),
              //   //   alignment: Alignment.centerLeft,
              //   //   child: Text(
              //   //     "Lokasi Anda",
              //   //     style: TextStyle(
              //   //         fontSize: 18,
              //   //         fontFamily: "medium",
              //   //         color: Theme.of(context)
              //   //             .accentTextTheme
              //   //             .headline2
              //   //             .color),
              //   //   ),
              //   // ),

              //   // Row(
              //   //   children: [
              //   //     Container(
              //   //       padding: EdgeInsets.symmetric(
              //   //         horizontal: 16,
              //   //       ),
              //   //       child: Text(
              //   //         lat ?? "",
              //   //         style: TextStyle(
              //   //             fontSize: 14,
              //   //             fontFamily: "medium",
              //   //             color: Theme.of(context)
              //   //                 .accentTextTheme
              //   //                 .headline3
              //   //                 .color),
              //   //       ),
              //   //     ),
              //   //     Container(
              //   //       padding: EdgeInsets.symmetric(
              //   //         horizontal: 16,
              //   //       ),
              //   //       child: Text(
              //   //         lng ?? "",
              //   //         style: TextStyle(
              //   //             fontSize: 14,
              //   //             fontFamily: "medium",
              //   //             color: Theme.of(context)
              //   //                 .accentTextTheme
              //   //                 .headline3
              //   //                 .color),
              //   //       ),
              //   //     ),
              //   //   ],
              //   // ),
              //   // RaisedButton(
              //   //   child: Text("Absen"),
              //   // ),

              //   //////////////////////////////////////////////////
              // ),

              cek_absen == "1"
                  ? MaterialButton(
                      onPressed: () {
                        // Get the image
                      },
                      child: Container(
                        width: 328,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x44000000),
                              blurRadius: 24,
                              offset: Offset(8, 8),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Sampai Jumpa Besok",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : MaterialButton(
                      onPressed: () async {
                        // Get the image
                        await getImage();
                        // Show the popup
                        _getjam();
                        doabsen(context);
                      },
                      child: Container(
                        width: 328,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x44000000),
                              blurRadius: 24,
                              offset: Offset(8, 8),
                            ),
                          ],
                          color:
                              cek_absen == "0" ? Color(0xff020438) : Colors.red,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              cek_absen == "0" ? "Check in" : "Check Out",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              SizedBox(
                height: 10,
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

  void doabsen(BuildContext context) {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              insetPadding: EdgeInsets.all(30),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  height: 500,
                  child: Container(
                    height: 500,
                    child: ListView(
                      children: [
                        SizedBox(height: 10),
                        _image != null
                            ? Center(child: Image.file(_image, height: 300))
                            : Center(
                                child: Container(
                                color: Colors.grey,
                                child: Center(child: Text("Belum Ada Foto")),
                                height: 300,
                              )),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text("Waktu :"),
                                  Text(jam ?? ""),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Titik Kordinat :"),
                                  Text(lat),
                                  Text(","),
                                  Text(lng),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Tempat :"),
                                  Text(jam ?? ""),
                                ],
                              ),
                            ],
                          )),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              // cek_absen == "0" ? Color(0xff020438) : Colors.red,
                              child: Text("Kirim Absen"),
                              onPressed: () {
                                _absen();
                                // Add your code here to send the data to the server
                                Navigator.of(context).pop();
                              },
                            ),
                            RaisedButton(
                              child: Text("Batal"),
                              onPressed: () {
                                print(pegawaiid == "" ? iduser : pegawaiid);
                                print("cek foto ===>" + _image.path ?? "null");
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )));
        });
      },
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////

// class LocationAttendancePage extends StatefulWidget {
//   @override
//   _LocationAttendancePageState createState() => _LocationAttendancePageState();
// }

// class _LocationAttendancePageState extends State<LocationAttendancePage> {
//   GoogleMapController _mapController;
//   LatLng _currentPosition;
//   Marker _currentMarker;
//   TextEditingController _locationController;
//   File _image;

//   @override
//   void initState() {
//     super.initState();

//     // Mengambil posisi saat ini dan menginisialisasi marker
//     _getCurrentLocation().then((position) {
//       setState(() {
//         _currentPosition = position;
//         _currentMarker = Marker(
//           markerId: MarkerId("current_position"),
//           position: _currentPosition,
//         );
//       });
//     });

//     // Menginisialisasi controller untuk TextField lokasi
//     _locationController = TextEditingController();
//   }

//   void _moveCameraToCurrentPosition() {
//     if (_currentPosition != null) {
//       _mapController
//           .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target: _currentPosition,
//         zoom: 16.0,
//       )));
//     }
//   }

//   @override
//   void dispose() {
//     _locationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Absensi Lokasi"),
//       ),
//       body: Stack(
//         children: [
//           // Widget untuk menampilkan peta
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target:
//                   _currentPosition, // Gunakan posisi saat ini sebagai posisi awal peta
//               zoom: 15,
//             ),
//             markers: _currentMarker != null
//                 ? Set<Marker>.of([_currentMarker])
//                 : null, // Ubah dari Set menjadi Set.of
//           ),
//           // Widget untuk menampilkan keterangan lokasi dan tombol untuk memilih gambar
//           Positioned(
//             left: 16,
//             bottom: 16,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width - 80,
//                   child: TextField(
//                     controller: _locationController,
//                     decoration: InputDecoration(
//                       hintText: "Keterangan Tempat",
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: _getImage,
//                   child: Text("Pilih Gambar"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Callback yang dipanggil saat peta selesai dibuat
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }

//   // Fungsi untuk mengambil posisi saat ini menggunakan package geolocator
//   Future<LatLng> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     return LatLng(position.latitude, position.longitude);
//   }

//   // Fungsi untuk memilih gambar dari galeri menggunakan package image_picker
//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print("Gambar tidak dipilih.");
//       }
//     });
//   }
// }
