import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMercadoScreen extends StatefulWidget {
  @override
  _AddMercadoScreenState createState() => _AddMercadoScreenState();
}

class _AddMercadoScreenState extends State<AddMercadoScreen> {
  final _nomeMercadoController = TextEditingController();

  final _enderecoController = TextEditingController();

  final _numeroMercadoController = TextEditingController();

  final _cidadeMercadoController = TextEditingController();

  final _estadoMercadoController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
              automaticallyImplyLeading: false, // hides leading widget
              title: Text("Adicionar Mercado"),
              centerTitle: true,
            )),
        body: Padding(
            padding: EdgeInsets.only(right: 16, left: 16, top: 30),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _nomeMercadoController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome do Mercado",
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _enderecoController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Endereço",                        
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 100.0,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: _numeroMercadoController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Numero",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        width: 200.0,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _cidadeMercadoController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Cidade",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _estadoMercadoController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Estado",
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: Text("Cadastrar", style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        String _nomeMercado = _nomeMercadoController.text;
                        String _endereco = _enderecoController.text;
                        String _numero = _numeroMercadoController.text;
                        String _cidade = _cidadeMercadoController.text;
                        String _estado = _estadoMercadoController.text;
                        _saveMercados(
                            _nomeMercado.toUpperCase(), _endereco, _numero, _cidade, _estado);
                      },
                    ),
                  )
                ],
              ),
            )));
  }

  void _saveMercados(String nomeMercado, String endereco, String numero,
      String cidade, String estado) {
    if (_nomeMercadoController.text != "") {
      Firestore.instance.collection("mercados").document().setData({
        "nomeMercado": nomeMercado,
        "endereco": endereco,
        "numero": numero,
        "cidade": cidade,
        "estado": estado
      });
      snackConfirm();
    }
  }

  void snackConfirm() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Mercado Cadastrado com Sucesso!",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blueAccent,
      duration: Duration(seconds: 10),
      action: SnackBarAction(
        label: "Voltar",
        textColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ));
    _nomeMercadoController.text = "";
    _enderecoController.text = "";
    _numeroMercadoController.text = "";
    _cidadeMercadoController.text = "";
    _estadoMercadoController.text = "";
  }
}
