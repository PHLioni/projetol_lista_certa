import 'package:flutter/material.dart';
import 'package:listacerta/model/user_model.dart';
import 'package:listacerta/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lista Certa',
          theme: ThemeData(
            backgroundColor: Colors.grey[850],
            primaryColor: Colors.blueAccent,
          ),
          home: LoginScreen()),
    );
  }
}
