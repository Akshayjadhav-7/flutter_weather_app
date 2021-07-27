import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
import 'search_screen.dart';
import 'package:http/http.dart' as http;

class Temperature {
  final String base;
  final int visibility;

  Temperature({
    required this.base,
    required this.visibility,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(base: json['base'], visibility: json['visibility']);
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
    print(t.visibility);
  }

  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      searchTemp();
    }

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
              Card(color: Colors.white70, child: citytile()),
              SizedBox(
                height: 15,
              ),
              Card(color: Colors.white70, child: citytile()),
              SizedBox(
                height: 15,
              ),
              Card(color: Colors.white70, child: citytile()),
              SizedBox(
                height: 15,
              ),
              Card(color: Colors.white70, child: citytile()),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.white70,
                child: citytile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class citytile extends StatelessWidget {
  // const citytile({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        '03:00 pm',
        style: TextStyle(fontSize: 30),
      ),
      subtitle: Text(
        'Chennai',
        style: TextStyle(fontSize: 40),
      ),
      trailing: Text(
        '30 C',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
