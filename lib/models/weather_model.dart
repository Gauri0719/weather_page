// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final Location? location;
  final Current? current;
   final Forecast? forecast;
   final WeatherError? error;

  Welcome({
     this.location,
    this.current,
    this.forecast,
    this.error,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
     forecast: json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
    error:json["error"] == null ? null : WeatherError.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
     "location": location?.toJson(),
    "current": current?.toJson(),
    "forecast": forecast?.toJson(),
  };
}

class Current {

  final double? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  // final int? windDegree;
  // final WindDir? windDir;
  // final int? pressureMb;
  // final double? pressureIn;
  // final double? precipMm;
  // final int? precipIn;
   final int? humidity;
    final int? cloud;
  // final double? feelslikeC;
  // final double? feelslikeF;
  // final double? windchillC;
  // final double? windchillF;
  // final double? heatindexC;
  // final double? heatindexF;
  // final double? dewpointC;
  // final double? dewpointF;
  // final int? visKm;
  // final int? visMiles;
  // final double? uv;
  // final double? gustMph;
  // final double? gustKph;
  // final int? timeEpoch;
  // final String? time;
  // final int? snowCm;
  // final int? willItRain;
  // final int? chanceOfRain;
  // final int? willItSnow;
  // final int? chanceOfSnow;

  Current({

    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    // this.windDegree,
    // this.windDir,
    // this.pressureMb,
    // this.pressureIn,
    // this.precipMm,
    // this.precipIn,
     this.humidity,
    this.cloud,
    // this.feelslikeC,
    // this.feelslikeF,
    // this.windchillC,
    // this.windchillF,
    // this.heatindexC,
    // this.heatindexF,
    // this.dewpointC,
    // this.dewpointF,
    // this.visKm,
    // this.visMiles,
    // this.uv,
    // this.gustMph,
    // this.gustKph,
    // this.timeEpoch,
    // this.time,
    // this.snowCm,
    // this.willItRain,
    // this.chanceOfRain,
    // this.willItSnow,
    // this.chanceOfSnow,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(

    tempC: json["temp_c"]?.toDouble(),
    tempF: json["temp_f"]?.toDouble(),
    isDay: json["is_day"],
      condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    windMph: json["wind_mph"]?.toDouble(),
     windKph: json["wind_kph"]?.toDouble(),
    // windDegree: json["wind_degree"],
    // windDir: windDirValues.map[json["wind_dir"]]!,
    // pressureMb: json["pressure_mb"],
    // pressureIn: json["pressure_in"]?.toDouble(),
    // precipMm: json["precip_mm"]?.toDouble(),
    // precipIn: json["precip_in"],
     humidity: json["humidity"],
    cloud: json["cloud"],
    // feelslikeC: json["feelslike_c"]?.toDouble(),
    // feelslikeF: json["feelslike_f"]?.toDouble(),
    // windchillC: json["windchill_c"]?.toDouble(),
    // windchillF: json["windchill_f"]?.toDouble(),
    // heatindexC: json["heatindex_c"]?.toDouble(),
    // heatindexF: json["heatindex_f"]?.toDouble(),
    // dewpointC: json["dewpoint_c"]?.toDouble(),
    // dewpointF: json["dewpoint_f"]?.toDouble(),
    // visKm: json["vis_km"],
    // visMiles: json["vis_miles"],
    // uv: json["uv"]?.toDouble(),
    // gustMph: json["gust_mph"]?.toDouble(),
    // gustKph: json["gust_kph"]?.toDouble(),
    // timeEpoch: json["time_epoch"],
    // time: json["time"],
    // snowCm: json["snow_cm"],
    // willItRain: json["will_it_rain"],
    // chanceOfRain: json["chance_of_rain"],
    // willItSnow: json["will_it_snow"],
    // chanceOfSnow: json["chance_of_snow"],
  );

  Map<String, dynamic> toJson() => {

    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition?.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    // "wind_degree": windDegree,
    // "wind_dir": windDirValues.reverse[windDir],
    // "pressure_mb": pressureMb,
    // "pressure_in": pressureIn,
    // "precip_mm": precipMm,
    // "precip_in": precipIn,
     "humidity": humidity,
      "cloud": cloud,
    // "feelslike_c": feelslikeC,
    // "feelslike_f": feelslikeF,
    // "windchill_c": windchillC,
    // "windchill_f": windchillF,
    // "heatindex_c": heatindexC,
    // "heatindex_f": heatindexF,
    // "dewpoint_c": dewpointC,
    // "dewpoint_f": dewpointF,
    // "vis_km": visKm,
    // "vis_miles": visMiles,
    // "uv": uv,
    // "gust_mph": gustMph,
    // "gust_kph": gustKph,
    // "time_epoch": timeEpoch,
    // "time": time,
    // "snow_cm": snowCm,
    // "will_it_rain": willItRain,
    // "chance_of_rain": chanceOfRain,
    // "will_it_snow": willItSnow,
    // "chance_of_snow": chanceOfSnow,
  };
}

class Condition {
  final String? text;
  final String? icon;
  final int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });
  // Factory constructor to parse from JSON
  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
     icon: json["icon"],
        //  != null
        // ? "https:${json["icon"]}"  // Ensure it's a valid HTTP URL
        // : null,
    code: json["code"],
  );

  // Method to convert object to JSON
  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };
}
class WeatherError {
  final Error? error;
  final int? code;
  final String? message;

  WeatherError({
    this.error,
    this.code,
    this.message,
  });

factory WeatherError.fromJson(Map<String,dynamic> json) => WeatherError(
code: json["code"] ,
  message:json["message"],

);
Map<String,dynamic> toJson()=>{
  "code":code,
  "message":message,
};
}
class Forecast {
  final List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: json["forecastday"] == null ? [] : List<Forecastday>.from(json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "forecastday": forecastday == null ? [] : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
  };
}

class Forecastday {
  final DateTime? date;
  final int? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Current>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateEpoch: json["date_epoch"],
    day: json["day"] == null ? null : Day.fromJson(json["day"]),
    astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
    hour: json["hour"] == null ? [] : List<Current>.from(json["hour"]!.map((x) => Current.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "date_epoch": dateEpoch,
    "day": day?.toJson(),
    "astro": astro?.toJson(),
    "hour": hour == null ? [] : List<dynamic>.from(hour!.map((x) => x.toJson())),
  };
}

class Astro {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final int? moonIllumination;
  final int? isMoonUp;
  final int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"],
    moonIllumination: json["moon_illumination"],
    isMoonUp: json["is_moon_up"],
    isSunUp: json["is_sun_up"],
  );

  Map<String, dynamic> toJson() => {
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "moon_illumination": moonIllumination,
    "is_moon_up": isMoonUp,
    "is_sun_up": isSunUp,
  };
}

class Day {
  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  // final double? totalprecipMm;
  // final int? totalprecipIn;
  // final int? totalsnowCm;
  // final int? avgvisKm;
  // final int? avgvisMiles;
  // final int? avghumidity;
  // final int? dailyWillItRain;
  // final int? dailyChanceOfRain;
  // final int? dailyWillItSnow;
  // final int? dailyChanceOfSnow;
  final Condition? condition;
  // final double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    // this.totalprecipMm,
    // this.totalprecipIn,
    // this.totalsnowCm,
    // this.avgvisKm,
    // this.avgvisMiles,
    // this.avghumidity,
    // this.dailyWillItRain,
    // this.dailyChanceOfRain,
    // this.dailyWillItSnow,
    // this.dailyChanceOfSnow,
    this.condition,
    // this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: (json["maxtemp_c"] as num?)?.toDouble() ?? 0.0,
    maxtempF: (json["maxtemp_f"] as num?)?.toDouble() ?? 0.0,
    mintempC: (json["mintemp_c"] as num?)?.toDouble() ?? 0.0,
    mintempF: (json["mintemp_f"] as num?)?.toDouble() ?? 0.0,
    avgtempC: (json["avgtemp_c"] as num?)?.toDouble() ?? 0.0,
    avgtempF: (json["avgtemp_f"] as num?)?.toDouble() ?? 0.0,
    // avgtempC: json["avgtemp_c"]?.toDouble(),
    // avgtempF: json["avgtemp_f"]?.toDouble(),
    // maxwindMph: json["maxwind_mph"]?.toDouble(),
    // maxwindKph: (json["maxwind_kph"] as num)?.toDouble(),
    // totalprecipMm: json["totalprecip_mm"]?.toDouble(),
    // totalprecipIn: json["totalprecip_in"],
    // totalsnowCm: json["totalsnow_cm"],
    // avgvisKm: json["avgvis_km"],
    // avgvisMiles: json["avgvis_miles"],
    // avghumidity: json["avghumidity"],
    // dailyWillItRain: json["daily_will_it_rain"],
    // dailyChanceOfRain: json["daily_chance_of_rain"],
    // dailyWillItSnow: json["daily_will_it_snow"],
    // dailyChanceOfSnow: json["daily_chance_of_snow"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    // uv: json["uv"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "maxtemp_c": maxtempC,
    "maxtemp_f": maxtempF,
    "mintemp_c": mintempC,
    "mintemp_f": mintempF,
    "avgtemp_c": avgtempC,
    "avgtemp_f": avgtempF,
    "maxwind_mph": maxwindMph,
    "maxwind_kph": maxwindKph,
    // "totalprecip_mm": totalprecipMm,
    // "totalprecip_in": totalprecipIn,
    // "totalsnow_cm": totalsnowCm,
    // "avgvis_km": avgvisKm,
    // "avgvis_miles": avgvisMiles,
    // "avghumidity": avghumidity,
    // "daily_will_it_rain": dailyWillItRain,
    // "daily_chance_of_rain": dailyChanceOfRain,
    // "daily_will_it_snow": dailyWillItSnow,
    // "daily_chance_of_snow": dailyChanceOfSnow,
    "condition": condition?.toJson(),
    // "uv": uv,
  };
}

class Location {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    tzId: json["tz_id"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
