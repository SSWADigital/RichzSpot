import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng initialLocation = const LatLng(37.422131, -122.084801);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/icons/ic_back.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialLocation,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("marker1"),
            position: const LatLng(37.422131, -122.084801),
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker2"),
            position: const LatLng(37.415768808487435, -122.08440050482749),
          ),
        },
      ),
    );
  }
}
