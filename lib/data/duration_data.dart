import 'package:flutter/material.dart';
import 'package:pocus/models/duration_model.dart';

final List<Duration> duration = [
  Duration(
      text: "Easy",
      lessons: "25 mins focus, 5 mins break",
      imageUrl: "assets/images/pic/s5.png",
      percent: 20.1,
      backImage: "assets/images/box/box1.png",
      timer: 1500.0),
  Duration(
      text: "Medium",
      lessons: "60 mins focus, 10 mins break",
      imageUrl: "assets/images/pic/s3.png",
      percent: 50,
      backImage: "assets/images/box/box2.png",
      timer: 3600.0),
  Duration(
      text: "Hard",
      lessons: "90 mins focus, 20 mins break",
      imageUrl: "assets/images/pic/s6.png",
      percent: 75,
      backImage: "assets/images/box/box3.png",
      timer: 5400.0),
  Duration(
      text: "Super Pocus",
      lessons: "120 mins focus, 30 mins break",
      imageUrl: "assets/images/pic/s4.png",
      percent: 100,
      backImage: "assets/images/box/box4.png",
      timer: 7200.0),
];
