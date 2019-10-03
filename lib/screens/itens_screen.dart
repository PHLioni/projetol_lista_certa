import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItensScreen extends StatelessWidget {
  final String itensId;

  final DocumentSnapshot listas;

  final String uid;

  ItensScreen({this.itensId, this.listas, this.uid});

  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            title: Text("${listas.data["nomeLista"]} - ${listas.data["data"]}"),            
            centerTitle: true,
          )),
      body: FutureBuilder<QuerySnapshot>(
        future: _firestore
            .collection("mercados")
            .document(uid)
            .collection("listas")
            .document(itensId)
            .collection("itens")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
              ),
            );
          return Column(
            children: snapshot.data.documents.map((map) {
              return Padding(
                padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                    ),
                    title: Text(
                      "${map.data["produto"]} | ${map.data["marca"]} - Total: R\$ ${map.data["valorTotal"]}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                        "Preço: ${map.data["preco"]} - Quantidade: ${map.data["quantidade"]}"),
                    onTap: () {},
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
