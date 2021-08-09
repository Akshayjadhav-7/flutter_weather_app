import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CityTile extends StatelessWidget {
  final DateTime time;
  final String city;
  final int temp;
  final String weather;
  final IconData iconWeather;
  final int visibility;
  final int pressure;
  final int humidity;
  final double lon;
  final double lat;
  final String country;
  final double tempMin;
  final double tempMax;
  CityTile(
      this.city,
      this.temp,
      this.time,
      this.weather,
      this.iconWeather,
      this.visibility,
      this.pressure,
      this.humidity,
      this.lon,
      this.lat,
      this.country,
      this.tempMin,
      this.tempMax);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedScreen(
                    time,
                    temp,
                    weather,
                    city,
                    visibility,
                    pressure,
                    humidity,
                    lon,
                    lat,
                    country,
                    tempMin,
                    tempMax,
                  ),
                ),
              );
            },
            title: Text(getTime(time),
                style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            subtitle: Text(
              city,
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            trailing: Column(
              children: [
                Text('$weather',
                    style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Text('${temp} °C',
                    style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            leading: Icon(
              iconWeather,
            ),
          ),
        ),
      ),
    );
  }
}

String getTime(time) {
  var hhm = time.toString().substring(11, 16);

  var hh = hhm.substring(0, 2);
  print(hh);
  print(hhm);
  if (int.parse(hh) > 11) {
    return hhm + 'pm';
  } else {
    return hhm + 'am';
  }
}
