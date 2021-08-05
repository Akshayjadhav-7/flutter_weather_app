import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';

class CityTile extends StatelessWidget {
  final DateTime time;
  final String city;
  final double temp;
  final String weather;
  final IconData iconWeather;
  CityTile(
    this.city,
    this.temp,
    this.time,
    this.weather,
      this.iconWeather
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => detailed(),
              ),
            );
          },
          title: Text(
            getTime(time),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            city,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          trailing: Column(
            children: [
              Text(
                '$weather',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$temp',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          leading:
          Icon(
            iconWeather,
            // Icons.cloud_rounded,
            // color: Colors.green,
            // size: 30.0,
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

// Icon getWeather(weather) {
//   if (weather != null) {
//     print('not null');
//
//     weather = Icon(
//       Icons.cloud_rounded,
//     );
//   } else {
//     print('it is null');
//   }
//   return weather;
// }
