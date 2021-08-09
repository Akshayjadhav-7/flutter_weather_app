import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_weather_app/Screens/Home.dart';
import 'package:intl/intl.dart';
import '../widgets/city_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/temperature.dart';

DateTime dateToday = new DateTime.now();
String date = dateToday.toString().substring(0, 10);

class DetailedScreen extends StatefulWidget {
  DateTime cityTime;
  int cityTemp;
  String cityName;
  String cityWeather;
  final int visibility;
  final int cityPressure;
  final int cityHumidity;
  final double lon;
  final double lat;
  final String country;
  final double cityTempMin;
  final double cityTempMax;
  DetailedScreen(
      this.cityTime,
      this.cityTemp,
      this.cityName,
      this.cityWeather,
      this.visibility,
      this.cityPressure,
      this.cityHumidity,
      this.lon,
      this.lat,
      this.country,
      this.cityTempMin,
      this.cityTempMax);

  @override
  // State<StatefulWidget> createState() {
  //   return detailedState (this.cityWeather,this.cityTime,this.cityTemp,this.cityName);
  // }
  State<StatefulWidget> createState() => _DetailedScreenState();
  // _detailedState createState() => _detailedState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                print('pressed');
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              '${widget.cityWeather}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '$date',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '${widget.cityTemp} °C',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 150,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        Text(widget.cityName,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            )),
                        Divider(
                          height: 20,
                          color: Colors.indigo,
                          indent: 100,
                          endIndent: 100,
                          thickness: 1,
                        ),
                        Container(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.cyan[700],
                              elevation: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'MinTemp.',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.cityTempMin}',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 2,
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'MaxTemp',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.cityTempMax}',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.cyan[700],
                              elevation: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Visibility',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.visibility}',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 2,
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Pressure',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.cityPressure}',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.cyan[700],
                              elevation: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Humidity',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.cityHumidity}',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 2,
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Country',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.country}',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.cyan[700],
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Longitude',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${widget.lon}',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              thickness: 2,
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Latitude',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${widget.lat}',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// DateFormat dateFormat(date){
//
//
//
//   DateFormat formattedDate = DateFormat.yMMMMd('en_US');
//   print(formattedDate.format(date));
//
//   return formattedDate;
//
// }
