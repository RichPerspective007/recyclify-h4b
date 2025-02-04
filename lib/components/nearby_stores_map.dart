import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyStoresMap extends StatefulWidget {
  const NearbyStoresMap({Key? key}) : super(key: key);

  @override
  _NearbyStoresMapState createState() => _NearbyStoresMapState();
}

class _NearbyStoresMapState extends State<NearbyStoresMap> {
  bool _isLoading = false;

  /// Fetches user's current location and opens Google Maps with nearby stores
  Future<void> _openGoogleMaps() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Get user's current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double latitude = position.latitude;
      double longitude = position.longitude;

      // Construct Google Maps search URL
      String googleMapsUrl =
          "https://www.google.com/maps/search/?api=1&query=electronics+store+exchange&"
          "query_place_id=$latitude,$longitude";

      // Open Google Maps
      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw "Could not launch Google Maps";
      }
    } catch (e) {
      print("Error fetching location: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to get location. Ensure GPS is enabled.")),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _isLoading ? null : _openGoogleMaps,
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text("Find Nearby Exchange Stores"),
      ),
    );
  }
}
