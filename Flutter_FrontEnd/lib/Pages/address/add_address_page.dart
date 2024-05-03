
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/controllers/location_controller.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {

  LatLng initialPosition = const LatLng(
    22.62124020237999,
    75.8035477547594,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LocationController>(
        builder: (locationController) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: initialPosition,
              zoom: 17,
            ),
            markers: locationController.hotelsMarker,
            zoomControlsEnabled: false,
            compassEnabled: false,
            indoorViewEnabled: true,
            mapToolbarEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              locationController.setMapController(controller);
            },
          );
        },
      ),
    );
  }
}