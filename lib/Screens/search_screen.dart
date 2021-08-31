import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
import 'package:flutter_weather_app/Screens/Home.dart';
import 'package:flutter_weather_app/classes/Gps.dart';
import 'package:flutter_weather_app/config/config.dart';
import 'dart:convert';
import 'dart:async';
import '../classes/temperature.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

String longitute = "";
String latitute = "";
var _cityName;
final nameControl = new TextEditingController();
Future<GpsLocation> locationData(lat, lon) async {
  print('inside LocationData');
  print('latitute  = $lat');
  var gps = await http.get(
    Uri.parse('$baseUrl?lat=$latitute&lon=$longitute&appid=$apiKey&units=$unit'),
  );

  if (gps.statusCode != 200) {
    print('mot o 10000000000000');
    print(gps.statusCode);
    // throw Exception('Failed to load ');
  }
  var gpsData;
  print(gps.body);
  gpsData.add(
    GpsLocation.fromJson(
      jsonDecode(gps.body),
    ),
  );
  print('${gpsData.body}');
  return gpsData;
}

Future<SearchCity> searchLocation() async {
  print('inside LocationData');
  var city = await http.get(
    Uri.parse('$baseUrl?q=Mumbai&appid=$apiKey&units=$unit'),
  );

  if (city.statusCode != 200) {
    print('mot o 10000000000000');
    print(city.statusCode);
    // throw Exception('Failed to load ');
  }

  print(city.body);
  var gpsData;
  gpsData.add(
    GpsLocation.fromJson(
      jsonDecode(city.body),
    ),
  );
  print('${gpsData.body}');
  return gpsData;
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Icon searchIcon = Icon(Icons.search_outlined);

  Widget appBar = Text(
    'Mumbai',
    style: TextStyle(fontSize: 30),
  );

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // print(position);
    setState(() {
      print('positionnnnnnnnnnnnnnnnnnnnnnn = $position');

      var latitute =position.latitude;
      var longitute = position.longitude;
      print("laTTtTTTTTT = $latitute");
      print('$longitute');

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
              iconSize: 40,
            ),
            title: TextField(
              controller: nameControl,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                icon: Icon(
                  Icons.my_location,
                  size: 30,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            setState(() {
                              _cityName = nameControl.text;
                            });
                            print(
                                'CityNameeeeeeeeeeeeeeeeeeeeeeee = $_cityName');
                          },
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
