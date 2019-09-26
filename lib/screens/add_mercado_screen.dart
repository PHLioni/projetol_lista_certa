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
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome do Mercado",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
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
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Numero",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),                    
                  ),
                  SizedBox(                    
                    width: 200.0,
                    child: TextField(
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
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Estado",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ));
  }
}
