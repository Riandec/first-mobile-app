import 'package:flutter/material.dart';
import 'package:first_application/models/aqi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiAssign extends StatefulWidget {
  const ApiAssign({super.key});

  @override
  State<ApiAssign> createState() => _ApiAssignState();
}

class _ApiAssignState extends State<ApiAssign> {
  Aqi? aqiData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      var response = await http.get(Uri.parse('https://api.waqi.info/feed/here/?token=6098441d02eb4e942e7af57172aa969162c67982'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Aqi aqi = Aqi.fromJson(data);
        setState(() {
          aqiData = aqi;
        });
      } else {
        setState(() {
          aqiData = null;
        });
        print('Failed to fetch data');
        print('Status code: ${response.statusCode} Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Today's AQI & Temp")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // location
          Container(
            padding: EdgeInsets.only(left:15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(width: 5),
                    Text('${aqiData?.city}', style: TextStyle(fontSize: 20))
                  ],
                )
              )
            )
          ),
          SizedBox(height: 20),
          
          // temp
          Stack(
            children: [
              Container(
                height: 150, 
                width: 350, 
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), 
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment(-1.0, -1.0),
                        padding: EdgeInsets.only(top: 5, left: 20),
                        child: Text('Temperature', style: TextStyle(fontSize: 20))
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment(-1.0, -1.0),
                        padding: EdgeInsets.only(top: 5, left: 20),
                        child: Text('${aqiData?.temp} °c', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                      )
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment(-1.0, -2.0),
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Partly Cloudy', style: TextStyle(fontSize: 20))
                      )
                    ),
                  ],
                )
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Image.asset('../assets/images/cloudy.png', height: 120)
              )
            ],
          ),
          SizedBox(height: 20),
          
          // aqi
          Stack(
            children: [
              Container(
                height: 200, 
                width: 350, 
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), 
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment(-1.0, -1.0),
                        padding: EdgeInsets.only(top: 5, left: 20),
                        child: Text('Air Quality Index (AQI)', style: TextStyle(fontSize: 20))
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment(-1.0,-1.0),
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${aqiData?.aqi}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                            Text('Good', style: TextStyle(fontSize: 20)),
                          ],
                        )
                      )
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsetsGeometry.only(left: 20, right: 20, top: 5, bottom: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)
                                  ),
                                  color: Color.fromARGB(255,162,239,96)
                                ),
                                child: Text('50', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              )
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), 
                                  color: Color.fromARGB(255,254,235,80)
                                ),
                                child: Text('100', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              )
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), 
                                  color: Color.fromARGB(255,253,178,76)
                                ),
                                child: Text('150', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              )
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), 
                                  color: Color.fromARGB(255,255,97,117)
                                ),
                                child: Text('200', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              )
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), 
                                  color: Color.fromARGB(255,179,111,189)
                                ),
                                child: Text('300', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              )
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), 
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30)
                                  ),
                                  color: Color.fromARGB(255,147,83,116)
                                ),
                                child: Text('500', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              )
                            )
                          ],
                        )
                      )
                    ),
                  ],
                )
              ),
              Positioned(
                top: 45,
                right: 30,
                child: Image.asset('../assets/images/good.png', height: 90)
              )
            ],
          ),
          SizedBox(height: 20),
          
          // weather info
          Container(
            height: 150, 
            width: 350, 
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black), 
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment(-1.0, -1.0),
                    padding: EdgeInsets.only(top: 5, left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red), 
                    ),
                    child: Text('Weather Information', style: TextStyle(fontSize: 20))
                  )
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment(-1.0, -1.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red), 
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green), 

                                  ),
                                )
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green), 

                                  ),
                                )
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green), 

                                  ),
                                )
                              )
                            ],
                          )
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green), 

                                  ),
                                )
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green), 

                                  ),
                                )
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green), 

                                  ),
                                )
                              )
                            ],
                          )
                        ),
                      ],
                    )
                  )
                ),
              ]
            )
          )
        ]
      )
    );
  }
}
