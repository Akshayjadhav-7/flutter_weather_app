import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.indigoAccent,
          appBar: AppBar(
            title: Center(
              child: Text(
                'Weather App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            actions: [
              Icon(Icons.add_box_rounded,size: 50,),
            ],
          ),
          body: Column(
            children: [
              Card(
                margin: EdgeInsets.all(20),
                child: resusableListTile(),
              ),
              SizedBox(
                height: 8,
              ),
              Card(margin: EdgeInsets.all(20), child: resusableListTile()),
              SizedBox(
                height: 8,
              ),
              Card(margin: EdgeInsets.all(20), child: resusableListTile()),
              SizedBox(
                height: 8,
              ),
              Card(margin: EdgeInsets.all(20), child: resusableListTile()),
              SizedBox(
                height: 8,
              ),
              Card(margin: EdgeInsets.all(20), child: resusableListTile()),
              SizedBox(
                height: 8,
              ),
              Card(margin: EdgeInsets.all(20), child: resusableListTile()),
            ],
          ),
        ),
      ),
    );
  }
}

class resusableListTile extends StatelessWidget {
  const resusableListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return Detailedcity();
        // }),);
      },
      leading: Icon(
        Icons.edit_location,
        size: 50,
        color: Colors.black,
      ),
      title: Text(
        "03:00 pm",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "Mumbai",
        style: TextStyle(
          color: Colors.black,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        '30',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
    );
  }
}



