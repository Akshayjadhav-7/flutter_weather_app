import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class search_screen extends StatelessWidget {
  Icon searchIcon = Icon(Icons.search_outlined);
  Widget appBar = Text(
    'Mumbai',
    style: TextStyle(fontSize: 30),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {

                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,size: 30,),
              iconSize: 40,
            ),
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Search for the Location',
                hintStyle: TextStyle(fontSize: 30,color: Colors.white),
              ),

            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon( Icons.my_location,size: 30,),),
            ],
          ),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(32.0), child: Container()),
          ),
        ));
  }
}
