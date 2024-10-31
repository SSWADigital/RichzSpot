import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTabScreen extends StatefulWidget {
  const MapTabScreen({Key key}) : super(key: key);

  @override
  _MapTabScreenState createState() => _MapTabScreenState();
}

class _MapTabScreenState extends State<MapTabScreen> {
  final Map<String, LatLng> _locations = {
    'New York': LatLng(40.7128, -74.006),
    'San Francisco': LatLng(37.7749, -122.4194),
    'London': LatLng(51.5074, -0.1278),
  };

  GoogleMapController _mapController;
  LatLng _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onLocationSelected(LatLng location) {
    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(location, 12));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _currentLocation != null
                ? CameraPosition(target: _currentLocation, zoom: 12)
                : const CameraPosition(
                    target: LatLng(37.7749, -122.4194), zoom: 12),
            markers: _locations.entries
                .map((entry) => Marker(
                      markerId: MarkerId(entry.key),
                      position: entry.value,
                      onTap: () => _onLocationSelected(entry.value),
                    ))
                .toSet(),
          ),
        ),
      ],
    );
  }
}
