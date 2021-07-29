import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
import 'search_screen.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Temperature {
  final String base;
  final int visibility;
  // final int temp;
  Temperature({
    required this.base,
    required this.visibility,
    // required this.temp,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(base: json['base'], visibility: json['visibility'],);
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> searchTemp() async {
    print('function called');
    var response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=Mumbai&appid=6c2672b40acf8eba142697cf18cf278b&units=metric'));

    print('response = $response');



    var t = Temperature.fromJson(jsonDecode(response.body));
    // Map< String,dynamic >response2 = json.decode(response.body);

    var temp = Temperature.fromJson(jsonDecode(response)['base'][0]['temp']);
    print(temp);
    
    print(t.visibility);
    print(t.base);
    // print(t.temp);
  }

  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      searchTemp();
      Timer.periodic(Duration(seconds: 1),(Timer t)=> getTime());
    }

    searchTemp();
    // final instance = new Temperature(base: t.);
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
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [

              Card(color: Colors.white70, child: CityTile('03:00 pm','Mumbai','30 C'),),
              SizedBox(
                height: 15,
              ),
              Card(color: Colors.white70, child: CityTile('03:30 pm','chennai','32 C'),),
              SizedBox(
                height: 15,
              ),
              Card(color: Colors.white70, child: CityTile('03:45 pm','mumbai','31 C'),),
              SizedBox(
                height: 15,
              ),
              Card(color: Colors.white70, child: CityTile('02:30 pm','Lahore','35 C'),),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.white70,
                child: CityTile('04:00 pm','Singapore','33 C'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityTile extends StatelessWidget {

 final String time ;
 final String city;
 final String temp2;

 CityTile(this.time,this.city,this.temp2);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        
        Navigator.push(context, MaterialPageRoute(builder: (context) => detailed(),),);

      },
      title: Text(
        time,
        style: TextStyle(fontSize: 30),
      ),
      subtitle: Text(
        city,
        style: TextStyle(fontSize: 40),
      ),
      trailing: Text(
        temp2,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

void getTime(){
String _timeString;
final datetime = DateFormat('yyyy-MM-dd \n kk:mm:ss').format(DateTime.now()).toString();
_timeString = datetime;
print(_timeString);
}
