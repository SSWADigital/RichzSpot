import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homital/DoctorListScreenTabs/DokterTelehealth.dart';
import 'package:homital/Theme/theme.dart';
import 'package:homital/UI/posisi.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class DetailPulang extends StatefulWidget {
  const DetailPulang({Key key}) : super(key: key);

  @override
  State<DetailPulang> createState() => _DetailPulangState();
}

class _DetailPulangState extends State<DetailPulang> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
