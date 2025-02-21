import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_application/models/weather_model.dart';

import '../services/network_service.dart';

class todaysweather extends StatelessWidget {
  final Welcome? model; // Make this final

  todaysweather({super.key, required this.model}) {
    weatherResponse = model; // Assign model to weatherResponse
  }

  Welcome? weatherResponse;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        // Column 1
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("${weatherResponse?.forecast?.forecastday?[0].hour?[previousHour2Index].tempC ?? '-'}°",style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),),
           
                SizedBox(height: 28.0,),
                    Image.network("http:${weatherResponse?.forecast?.forecastday?[0].hour?[previousHour2Index].condition?.icon}",
                        height: 30,width: 30.0,
                        errorBuilder: (context, error, stackTrace) {
           return const Icon(Icons.location_off, color: Colors.white, size: 30);
           }
                     ),
                SizedBox(height: 30.0,),
                Text("$previousHour2Index.00",style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),),
              ],
           
              ),
              SizedBox(width: 10.0,),
                   //   Column 2
                   Column(
            children: [
              Text("${weatherResponse?.forecast?.forecastday?[0].hour?[previousHour1Index].tempC ?? '-'} °",style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),),
              SizedBox(height: 28.0,),
              Image.network("http:${weatherResponse?.forecast?.forecastday?[0].hour?[previousHour1Index].condition?.icon}",
           
                height: 30,width: 30.0,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.location_off, color: Colors.white, size: 30);
                  }),
              SizedBox(height: 28.0,),
              Text("$previousHour1Index.00",style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),),
            ],
                   ),
                SizedBox(width: 10.0,),
                   //   Column 3
                   Container(
            width: 80,
            height: 155,
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 11.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent,width: 1.0),
              borderRadius: BorderRadius.circular(18),
              color: Color(0xFF001026).withValues(alpha: 0.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${weatherResponse?.forecast?.forecastday?[0].hour?[currentHourIndex].tempC ?? '-'}°  ",style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),),
                Image.network("http:${weatherResponse?.forecast?.forecastday?[0].hour?[currentHourIndex].condition?.icon}",
                  height: 30,width: 30.0,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.location_off, color: Colors.white, size: 30);
                    }
                ),
                Text("$currentHourIndex.00",style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),),
              ],
            ),
                   ),
                SizedBox(width: 10.0,),
                   //   Column 4
                   Column(
            children: [
              Text("${weatherResponse?.forecast?.forecastday?[0].hour?[nextHourIndex].tempC ?? '-'}°",style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),),
              SizedBox(height: 28.0,),
              Image.network("http:${weatherResponse?.forecast?.forecastday?[0].hour?[nextHourIndex].condition?.icon}",
                height: 30,width: 30.0,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.location_off, color: Colors.white, size: 30);
                  }),
              SizedBox(height: 28.0,),
              Text("$nextHourIndex.00",style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),),
            ],
                   ),
                 ],
               ),
               ),
      
      
      ]),
    );
  }
}




