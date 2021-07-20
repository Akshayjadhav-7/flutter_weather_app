import 'package:flutter/material.dart';

class search_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined),
            iconSize: 40,
          ),
          title: Text(
            "Mumbai",
            style: TextStyle(fontSize: 40),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(

                children: [
                  Text(
                    "30 C",
                    style: TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "03:00 pm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tuesday,13th july",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
