import 'package:flutter/material.dart';
import './add_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WEATHER APP'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () { 
              print('add button clicked...');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
