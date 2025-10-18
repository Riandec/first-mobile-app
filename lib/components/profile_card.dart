import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name, position, email, phoneNumber, imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
            ),
          ),
          Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text(position, style: TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, color: Colors.blue),
              SizedBox(width: 5),
              Text(email)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.green),
              SizedBox(width: 5),
              Text(phoneNumber)
            ],
          ),
        ],
      )
    );
  }
}
