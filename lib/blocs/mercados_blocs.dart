import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';

class MercadosBloc extends BlocBase {
  final _mercadosController = BehaviorSubject<List>();

  Stream<List> get outMercados => _mercadosController.stream;

  Firestore _firestore = Firestore.instance;

  List<DocumentSnapshot> _mercados = [];

  MercadosBloc() {
    _addMercadosListener();
  }

  void _addMercadosListener() {
    _firestore.collection("mercados").snapshots().listen((snapshot) {
      snapshot.documentChanges.forEach((change) {
        String mid = change.document.documentID;

        switch (change.type) {
          case DocumentChangeType.added:
            _mercados.add(change.document);
            break;
          case DocumentChangeType.modified:
            _mercados.removeWhere((mercado) => mercado.documentID == mid);
            _mercados.add(change.document);
            break;
          case DocumentChangeType.removed:
            _mercados.removeWhere((mercado) => mercado.documentID == mid);
            break;
        }
      });

      _mercadosController.add(_mercados);
    });
  }

  @override
  void dispose() {
    _mercadosController.close();
  }
}
