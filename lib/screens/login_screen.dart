import 'package:flutter/material.dart';
import 'package:listacerta/blocs/login_bloc.dart';
import 'package:listacerta/screens/home_page.dart';
import 'package:listacerta/widgets/login_widget.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case LoginState.FAIL:
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Erro"),
                    content: Text("Você não está cadastrado!"),
                  ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.LOADING,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blueAccent)),
                );
              case LoginState.FAIL:
              case LoginState.SUCCESS:
              case LoginState.IDLE:
                return Stack(
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
                                  child:InkWell(
                            child: Container(                              
                              width: 330,
                              height: 100,
                              decoration: snapshot.hasData ? BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.blueAccent,
                                    Colors.blue[200]
                                  ]),
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xFF6078ea).withOpacity(.3),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 8.0)
                                  ]): BoxDecoration(
                                  
                                  color: Colors.grey[600],
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Colors.grey.withOpacity(.3),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 8.0)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap:  snapshot.hasData
                                        ? _loginBloc.submit
                                        : null,                                      
                                  child: Center(
                                    child: Text(
                                      "Entrar",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
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
                );
            }
          },
        ));
  }
}
