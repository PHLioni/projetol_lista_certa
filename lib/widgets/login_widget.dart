import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;

  LoginWidget({this.icon, this.hint, this.obscure, this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
                icon: Icon(icon, color: Colors.white),
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)),
                contentPadding:
                    EdgeInsets.only(left: 5, right: 30, top: 30, bottom: 20),
                errorText: snapshot.hasError ? snapshot.error : null),
            style: TextStyle(
              color: Colors.white,
            ),
            obscureText: obscure,
          );
        });
  }
}
