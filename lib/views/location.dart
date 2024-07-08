import 'package:flutter/material.dart';
import 'package:food_order/shared/buttons.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';




class Locationpage extends StatefulWidget {
  const Locationpage({super.key});

  @override
  State<Locationpage> createState() => _LocationpageState();


}

class _LocationpageState extends State<Locationpage> {
   // ignore: unused_field
   PermissionStatus _permissionStatus = PermissionStatus.denied;
  // String _locationMessage = "";

 @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
  }

   Future<void> _checkPermissionStatus() async {
    final status = await Permission.locationWhenInUse.status;

    if (status == PermissionStatus.granted) {
      _getCurrentLocation();
    }

    setState(() {
      _permissionStatus = status;
    });
  }

 Future<void> _requestPermission() async {
    final status = await Permission.locationWhenInUse.request();
    setState(() {
      _permissionStatus = status;
    });

    if (status == PermissionStatus.granted) {
      _getCurrentLocation();
    }
  }

 Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final firstPlacemark = placemarks.first;
        final placeName = firstPlacemark.name; // Place name (e.g., "Central Park")
        final pincode = firstPlacemark.postalCode; // Pincode (if available)

       

        // Navigate to the next page after fetching the location details
        Get.offAllNamed("/home", arguments: {'firstplacemark': firstPlacemark});
      }
    } catch (e) {
      // print('Error fetching location: $e');
    }
  }
 




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
              width: 200.0, // Set the desired width
              height: 200.0, // Set the desired height
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/location.png'),
                  fit: BoxFit.cover,
                ),
              ),
              ),
              const SizedBox(height: 30),
        
              CommonButton(btntext: 'Access Location', btnmethod: _requestPermission),
              const SizedBox(height: 20),
              const Text('DFOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP', textAlign: TextAlign.center,)
              
            ],
          ),
        ),
      )
    );
}
}


