import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listacerta/blocs/mercados_blocs.dart';
import 'package:listacerta/blocs/mercados_list_bloc.dart';

class CriaListaScreen extends StatefulWidget {
  @override
  _CriaListaScreenState createState() => _CriaListaScreenState();
}

class _CriaListaScreenState extends State<CriaListaScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  var selected;

  MercadosBloc _mercadosBloc2;

  @override
  void initState() {
    super.initState();
    _mercadosBloc2 = MercadosBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _mercadosBloc = BlocProvider.of<MercadosListBloc>(context);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
              automaticallyImplyLeading: false, // hides leading widget
              title: Text("Criar Lista"),
              centerTitle: true,
            )),
        body: BlocProvider<MercadosBloc>(
          bloc: _mercadosBloc2,
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nome da Lista",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.store,
                      size: 30.0,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    StreamBuilder<List>(
                      stream: _mercadosBloc.outMercados,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          Text("Carregando");
                        } else {
                          List<DropdownMenuItem> mercados = [];
                          for (int i = 0; i < snapshot.data.length; i++) {
                            DocumentSnapshot snap = snapshot.data[i];
                            mercados.add(DropdownMenuItem(
                              child: Text(
                                snap.data["nomeMercado"],
                                style: TextStyle(color: Colors.black),
                              ),
                              value: "${snap.data["nomeMercado"]}",
                            ));
                          }
                          return DropdownButton(
                            items: mercados,
                            onChanged: (selecionado) {
                              setState(() {
                                selected = selecionado;
                              });
                            },
                            value: selected,
                            isExpanded: false,
                            hint: Text("Escolha o mercado"),
                          );
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
