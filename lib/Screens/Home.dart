import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
import 'search_screen.dart';
import 'package:http/http.dart' as http;
import '../widgets/city_tile.dart';
const cities = ['Mumbai','London','Kolkata','Delhi','Lahore'];

List<Temperature> tempList = [];
Future<List<Temperature>> searchTemp() async {
print('\n\n12-----------------------=====${tempList.length}');
  for(var i=0; i<cities.length;i++) {
    print('---------------loop $i ${cities[i]}');
    var response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=${cities[i]}&appid=6c2672b40acf8eba142697cf18cf278b&units=metric'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load album');
    }
    tempList.add(Temperature.fromJson(jsonDecode(response.body)));
    print('\n\n21-----------------------=====${tempList.length}');
  }
print('\n\n23-----------------------=====${tempList.length}');
return tempList;
}

class Temperature {
  final double temp;
  final String name;

  Temperature({
    required this.temp,
    required this.name,

  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      temp: json['main']['temp'],
      name: json['name'],
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

double tempMumbai = 0;


class _HomeState extends State<Home> {
  late Future<List<Temperature>> futureTemp;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   futureTemp =  searchTemp();
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
                print(tempMumbai);

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
                          return CityTile(tempList[i].name,tempList[i].temp);
                          },),
                    ),
                  ],
                );
              }),

              // child: Column(
              //   children: [
              //     Container(
              //       child: ListView.builder(
              //           shrinkWrap: true,
              //         itemCount: tempList.length,
              //
              //
              //           itemBuilder: (context,i){
              //           print('${cities[i]}');
              //           return CityTile(tempList[i].name,tempList[i].temp);
              //
              //           }),
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

