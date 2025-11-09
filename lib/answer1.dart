import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comment Thread')),
      body: Card(
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // main comment
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 24, child: Text('A')),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User A',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'This is the main comment. Flutter layouts are fun!',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // tools
              Row(
                children: [
                  Icon(Icons.thumb_up_alt_outlined, size: 18),
                  Text('12'),
                  SizedBox(width: 20),
                  Icon(Icons.comment_outlined, size: 18),
                  Text('Reply'),
                  Spacer(), // ดันข้อความถัดไปให้ชิดขวา
                  Text('1h ago', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 15),
              // reply
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 18, child: Text('B')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User B',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('I agree!'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
