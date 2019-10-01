import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;

  LoginWidget({this.icon, this.hint, this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent)
              ),
              contentPadding: EdgeInsets.only(
                left: 5,
                right: 30,
                top: 30,
                bottom: 20
              )
            ),
           style: TextStyle(color: Colors.white,),
           obscureText: obscure,
    );
  }
}
