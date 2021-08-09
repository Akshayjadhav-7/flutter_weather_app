import 'package:flutter/cupertino.dart';

class Temperature {
  final double temp;
  final String name;
  final int timezone;
  final String weatherCondition;
  final double lon;
  final double lat;
  final int pressure;
  final int humidity;
  final  int visibility;
  final String country;
  final double tempMin;
  final double tempMax;
  Temperature({
    required this.temp,
    required this.name,
    required this.timezone,
    required this.weatherCondition,
    required this.lat,
    required this.lon,
    required this.humidity,
    required this.pressure,
    required this.visibility,
    required this.country,
    required this.tempMin,
    required this.tempMax
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      temp: json['main']['temp'],
      name: json['name'],
      timezone: json['timezone'],
      weatherCondition: json['weather'][0]['main'],
      lon:  json['coord']['lon'],
      lat: json['coord']['lat'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      visibility:  json['visibility'],
      country:  json['sys']['country'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
    );
  }
}
