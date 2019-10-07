import 'package:flutter/material.dart';
import 'package:listacerta/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _fomrKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
              automaticallyImplyLeading: false, // hides leading widget
              title: Text("Cadastro"),
              centerTitle: true,
            )),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.carregando)
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                ),
              );
            return Form(
              key: _fomrKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      hintText: "Nome Completo",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (text) {
                      if (text.isEmpty) {
                        return "Nome Inválido!";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@")) {
                        return "E-mail Inválido!";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _senhaController,
                    decoration: InputDecoration(
                      hintText: "Senha",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (text) {
                      if (text.isEmpty || text.length < 6) {
                        return "Senha deve conter no minimo 6 digitos!";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Poppins-Bold",
                            color: Colors.white),
                      ),
                      onPressed: () {
                        if (_fomrKey.currentState.validate()) {
                          Map<String, dynamic> userData = {
                            "nomeUsuario": _nomeController.text,
                            "email": _emailController.text
                          };                          

                          model.cadastro(
                            userData: userData,
                            senha: _senhaController.text,
                            sucesso: _sucesso,
                            falhou: _falhou,
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  void _sucesso() {}

  void _falhou() {}
}
