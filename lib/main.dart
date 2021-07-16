import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailedcity.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.indigoAccent,
          appBar: AppBar(
            title: Text(
              'Weather App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          body: Column(

            children: [

              Card(
                margin: EdgeInsets.all(20),
                child:ListTile(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Detailedcity();
                    // }),);
                  },
                  leading: Icon(Icons.edit_location, size: 50, color: Colors.black,),
                  title: Text(
                    "NewYork",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),

              ),
              SizedBox(height: 8,),
              Card(
                margin: EdgeInsets.all(20),
                child: ListTile(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Detailedcity();
                    // }),);
                  },
                  leading: Icon(Icons.edit_location, size: 50, color: Colors.black,),
                  title: Text(
                    "Delhi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                margin: EdgeInsets.all(20),
                child: ListTile(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Detailedcity();
                    // }),);
                  },
                  leading: Icon(Icons.edit_location, size: 50, color: Colors.black,),
                  title: Text(
                    "Lahore",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                margin: EdgeInsets.all(20),
                child: ListTile(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Detailedcity();
                    // }),);
                  },
                  leading: Icon(Icons.edit_location, size: 50, color: Colors.black,),
                  title: Text(
                    "Singapore",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                margin: EdgeInsets.all(20),
                child: ListTile(

                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Detailedcity();
                    // }),);
                  },
                  leading: Icon(Icons.edit_location, size: 50, color: Colors.black,),
                  title: Text(
                    "London",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                margin: EdgeInsets.all(20),
                child: ListTile(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Detailedcity();
                    // }),);
                  },
                  leading: Icon(Icons.edit_location, size: 50, color: Colors.black,),
                  title: Text(
                    "Mumbai",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}

