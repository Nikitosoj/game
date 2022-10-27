import 'package:flutter/material.dart';
import "package:english_words/english_words.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/screens/home_screens2.dart';
import 'models/event.dart';
import 'screens/home_screens.dart';
// ignore_for_file: prefer_const_constructors

class tap_tycon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My first wtf",
      home: HomeScreen2(),
    );
  }
}
