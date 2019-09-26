import 'package:flutter/material.dart';

class AddMercadoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            title: Text("Adicionar Mercado"),
            centerTitle: true,
          )),
          body: Padding(
            padding: EdgeInsets.only(right: 16, left: 16, top: 16),
            child:  Column(            
            children: <Widget>[
              TextField(        
                decoration: InputDecoration(
                  hoverColor: Colors.blue,                  
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Nome do Mercado"
                ),
              )
            ],
          ),
          )

    );
  }
}