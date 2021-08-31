
import 'package:flutter/cupertino.dart';

class GpsLocation{
  final double gpsTemp;
  GpsLocation({
  required this.gpsTemp
  });

  factory GpsLocation.fromJson(Map<String, dynamic> json){
    return GpsLocation(
      gpsTemp: json['main']['temp'],
    );
  }
}

class SearchCity{

  final double searchTemp;
  SearchCity({
    required this.searchTemp
});

  factory SearchCity.fromJson(Map<String, dynamic> json){
    return SearchCity(
      searchTemp: json['main']['temp'],
    );
  }


}