import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';

class MercadosListBloc extends BlocBase {
  final _mercadosListController = BehaviorSubject<List>();

  Stream<List> get outMercados => _mercadosListController.stream;

  Firestore _firestore = Firestore.instance;

  List<DocumentSnapshot> _mercadosList = [];

  MercadosListBloc() {
    _addMercadosListListener();
  }

  void _addMercadosListListener() {
    _firestore.collection("mercados").snapshots().listen((snapshot) {
      snapshot.documentChanges.forEach((change) {
        String mid = change.document.documentID;

        switch (change.type) {
          case DocumentChangeType.added:
            _mercadosList.add(change.document);
            break;
          case DocumentChangeType.modified:
            _mercadosList.removeWhere((mercado) => mercado.documentID == mid);
            _mercadosList.add(change.document);
            break;
          case DocumentChangeType.removed:
            _mercadosList.removeWhere((mercado) => mercado.documentID == mid);
            break;
        }
      });

      _mercadosListController.add(_mercadosList);
    });
  }

  @override
  void dispose() {
    _mercadosListController.close();
  }
}
