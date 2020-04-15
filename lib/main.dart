import 'package:flutter/material.dart';
import 'package:flutter_food_ui_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'Oita',
        primaryColor: Color.fromRGBO(151, 205, 132, 1.0),
      ),
      home: HomeScreen(),
    );
  }
}
