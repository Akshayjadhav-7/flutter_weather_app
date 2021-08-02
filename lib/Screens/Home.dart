import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/city_tile.dart';
import 'search_screen.dart';
import '../config/data.dart';
import '../config/config.dart';
import '../classes/temperature.dart';


List<Temperature> tempList = [];


class Album {
  final String time;
  Album({
    required this.time,
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      time: json['time'],
    );
  }
}

Future<Album> fetchAlbum() async {
  var responseTime =  await http.get(Uri.parse('https://www.timeapi.io/api/Time/current/zone?timeZone=Asia/Kolkata'));
  var time1 =  Album.fromJson(jsonDecode(responseTime.body));
  print(time1.time);
  return time1;
}













Future<List<Temperature>> searchTemp() async {
  for(var i=0; i<cities.length;i++) {
    var response = await http.get(Uri.parse(
        '$baseUrl?q=${cities[i]}&appid=$apiKey&units=$unit'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load album');

    }
    tempList.add(Temperature.fromJson(jsonDecode(response.body)));
  }
return tempList;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Temperature>> futureTemp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   futureTemp =  searchTemp();
   fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              child: FutureBuilder(future : futureTemp, builder: (context,c){
                if(!c.hasData){
                  return Center(
                    child: CircularProgressIndicator()
                  );
                }
                return Column(
                  children: [
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                        itemCount: tempList.length,
                        itemBuilder: (context,i){
                          print('${cities[i]}');

                          print(tempList[i].timezone);
                          var utcTime = DateTime.now().toUtc();
                          
                          var addTime = utcTime.add(Duration (seconds: tempList[i].timezone));

                          return CityTile(tempList[i].name,tempList[i].temp,addTime);
                          },),
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

