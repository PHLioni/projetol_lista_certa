import 'package:flutter/material.dart';
import 'package:listacerta/blocs/login_bloc.dart';
import 'package:listacerta/widgets/login_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      Icons.list,
                      color: Colors.blueAccent,
                      size: 160.0,
                    ),
                    LoginWidget(
                      icon: Icons.person_outline,
                      hint: "E-mail",
                      obscure: false,
                      stream: _loginBloc.outEmail,
                      onChanged: _loginBloc.changeEmail,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    LoginWidget(
                      icon: Icons.lock_outline,
                      hint: "Senha",
                      obscure: true,
                      stream: _loginBloc.outPassword,
                      onChanged: _loginBloc.changePass,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    StreamBuilder<bool>(
                      stream: _loginBloc.outSubmitValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          height: 50,
                          width: 300,
                          child: RaisedButton(
                            child: Text(
                              "Entrar",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            disabledColor: Colors.blueAccent.withAlpha(100),
                            onPressed: snapshot.hasData ? () {} : null,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: GestureDetector(
                        child: Text(
                          "Ainda não possue uma conta? Clique aqui!",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
