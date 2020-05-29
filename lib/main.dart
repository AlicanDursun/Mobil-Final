import 'package:flutter/material.dart';
import 'package:onlinehaber/anasayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TR Haber',
        theme: ThemeData(primaryColor: Color(0xFFFE0000)),
        home: Anasayfa());
  }
}
