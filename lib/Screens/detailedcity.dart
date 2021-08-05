import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/Home.dart';
import '../widgets/city_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class detailed extends StatefulWidget {
  @override
  _detailedState createState() => _detailedState();
}

class _detailedState extends State<detailed> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                print('pressed');
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              'tempList[i].name',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          '3 August 2021',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'addTime',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'tempList[i].temp 30c',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                                color: Colors.white
                          )),
                        ),
                        Text('tempList[i].weatherCondition',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 100,
                          child: Card(
                            color: Colors.cyan[700],
                            elevation: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Visibility',
                                        style: GoogleFonts.lato(textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.black,
                                        ),),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '3000',
                                        style: GoogleFonts.lato(textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.white,
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),VerticalDivider(
                            color: Colors.black,thickness: 2,
                            width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pressure',
                                      style:  GoogleFonts.lato(textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '1007',
                                      style:  GoogleFonts.lato(textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ],
                                ),VerticalDivider(
                            color: Colors.black,thickness: 2,
                            width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Humidity',
                                      style:  GoogleFonts.lato(textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '47',
                                      style:  GoogleFonts.lato(textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    child: Card(
                      color: Colors.cyan[700],
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Longitude',
                                  style:  GoogleFonts.lato(textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '80.2785',
                                  style:  GoogleFonts.lato(textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),),
                                ),
                              ],
                            ),
                          ),VerticalDivider(
                      color: Colors.black,
                            thickness: 2,
                      width: 20,),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Latitude',
                                  style:  GoogleFonts.lato(textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '13.0878',
                                  style:  GoogleFonts.lato(textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),),
                                ),
                              ],
                            ),
                          ),VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                      width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Country',
                                style:  GoogleFonts.lato(textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'IND',
                                style:  GoogleFonts.lato(textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
