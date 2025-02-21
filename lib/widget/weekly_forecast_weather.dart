import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../services/network_service.dart';
import 'next_forecast.dart';

class WeeklyForecastWeatherWidget extends StatefulWidget {
  final Welcome? model;
   WeeklyForecastWeatherWidget({
    super.key,
    required this.isNightTime,
    required this.model,
  }){
    weatherResponse = model;
  }
  Welcome? weatherResponse;
  final bool isNightTime;

  @override
  State<WeeklyForecastWeatherWidget> createState() => _WeeklyForecastWeatherWidgetState();
}

class _WeeklyForecastWeatherWidgetState extends State<WeeklyForecastWeatherWidget> {
   Welcome? weatherResponse;
  String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String _getFormattedDate(int daysToAdd) {
    final date = DateTime.now().add(Duration(days: daysToAdd));
    return '${_getDayName(date.weekday)}, ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35.0, right: 30.0, top: 5.0, bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: widget.isNightTime
            ? Color(0xFF001026).withValues(alpha: 0.3)
            : Color(0xFF104084).withValues(alpha: 0.3),
      ),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Next Forecast",
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Blinker',
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.calendar_month_rounded,
                color: Colors.white,
              ),
            ),
          ]),
          const SizedBox(height: 16),
          NextForecast(
              day: _getFormattedDate(0),
              maxTemp:
                  '${widget.model?.forecast?.forecastday?[0].day?.maxtempC ?? '-'}°C',
              minTemp:
                  '${widget.model?.forecast?.forecastday?[0].day?.mintempC ?? '-'}°C',
               iconUrl:'http:${widget.model?.forecast?.forecastday?[0].day?.condition?.icon}'

            // "${widget.model?.forecast?.forecastday?[0].day?.condition?.icon}°C"
          ),
          const SizedBox(height: 12),
          NextForecast(
              day: _getFormattedDate(1),
              maxTemp:
                  '${widget.model?.forecast?.forecastday?[1].day?.maxtempC ?? '-'}°C',
              minTemp:
                  '${widget.model?.forecast?.forecastday?[1].day?.mintempC ?? '-'}°C',
              iconUrl:
              "http:${widget.model?.forecast?.forecastday?[1].day?.condition?.icon}"
          ),
          const SizedBox(height: 12),
          NextForecast(
              day: _getFormattedDate(2),
              maxTemp:
                  '${widget.model?.forecast?.forecastday?[2].day?.maxtempC ?? '-'}°C',
              minTemp:
                  '${widget.model?.forecast?.forecastday?[2].day?.mintempC ?? '-'}°C',
              iconUrl:
                          "http:${widget.model?.forecast?.forecastday?[2].day?.condition?.icon}"
          ),

          const SizedBox(height: 12),
          NextForecast(
              day: _getFormattedDate(3),
              maxTemp:
                  '${widget.model?.forecast?.forecastday?[3].day?.maxtempC ?? '-'}°C',
              minTemp:
                  '${widget.model?.forecast?.forecastday?[3].day?.mintempC ?? '-'}°C',
              iconUrl:
              "http:${widget.model?.forecast?.forecastday?[3].day?.condition?.icon}"
          ),
          const SizedBox(height: 12),
          NextForecast(
              day: _getFormattedDate(4),
              maxTemp:
                  '${widget.model?.forecast?.forecastday?[4].day?.maxtempC ?? '-'}°C',
              minTemp:
                  '${widget.model?.forecast?.forecastday?[4].day?.mintempC ?? '-'}°C',
              iconUrl:
              "http:${widget.model?.forecast?.forecastday?[4].day?.condition?.icon}"
            ),
          const SizedBox(height: 12),
          NextForecast(
              day: _getFormattedDate(5),
              maxTemp:
                  '${widget.model?.forecast?.forecastday?[5].day?.maxtempC ?? '-'}°C',
              minTemp:
                  '${widget.model?.forecast?.forecastday?[5].day?.mintempC ?? '-'}°C',
              iconUrl:
              "http:${widget.model?.forecast?.forecastday?[5].day?.condition?.icon}"
    ),
          const SizedBox(height: 12),
          NextForecast(
              day: _getFormattedDate(6),
              maxTemp:
                  '${widget.model?.forecast?.forecastday?[6].day?.maxtempC ?? '-'}°C',
              minTemp:
                  '${widget.model?.forecast?.forecastday?[6].day?.mintempC ?? '-'}°C',
              iconUrl:
              "http:${widget.model?.forecast?.forecastday?[6].day?.condition?.icon}"
    ),
        ],
      ),
    );
  }
}
