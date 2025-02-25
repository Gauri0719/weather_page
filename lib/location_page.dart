import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_application/google_maps.dart';
import 'package:weather_application/services/shared_prefernces_services.dart';

import 'services/network_service.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _searchController=TextEditingController();
  LocationSettings locationSettings=LocationSettings(accuracy: LocationAccuracy.best);
   Position? position;
   bool isLoading=false;
 //  LOAD SAVED LOCATION WHEN THE PAGE OPENS
 @override
  void initState() {

   super.initState();
   _loadSavedLocation();
  }
  Future<void> _loadSavedLocation() async {
    Map<String, double?> savedLocation = await
    SharedPrefServices.getSavedLocation();

    if (savedLocation['latitude'] != null &&
        savedLocation['longitude'] != null) {
      setState(() {
        position = Position(longitude: savedLocation['longitude']!,
            latitude: savedLocation['latitude']!,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            altitudeAccuracy: 0,
            heading: 0,
            headingAccuracy: 0,
            speed: 0,
            speedAccuracy: 0);
      });
    }
  }
  ///THIS METHOD WILL RETURN PERMISSION STATUS
  Future<bool> isLocationPermissionProvided() async {
 late LocationPermission permission;

  permission=await Geolocator.checkPermission();
  if(permission==LocationPermission.denied){
    permission=await Geolocator.requestPermission();
  }
 if(permission==LocationPermission.denied){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content:Text("Location permission denied")));
   return false;
 }
 if(permission==LocationPermission.deniedForever){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content:Text("Location permission permanently denied")));
   return false;
 }
    return true;
  }
   Future<bool> isGpsServicesEnabled() async {
    bool isGpsEnabled=false;
   isGpsEnabled=await Geolocator.isLocationServiceEnabled();
   if(!isGpsEnabled){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content:Text("GPS services are disabled")));
   }
    return isGpsEnabled;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:  Color(0xFF29B2DD),
        elevation: 0.0,
        title: Text("Select Location",style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
        color: Colors.white),),
      ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF29B2DD),
              Color(0xFF33AADD),
              Color(0xFF20CBEA),
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0,0.47,1.0])
            ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox( // Ensures Column takes up necessary space
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height, // Full screen height
                  ),
                  child: IntrinsicHeight(
              child: Column(
                          children: [
              Container(
                margin: EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value){},
                  style: const TextStyle(
                    color: Colors.black
                  ),
                  decoration: InputDecoration(
                    hintText: "Search Location",
                    hintStyle: TextStyle(color: Colors.black.withValues(alpha: 0.7)),
                    prefixIcon: Icon(Icons.search,color: Colors.black,),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0
                    )
                  ),
                ),
              ),
              InkWell(
               onTap: () async {
                 // Step 1:CLEAR PREVIOUSLY SAVED LOCATION
                 await SharedPrefServices.clearLocation();
                 isLoading=true;
                 setState(() {});
                 if( await isGpsServicesEnabled()){
                        if(await isLocationPermissionProvided()){
                        //       Step 2 :GET NEW GPS LOCATION
                        position =await Geolocator.getCurrentPosition(
              locationSettings:LocationSettings());
                        // STEP 3:SAVE NEW LOCATION
                        await SharedPrefServices.saveLocation(
              position!.latitude,
              position!.longitude);
                        print("latitude : ${position?.latitude ?? ''}");
                        print("longitude : ${position?.longitude ?? ''}");
                        isLoading=false;
                        setState(() {});
                        }
                        }
                 },

               child: Container(
                 margin: EdgeInsets.all(16.0),
                 decoration: BoxDecoration(
                   color: Colors.white.withValues(alpha: 0.2,),
                   borderRadius: BorderRadius.circular(15.0)
                 ),
                 child: ListTile(
                   leading: InkWell(
                     onTap: (){

                     },
                     child:isLoading
                         ? CircularProgressIndicator()
                         : Container(
                         padding: EdgeInsets.all(8.0),
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Colors.white.withValues(alpha: 0.3)
                         ),
                         child: Icon(Icons.my_location,color: Colors.white,)),
                   ),
                   title: Text("Current Location",
                     style: TextStyle(fontSize: 20.0,
                     fontWeight: FontWeight.w500,
                     color: Colors.white),),
                   subtitle: Text("Using GPS",style: TextStyle(
                       fontSize: 13.0,
                       fontWeight: FontWeight.w400,
                   color: Colors.black54),),
                 ),
               ),
                           ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Lat=${position?.latitude?? ''}",style:
                  TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),),
                  Text("Long=${position?.longitude?? ''}",style:
                  TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),)
                ],
              ),
              SizedBox(height: 20.0,),
              InkWell(
                onTap: () async {
                 LatLng? selectedPosition=await Navigator.of(context).push(MaterialPageRoute(builder:
                     (context)=>GoogleMaps()  )) as LatLng?;
                 if(selectedPosition != null){
                     callWeatherApi(selectedPosition.latitude, selectedPosition.longitude);
                 }else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                       content: Text("Please Select Valid Location")));
                 }
                },
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2,),
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: ListTile(
                    leading: InkWell(
                      onTap: (){},
                        child: Icon(Icons.map,color: Colors.white,)),

                    title: Text("Google Maps",
                      style: TextStyle(fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),),
                    subtitle: Text("Using GPS",style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () async {
                     callWeatherApi(position?.latitude, position?.longitude);
                    },   child: Text("Submit")),
              ),
                          ],
                        )),),
    ))) );
  }
  callWeatherApi(double? latitude,double? longitude)async{
    try {
      NetworkServices networkServices = NetworkServices();
      var responseModel = await networkServices
          .getForecastData(
        lat: latitude,
        long: longitude,
        userInputLocation: _searchController.text,
      );
      // isLoading=false;
      if (responseModel.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "${responseModel.error?.message}")));
      } else {
        Navigator.of(context).pop(responseModel);
      }
    } catch (ex) {
      debugPrint(ex.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something Went Wrong...")));
    }
  }
}
