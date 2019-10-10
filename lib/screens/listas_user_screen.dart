import 'package:flutter/material.dart';
import 'package:listacerta/widgets/cria_lista_screen.dart';

class ListasUserScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nomeListaController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
              automaticallyImplyLeading: false, // hides leading widget
              title: Text("Listas de Compras"),
              centerTitle: true,
            )),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.playlist_add),
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CriaListaScreen()));
          },
        ));
  }

}