

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController  extends GetxController implements GetxService{
  RxSet<Marker> hotelsMarker = <Marker>{}.obs;
  late GoogleMapController mapController;

  @override
  void onInit() {
    super.onInit();
    addHotelsToMap();
  }

  void setMapController(GoogleMapController controller){
    mapController = controller;
  }

  addHotelsToMap(){
    hotelsMarker.add(
      const Marker(
        markerId: MarkerId("Guru Kripa"),
        infoWindow: InfoWindow(title: "Guru Kripa"),
        position: LatLng(22.62082238838415, 75.80067402802271),
      ),
    );
    hotelsMarker.add(
      const Marker(
        markerId: MarkerId("Enrise"),
        infoWindow: InfoWindow(title: "Enrise"),
        position: LatLng(22.625882931108805, 75.80365550571157),
      ),
    );
    hotelsMarker.add(
      const Marker(
        markerId: MarkerId("Goa Malwa"),
        infoWindow: InfoWindow(title: 'Goa Malwa'),
        position: LatLng(22.63099418722109, 75.80657970088095),
      ),
    );
    hotelsMarker.add(
      const Marker(
        markerId: MarkerId("Super townhouse"),
        infoWindow: InfoWindow(title: "Super townhouse"),
        position: LatLng(22.632442575984275, 75.80726623602932),
      ),
    );
    hotelsMarker.add(
      const Marker(
        markerId: MarkerId("Papaya Tree"),
        infoWindow: InfoWindow(title: "Papaya Tree"),
        position: LatLng(22.62718789115103, 75.8051228755858),
      ),
    );
    hotelsMarker.add(
      const Marker(
        markerId: MarkerId("Waterfall restaurant"),
        infoWindow: InfoWindow(title: "Waterfall restaurant"),
        position: LatLng(22.618652952496443, 75.80111759762467),
      ),
    );
  }
}