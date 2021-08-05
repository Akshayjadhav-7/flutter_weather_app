import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

import '../widgets/city_tile.dart';
import 'search_screen.dart';
import '../config/data.dart';
import '../config/config.dart';
import '../classes/temperature.dart';

List<Temperature> tempList = [];

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
  }

  print('out of the loop');
  return tempList;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Temperature>> futureTemp;

  void getLocation()async{
    print('getlocation called');
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('position ================= $position');
    print('function');
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureTemp = searchTemp();
    getLocation();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Center(
              child: Text(
            "Weather App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          )),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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


                              //  if(tempList[i].weatherCondition == 'Haze'){
                              //
                              //    wIcon = Icons.cloud_rounded;
                              //  }
                              // if(tempList[i].weatherCondition == 'Clouds'){
                              //
                              //   wIcon = Icons.cloud_done;
                              // }
                              // if(tempList[i].weatherCondition == 'Rain'){
                              //
                              //   wIcon = Icons.cloud_download;
                              // }
                              // if(tempList[i].weatherCondition == 'Clear'){
                              //
                              //   wIcon = Icons.cloud_circle_outlined;
                              //
                              // }
                              // if(tempList[i].weatherCondition == 'Mist'){
                              //
                              //   wIcon = Icons.visibility;
                              //
                              // }

                              return CityTile(
                                  tempList[i].name,
                                  tempList[i].temp,
                                  addTime,
                                  tempList[i].weatherCondition,
                                  wIcon);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
