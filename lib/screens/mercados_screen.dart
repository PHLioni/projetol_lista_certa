import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:listacerta/blocs/mercados_blocs.dart';
import 'package:listacerta/widgets/mercados_tile.dart';

class MercadosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _backgroundColor = Theme.of(context).backgroundColor;

    final _mercadosBloc = BlocProvider.of<MercadosBloc>(context);

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            title: Text("Mercados"),
            centerTitle: true,
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: StreamBuilder<List>(
            stream: _mercadosBloc.outMercados,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                  ),
                );
              } else if (snapshot.data.length == 0) {
                return Center(
                  child: Text("Nenhum mercado cadastrado!",
                      style: TextStyle(color: Colors.blueAccent)),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return MercadosTile(snapshot.data[index]);
                },
                itemCount: snapshot.data.length,
              );
            },
          )),
    );
  }
}
