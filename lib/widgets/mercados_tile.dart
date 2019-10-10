import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listacerta/screens/listas_screen.dart';

class MercadosTile extends StatelessWidget {
  final DocumentSnapshot mercado;

  MercadosTile(this.mercado);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        child: ExpansionTile(
          title: Text(
            "${mercado.data["nomeMercado"]} - ${mercado.data["endereco"]} - ${mercado.data["cidade"]}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[                 
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                          "${mercado.data["endereco"]} - n° ${mercado.data["numero"]} ${mercado.data["estado"]}"),
                      FlatButton(
                        child: Text("Ver Listas"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListasScreen(uid: mercado.documentID, mercado: mercado)));
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
