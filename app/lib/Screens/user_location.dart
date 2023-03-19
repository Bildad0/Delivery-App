import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants.dart';

class UserLocationMap extends StatefulWidget {
  static const routeName = "/map";
  final Position? currentPosition;
  const UserLocationMap({
    Key? key,
    required this.currentPosition,
  }) : super(key: key);

  @override
  State<UserLocationMap> createState() => _UserLocationMapState();
}

class _UserLocationMapState extends State<UserLocationMap> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final latitude = widget.currentPosition!.latitude;
    final longitude = widget.currentPosition!.longitude;
    final LatLng center = LatLng(
      latitude,
      longitude,
    );
    final LatLng destination = LatLng(latitude - 0.000004, longitude);

    List<LatLng> polylineCoordinates = [];

    void getPolyPoints() async {
      PolylinePoints polylinePonts = PolylinePoints();

      PolylineResult result = await polylinePonts.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(center.latitude, center.longitude),
        PointLatLng(destination.latitude, destination.longitude),
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) =>
            polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        foregroundColor: Colors.red[400],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Map"),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        buildingsEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 14.5,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("source"),
            position: center,
          ),
          Marker(
            markerId: const MarkerId("destination"),
            position: destination,
          ),
        },
      ),
    );
  }
}
