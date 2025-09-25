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
      var response = await http.get(
        Uri.parse(
          'https://api.waqi.info/feed/here/?token=6098441d02eb4e942e7af57172aa969162c67982',
        ),
      );
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
        print(
          'Status code: ${response.statusCode} Response body: ${response.body}',
        );
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
          Container(height: 30, decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_pin),
                  SizedBox(width: 5),
                  Text('${aqiData?.city}', style: TextStyle(fontSize: 20))
                ],
              )
            )
          ),
          SizedBox(height: 30),
          Container(height: 200, width: 400, decoration: BoxDecoration(border: Border.all(color: Colors.green))),
          SizedBox(height: 30),
          Container(height: 200, width: 400, decoration: BoxDecoration(border: Border.all(color: Colors.blue))),
        ],
      ),
    );
  }
}
