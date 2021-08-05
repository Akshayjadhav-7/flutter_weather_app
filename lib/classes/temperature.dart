import 'package:flutter/cupertino.dart';

class Temperature {
  final double temp;
  final String name;
  final int timezone;
  final String weatherCondition;
  // final IconData icon;
  Temperature({
    required this.temp,
    required this.name,
    required this.timezone,
    required this.weatherCondition,
    // required this.icon,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      temp: json['main']['temp'],
      name: json['name'],
      timezone: json['timezone'],
      weatherCondition: json['weather'][0]['main'],
        // icon: json['weather'][0]['main'],
    );
  }
}

