import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../widgets/city_tile.dart';
import 'search_screen.dart';
import '../config/data.dart';
import '../config/config.dart';
import '../classes/temperature.dart';

List<Temperature> tempList = [];
String longitute = "";
String latitute = "";
Future<List<Temperature>> searchTemp() async {
  for (var i = 0; i < cities.length; i++) {
    var response = await http
        .get(Uri.parse('$baseUrl?q=${cities[i]}&appid=$apiKey&units=$unit'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load album');
    }
    print('${response.body} ${cities[i]} ${i}');

    tempList.add(Temperature.fromJson(jsonDecode(response.body)));

    print('-----------//////${tempList[0].weatherCondition}');
    print("_______///${tempList[0].pressure}");
    print("-------????${tempList[0].humidity}");
    print('-----------////${tempList[0].visibility}');
    print('//////////////${tempList[0].country}');
    print('.////////////${tempList[0].lon}');
  }

  return tempList;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Temperature>> futureTemp;

  void getLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('position ================= $position');
    print('function');

    setState(() {
      print(position);
      longitute = "${position.longitude}";
      latitute = "${position.latitude}";
    });
  }

  @override
  void initState() {
    super.initState();
    futureTemp = searchTemp();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan[300],
        appBar: AppBar(
          title: Center(
              child: Text("WEATHER_APP",
                  style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ))),
          actions: [
            IconButton(
              onPressed: () {
                print("pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => search_screen(),
                  ),
                );
              },
              icon: Icon(Icons.add_circle_outline_outlined),
              iconSize: 40,
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: futureTemp,
                builder: (context, c) {
                  if (!c.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: tempList.length,
                          itemBuilder: (context, i) {
                            print('${cities[i]}');

                            print(tempList[i].timezone);
                            var utcTime = DateTime.now().toUtc();

                            var addTime = utcTime
                                .add(Duration(seconds: tempList[i].timezone));

                            // var formattedTime = DateFormat.yMMMMd('en_US');
                            // print(formattedTime.format(addTime));

                            print(tempList[i].temp.round());

                            IconData wIcon = Icons.add;

                            switch (tempList[i].weatherCondition) {
                              case "Haze":
                                wIcon = Icons.cloud_rounded;
                                print(wIcon);
                                break;

                              case "Clouds":
                                wIcon = Icons.cloud_done;
                                break;

                              case "Rain":
                                wIcon = Icons.cloud_download;
                                break;

                              case "Clear":
                                wIcon = Icons.cloud_circle_outlined;
                                break;

                              case "Mist":
                                wIcon = Icons.visibility;
                                break;

                              default:
                                wIcon = Icons.add;
                            }

                            return CityTile(
                                tempList[i].name,
                                tempList[i].temp.round(),
                                addTime,
                                tempList[i].weatherCondition,
                                wIcon,
                                tempList[i].visibility,
                                tempList[i].pressure,
                                tempList[i].humidity,
                                tempList[i].lon,
                                tempList[i].lat,
                                tempList[i].country,
                                tempList[i].tempMin,
                                tempList[i].tempMax);
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
