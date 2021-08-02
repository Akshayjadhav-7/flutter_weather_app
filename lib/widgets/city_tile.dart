import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/detailedcity.dart';
class CityTile extends StatelessWidget {
  final DateTime time;
  final String city;
  final double temp;

  CityTile( this.city,this.temp,this.time);
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
        getTime(time),
        style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        city,
        style: TextStyle(fontSize: 40,
          fontWeight: FontWeight.w600,)
        ,
      ),
      trailing: Text(
        '$temp',
        style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

String getTime(time){

  var hhm = time.toString().substring(11,16);
  
  var hh = hhm.substring(0,2);
  print(hh);
  print(hhm);
  if(int.parse(hh)>11){
    return hhm+'pm';

    
  }else{
    
    return hhm+'am';
  }
  
}
