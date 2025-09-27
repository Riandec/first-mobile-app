import 'package:flutter/material.dart';

class AqiDisplay {
  late final String level, imagePath;
  late final LinearGradient color;

  AqiDisplay (int aqiValue){
    if (aqiValue <= 50) {
      level = 'Good';
      imagePath = '../assets/images/good.png';
      color = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 189, 255, 131), Color.fromARGB(255, 255, 255, 255)]     );
    } else if (aqiValue <= 100) {
      level = 'Moderate';
      imagePath = '../assets/images/moderate.png';
      color = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 255, 239, 116), Color.fromARGB(255, 255, 255, 255)]
      );
    } else if (aqiValue <= 150) {
      level = 'Unhealthy for Sensitive Groups';
      imagePath = '../assets/images/unhealthy-for-sensitive-groups.png';
      color = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 255, 194, 109), Color.fromARGB(255, 255, 255, 255)]
      );
    } else if (aqiValue <= 200) {
      level = 'Unhealthy';
      imagePath = '../assets/images/unhealthy.png';
      color = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 255, 137, 153), Color.fromARGB(255, 255, 255, 255)]
      );
    } else if (aqiValue <= 300) {
      level = 'Very Unhealthy';
      imagePath = '../assets/images/very-unhealthy.png';
      color = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 215, 146, 225), Color.fromARGB(255, 255, 255, 255)]
      );
    } else {
      level = 'Hazardous';
      imagePath = '../assets/images/hazardous.png';
      color = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 206, 135, 172), Color.fromARGB(255, 255, 255, 255)]
      );
    } 
  }
}