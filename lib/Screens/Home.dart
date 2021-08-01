import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
import 'search_screen.dart';
import 'package:http/http.dart' as http;

const cities = ['Mumbai','London','Kolkata','Delhi','Lahore'];

class Temperature {
  final String base;
  final int visibility;
  // final String temp;
  Temperature({
    required this.base,
    required this.visibility,
    // required this.temp,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      base: json['base'],
      visibility: json['visibility'],
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
double tempMumbai = 0;
class _HomeState extends State<Home> {
  Future<void> searchTemp() async {
    var response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=Mumbai&appid=6c2672b40acf8eba142697cf18cf278b&units=metric'));

    // print('response = $response');

    var t = Temperature.fromJson(jsonDecode(response.body));
    // Map< String,dynamic >response2 = json.decode(response.body);

    Map data = jsonDecode(response.body);
    Map main = data['main'];
    Map cord = data['coord'];
    double lonmumbai = cord['lon'];
    double latmumbai = cord['lat'];
     tempMumbai = main['temp'];
    int humiditymumbai = main['humidity'];
    print('Log & Lat of mumbai is: $lonmumbai : $latmumbai');
    print('Tempreature of mumbai is: $tempMumbai');
    print('humidity of mumbai: $humiditymumbai');
    print(t.visibility);
    print(t.base);
    // print(t.temp);
  }

  @override
  Widget build(BuildContext context) {
    searchTemp();

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
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                      itemCount: cities.length,


                        itemBuilder: (context,i){
                        print('${cities[i]}');
                        return CityTile(cities[i]);

                        }),
                  ),
                  // Card(
                  //   color: Colors.white70,
                  //   child: CityTile('03:00 pm', 'Mumbai', '$tempMumbai'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CityTile extends StatelessWidget {
  // final String time;
  final String city;
  // final String temp;

  CityTile( this.city,);
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
        '',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
