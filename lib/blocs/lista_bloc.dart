import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ListaBLoc extends BlocBase {
  final _listaCompras = BehaviorSubject<List>();
  final _nomeLista = BehaviorSubject<String>();

  Stream<List> get outListaCompras => _listaCompras.stream;
  Stream<String> get outNomeLista => _nomeLista.stream;

  Firestore _firestore = Firestore.instance;

  List<DocumentSnapshot> _listasUser = [];


  ListaBLoc() {
    _getListas();
    _criaLista();
  }

  void _getListas() {}

  void _criaLista(){}


  @override
  void dispose() {
    _listaCompras.close();
    _nomeLista.close();
  }
}
