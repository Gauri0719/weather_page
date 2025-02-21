import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/connectivity_services.dart';

import '../widget/todays_weather.dart';

class NetworkServices{
  /// baseurl is the common for all the api
  String baseUrl="http://api.weatherapi.com/v1/";
  String key="ab7272d8849342c3b74113127251102";

  final ConnectivityService _connectivityService = ConnectivityService();
    Future<bool> _checkInternetConnectivity() async {
      final hasConnection = await _connectivityService.checkInternetConnection();
       if(!hasConnection){
         return false;
       }
      return true;
    }

  Future<Welcome> getForecastData({
     double? lat,
     double? long,
  String? userInputLocation}) async {
    String q='';
    if(userInputLocation!= null && userInputLocation.isNotEmpty){
      q=userInputLocation;
    }else if(lat!=null){
      q='$lat,$long';
    }
  ///we have used because type od http.get is Uri
    if(await _checkInternetConnectivity()){
      final response=
      await http.get(Uri.parse('${baseUrl}forecast.json?key=$key&q=$q&aqi=no&days=7'));

      // CONVERT STRING JSON TO MAP
      Map<String,dynamic>jsonMap = json.decode(response.body);
       Welcome model = Welcome.fromJson(jsonMap);
       return model;
    }else{
      return Future.value(Welcome(
        error: WeatherError(
          code: 404,message: "Internet Connection not available..."
        )
      ));
    }


  // var responseModel=WeatherResponseModel(
  //   region:jsonMap['location']['region'],
  //   name:jsonMap['location']['name'],
  //     country:jsonMap['location']['country'],
  //     currentTemp:jsonMap['current']['temp_c'],
  //     windkmp:jsonMap['current']['wind_kph'],
  //     humidity:jsonMap['current']['humidity'],
  //   cloud:jsonMap['current']['cloud'],
  //     minTemp:jsonMap['forecast']['forecastday'][0]['day']['mintemp_c'],
  //     maxTemp:jsonMap['forecast']['forecastday'][0]['day']['maxtemp_c'],
  //   sunrise:jsonMap['forecast']['forecastday'][0]['astro']['sunrise'],
  //   sunset:jsonMap['forecast']['forecastday'][0]['astro']['sunset'],
  //   moonrise:jsonMap['forecast']['forecastday'][0]['astro']['moonrise'],
  //   moonset:jsonMap['forecast']['forecastday'][0]['astro']['moonset'],
  //   currentHourTemp: (jsonMap['forecast']['forecastday'][0]['hour'][currentHourIndex]['temp_c'] ?? 0.0).toDouble(),
  //   nextHourTemp: (jsonMap['forecast']['forecastday'][0]['hour'][nextHourIndex]['temp_c'] ?? 0.0).toDouble(),
  //   previousHour1Temp: (jsonMap['forecast']['forecastday'][0]['hour'][previousHour1Index]['temp_c'] ?? 0.0).toDouble(),
  //   previousHour2Temp: (jsonMap['forecast']['forecastday'][0]['hour'][previousHour2Index]['temp_c'] ?? 0.0).toDouble(),
  //   daymax1:jsonMap['forecast']['forecastday'][0]['day']['maxtemp_c'],
  //   daymin1:jsonMap['forecast']['forecastday'][0]['day']['mintemp_c'],

  // );
  // print(responseModel.daymin1);
  //   Welcome model=Welcome.fromJson(jsonMap);
  //  return model;
  }
}
///HERE WE HAVE CREATED MODAL CLASS-IN MODAL CLASS WE HAVE TO SPECIFY THE
///VARIABLE NAME AND AFTER WE HAVE CALL THE CONSTRUCTOR AND WE HAVE TO ADD THAT
///PROPERTIES TO THE CONSTRUCTOR
/// FETCH DATA FROM MAP TO WEATHERRESPONSEMODEL
class WeatherResponseModel{
  final String region;
  final String country;
  final double currentTemp;
  final double minTemp;
  final double maxTemp;
  final String name;
  final double windkmp;
  final int? humidity;
  final int? cloud;
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final double currentHourTemp;
  final double nextHourTemp;
  final double previousHour1Temp;
  final double previousHour2Temp;
  final int daymax1;
  // final String daymax2;
  // final String daymax3;
  // final String daymax4;
  // final String daymax5;
  // final String daymax6;
  // final String daymax7;
   final double daymin1;
  // final String daymin2;
  // final String daymin3;
  // final String daymin4;
  // final String daymin5;
  // final String daymin6;
  // final String daymin7;





  WeatherResponseModel({
      required this.region,
     required this.country,
      required this.currentTemp,
      required this.minTemp,
     required this.maxTemp,
  required this.name,
  required this.windkmp,
  required this.humidity,
  required this.sunrise,
  required this.sunset,
  required this.moonrise,
  required this.moonset,
  required this.cloud,
    required this.currentHourTemp,
    required this.nextHourTemp,
    required this.previousHour1Temp,
    required this.previousHour2Temp,
  required this.daymax1,
  // required this.daymax2,
  // required this.daymax3,
  // required this.daymax4,
  // required this.daymax5,
  // required this.daymax6,
  // required this.daymax7,
   required this.daymin1,
  // required this.daymin2,
  // required this.daymin3,
  // required this.daymin4,
  // required this.daymin5,
  // required this.daymin6,
  // required this.daymin7,
});


}
// Get current nad next  hour's weather data
DateTime now = DateTime.now();
int currentHourIndex = now.hour;
int nextHourIndex = (currentHourIndex + 1) % 24;

// Get previous hours
int previousHour1Index = (currentHourIndex - 1) % 24; // 1 hour before
int previousHour2Index = (currentHourIndex - 2) % 24; // 2 hours before
