// import 'package:egystore/Screens/SharedComponents/Dialog/aap_dialog.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MapUtils {
//   MapUtils._();
//
//   static Future<void> openMap(double latitude, double longitude) async {
//     String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//     if (await canLaunch(googleUrl)) {
//       await launch(googleUrl);
//     } else {
//       throw 'Could not open the map.';
//     }
//   }
//
//   static void launchMapsUrl(destinationLatitude, destinationLongitude) async {
//     if (!(await Geolocator().isLocationServiceEnabled())) {
//       AppDialog(context: Get.context);
//       return;
//     }
//     Geolocator().checkGeolocationPermissionStatus(
//       locationPermission: GeolocationPermission.location,
//     );
//     late LatLng _center;
//     late LatLng _lastMapPosition;
//     String initialAddress = "";
//     var lat, lng;
//
//     Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((location) {
//       if (location != null) {
//         _center = LatLng(location.latitude, location.longitude);
//         _lastMapPosition = _center;
//         lat = _lastMapPosition.latitude;
//         lng = _lastMapPosition.longitude;
//       }
//       return location;
//     });
//     String mapOptions = [
//       'saddr=$lat,$lng',
//       'daddr=$destinationLatitude,$destinationLongitude',
//       'dir_action=navigate'
//     ].join('&');
//     final url = 'https://www.google.com/maps?$mapOptions';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
