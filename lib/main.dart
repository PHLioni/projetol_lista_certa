import 'package:flutter/material.dart';
import 'package:listacerta/screens/login_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista Certa',
        theme: ThemeData(
          backgroundColor: Colors.grey[850],
          primaryColor: Colors.blueAccent,
        ),
        home: LoginScreen());
  }
}
