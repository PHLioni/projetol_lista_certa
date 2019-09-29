import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListasScreen extends StatelessWidget {
  final String uid;
  final DocumentSnapshot mercado;
  ListasScreen({this.uid, this.mercado});

  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
              automaticallyImplyLeading: false, // hides leading widget
              title: Text("${mercado.data["nomeMercado"]} - ${mercado.data["cidade"]}"),
              centerTitle: true,
            )),
        body: Column(
          children: <Widget>[
            FutureBuilder<QuerySnapshot>(
              future: _firestore
                  .collection("mercados")
                  .document(uid)
                  .collection("listas")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
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
                              "${map.data["data"]} - ${map.data["hora"]}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          onTap: () {},
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ));
  }
}
