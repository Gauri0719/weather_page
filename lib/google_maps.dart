
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});
  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController _controller;
  MapType mapType = MapType.normal;
  LatLng selectedLatLng = LatLng(18.5197, 73.8452);

  void _onMapCreated(GoogleMapController controller){
    _controller = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                  zoomControlsEnabled: true,
                  mapType: MapType.normal,
                  onMapCreated: (controller){
                    _onMapCreated(controller);
                  },
                  onLongPress: (LatLng selectedLatLng){
                    print(selectedLatLng);
                    setState(() {
                      this.selectedLatLng = selectedLatLng;
                    });
                  },
                  markers: {
                    Marker(
                        markerId: MarkerId("Selected Location"),
                        position: selectedLatLng,
                        infoWindow: InfoWindow(
                            title: "${selectedLatLng.latitude},${selectedLatLng.longitude}"
                        )
                    )
                  },
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(18.44241,73.8092279),
                      zoom: 15
                  )
              ),
              Positioned(
                bottom: 15.0,
                left: 10.0,
                right: 50.0,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${selectedLatLng.latitude.toStringAsFixed(4)},${selectedLatLng.longitude.toStringAsFixed(4)}"),
                        SizedBox(height: 10.0,),
                        ElevatedButton(onPressed: (){
                        Navigator.of(context).pop(selectedLatLng);
                        }, child: Text("Submit"))
                      ],
                    ),
                  ),
                ),
              )

            ],
          )),
    );
  }
}


