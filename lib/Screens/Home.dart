import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
import 'search_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white12,
          appBar: AppBar(
            title: Center(
                child: Text(
              "Weather App",
              style: TextStyle(fontWeight: FontWeight.bold),
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
                iconSize: 30,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Card(
                  color: Colors.white70,
                  child: ListTile(
                    onTap: () {
                      print("pressed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => detailed()),
                      );
                    },
                    title: Text('03:00 pm', style: TextStyle(fontSize: 30)),
                    subtitle: Text('Mumbai', style: TextStyle(fontSize: 40)),
                    trailing: Text('30 C', style: TextStyle(fontSize: 30)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  color: Colors.white70,
                  child: ListTile(
                    onTap: () {
                      print('Pressed');
                    },
                    title: Text('03:00 pm', style: TextStyle(fontSize: 30)),
                    subtitle: Text('Delhi', style: TextStyle(fontSize: 40)),
                    trailing: Text('40 C', style: TextStyle(fontSize: 30)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  color: Colors.white70,
                  child: ListTile(
                    onTap: () {},
                    title: Text('03:00 pm', style: TextStyle(fontSize: 30)),
                    subtitle: Text('Kolkata', style: TextStyle(fontSize: 40)),
                    trailing: Text('30 C', style: TextStyle(fontSize: 30)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  color: Colors.white70,
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      '03:00 pm',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    subtitle: Text(
                      'Bangalore',
                      style: TextStyle(fontSize: 40),
                    ),
                    trailing: Text('35 C', style: TextStyle(fontSize: 30)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  color: Colors.white70,
                  child: ListTile(
                    onTap: () {},
                    title: Text('03:00 pm', style: TextStyle(fontSize: 30)),
                    subtitle: Text('Chennai', style: TextStyle(fontSize: 40)),
                    trailing: Text('30 C', style: TextStyle(fontSize: 30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
