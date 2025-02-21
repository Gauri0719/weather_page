import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/location_page.dart';
import 'package:weather_application/services/network_service.dart';
import 'package:weather_application/services/shared_prefernces_services.dart';
import 'package:weather_application/widget/next_forecast.dart';
import 'package:weather_application/widget/todays_weather.dart';
import 'package:weather_application/widget/weekly_forecast_weather.dart';

import 'models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key,});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isNotificationEnabled=false;
  Welcome? weatherResponse;

  bool get isNightTime{
    final currentHour=DateTime.now().hour;
    bool isNight=currentHour <6 || currentHour>18;
    return isNight;
  }

  // Welcome? get responseModel => null;


  @override
  void initState() {
    super.initState();
    _loadSavedLocationAndFetchData();
  }
  Future<void> _loadSavedLocationAndFetchData() async {
    Map<String, double?> savedLocation = await SharedPrefServices.getSavedLocation();

    if (savedLocation['latitude'] != null && savedLocation['longitude'] != null) {
      NetworkServices networkService = NetworkServices();
      var responseModel = await networkService.getForecastData(
        lat: savedLocation['latitude'],
        long: savedLocation['longitude'],
      );

      if (responseModel.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${responseModel.error?.message}"),
          ),
        );
      } else {
        setState(() {
          weatherResponse = responseModel;
        });
      }
    }
  }


  String _getFormattedDate() {
    final date = DateTime.now();
    final month = _getMonthName(date.month);
    return '$month, ${date.day}';
  }
  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: isNightTime?[
            Color(0xFF08244F),
            Color(0xFF134CB5),
            Color(0xFF0B42AB),
          ] :[
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                    // FIRST ROW
                    // NOTIFICATION,LOCATION,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                           weatherResponse
                           =await Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>LocationPage()))
                          as Welcome?;
                           if(weatherResponse != null){
                             setState(() {

                             });
                             // print("http:${weatherResponse?.current?.condition?.icon}");
                           }
                          },
                          child: Row(
                            children: [
                                      SvgPicture.asset(
                                        "assets/assets/icons/location.svg",
                                        semanticsLabel: 'Dart Logo',
                                        height: 27.0,
                                        width: 27.0,
                                      ),
                              SizedBox(width: 5.0,),
                              Text('${weatherResponse?.location?.name ?? 'Select Location'},'
                                  '${weatherResponse?.location?.region ?? ''}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "Blinker",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,),),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          isNotificationEnabled?"assets/assets/icons/notification_fill.svg":"assets/assets/icons/notification_clear.svg",
                          semanticsLabel: 'Dart Logo',
                          height: 27.0,
                          width: 27.0,
                        ),

                      ],
                    ),
                  ),
                  // CLOUD STATUS

                  Image.network(
                    'http:${weatherResponse?.current?.condition?.icon}',
                    width: 150,
                    height: 150,
                    fit: BoxFit.fitHeight,
    errorBuilder: (context, error, stackTrace) {
      return const Icon(Icons.location_off, color: Colors.white, size: 100);
    }),

          SizedBox(height: 20.0,),
                //   TEMPERATURE
                  Text("${weatherResponse?.current?.tempC ?? '--'}°C",style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Blinker',
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),),
                  Text("Precipitations",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Blinker',
                    color: Colors.white,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Max:${weatherResponse?.forecast?.forecastday?[0].day?.maxtempC ?? '--'}°",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Blinker',
                        color: Colors.white,
                      ),),
                    SizedBox(width: 10.0,),
                    Text("Min:${weatherResponse?.forecast?.forecastday?[0].day?.mintempC ?? '--'}°",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Blinker',
                        color: Colors.white,
                      ),)
                  ],),
                //   TODAY TEMPERATURE
                  Container(
                    margin: EdgeInsets.only(left: 30.0,right:30.0,top:30.0,bottom: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),
                    color: isNightTime
                        ? Color(0xFF001026).withValues(alpha: 0.3)
                        : Color(0xFF104084).withValues(alpha: 0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      //   FIRST ROW OF RAIN
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/assets/icons/rain.svg",
                              semanticsLabel: 'Dart Logo',
                              height: 27.0,
                              width: 27.0,
                            ),
                            Text("${weatherResponse?.current?.cloud ?? '--'}%",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Blinker',
                              color: Colors.white,)),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/assets/icons/noun-humidity.svg",
                              semanticsLabel: 'Dart Logo',
                              height: 27.0,
                              width: 27.0,
                            ),
                            Text("${weatherResponse?.current?.humidity ?? '--'}%",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Blinker',
                              color: Colors.white,)),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/assets/icons/wind.svg",
                              semanticsLabel: 'Dart Logo',
                              height: 27.0,
                              width: 27.0,
                            ),
                            Text("${weatherResponse?.current?.windKph ?? '--'}km/hr",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Blinker',
                              color: Colors.white,)),
                          ],
                        ),

                      //   SECOND ROW OF WIND
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 35.0,right:30.0,top:10.0,bottom: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),
                      color:  isNightTime
                          ? Color(0xFF001026).withValues(alpha: 0.3)
                          : Color(0xFF104084).withValues(alpha: 0.3),
                    ),
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Today",style: TextStyle(
                                  fontSize: 22.0,
                                  fontFamily: 'Blinker',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(_getFormattedDate(),style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.sunny,color: Colors.yellow,),
                              Column(
                                children: [
                                  Text("Sunrise",style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Blinker',
                                    fontSize: 20.0
                                  ),),
                                  Text(weatherResponse?.forecast?.forecastday?[0].astro?.sunrise ?? '--',
                                    style: TextStyle(color: Colors.white),),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.nights_stay,color: Colors.purple,),
                          
                              Column(
                                children: [
                                  Text("Moonrise",style: TextStyle(
                              color: Colors.white,
                                fontFamily: 'Blinker',fontSize: 20.0)),
                                  Text(weatherResponse?.forecast?.forecastday?[0].astro?.moonrise ?? '--',
                                    style: TextStyle(color: Colors.white),),
                                ],
                              )
                          
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.cloudSun,
                                    color: Colors.orange,size:20 ,),
                                  SizedBox(width: 10.0,),
                                  Column
                                  (
                                    children: [
                                      Text("Sunset",style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Blinker',fontSize: 20.0)),
                                      Text(weatherResponse?.forecast?.forecastday?[0].astro?.sunset ?? '--',
                                        style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.nightlight_rounded,color: Colors.white,),
                                  Column(
                                    children: [
                                      Text("Moonset",style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Blinker',fontSize: 20.0)),
                                      Text(weatherResponse?.forecast?.forecastday?[0].astro?.moonset ?? '--',
                                        style: TextStyle(color: Colors.white),),
                                    ],
                                  )

                                ],
                              ),
                            ],
                          ),
                        ),
                        // TODAY WEATHER
                        todaysweather(model: weatherResponse,),
                      ],
                    )
                  ),
                 SizedBox(height: 10.0,),
                 // NEXT FORECAST
                 WeeklyForecastWeatherWidget(isNightTime: isNightTime,model: weatherResponse,)

                ],
              ),
            ),
          ),
        ),
      );
  }
}






