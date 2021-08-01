import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
class CityTile extends StatelessWidget {
  // final String time;
  final String city;
  final double temp;

  CityTile( this.city,this.temp);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detailed(),
          ),
        );
      },
      title: Text(
        '',
        style: TextStyle(fontSize: 30),
      ),
      subtitle: Text(
        city,
        style: TextStyle(fontSize: 40),
      ),
      trailing: Text(
        '$temp',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
