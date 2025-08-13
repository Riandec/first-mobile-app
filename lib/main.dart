import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

// stl+enter
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Traffic Light', style: TextStyle(color: Colors.white)),
      //   backgroundColor: Colors.black,
      // ),

      /*
      // Exercise I.
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              'Hello, Pitchaya Pimmahasiri, 650710572',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            )
          )
        )
      ) 
      */

      /*
      // Exercise II.
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Container(width: 100, height: 100, color: Colors.red),
              SizedBox(width: 20),
              Container(width: 100, height: 100, color: Colors.green),
              SizedBox(width: 20),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Container(height: 100, color: Colors.yellow),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Container(height: 100, color: Colors.purple),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
      */

      /*
      // Exercise III.
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 120,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                )
              )
            ),
            Positioned(
              top: 110,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                )
              )
            ),
            Positioned(
              top: 200,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                )
              )
            ),
          ]
        )
      )
      */

      body: Center(
        child: Image.asset(
          'tartaglia.png'
        ),
      ),
    );
  }
}
