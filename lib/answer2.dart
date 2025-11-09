import 'package:flutter/material.dart';

class Answer2 extends StatelessWidget {
  const Answer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Concert Ticket'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flutter Live',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Band: The Widgets'),
                          Text('Date: 8 NOV 2025'),
                          Text('Gate: 7'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 180,
                      color: Colors.grey.shade700,
                      child: Icon(Icons.qr_code, color: Colors.white, size: 50),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0, bottom: 0, left: 210,
                child: Icon(Icons.more_vert, color: Colors.white)
              )
            ],
          ),
        ),
      ),
    );
  }
}
