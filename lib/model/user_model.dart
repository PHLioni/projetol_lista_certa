import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _firebaseUser;
  Map<String, dynamic> userData = Map();

  bool carregando = false;

  void cadastro(
      {@required Map<String, dynamic> userData,
      @required String senha,
      @required VoidCallback sucesso,
      @required VoidCallback falhou}) {
    carregando = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: senha)
        .then((auth) async {
      _firebaseUser = auth.user;

      await _salvaUsuario(userData);

      sucesso();
      carregando = false;
      notifyListeners();
    }).catchError((e) {
      falhou();
      carregando = false;
      notifyListeners();
    });
  }

  void recuperarDados() {}

  Future<Null> _salvaUsuario(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection("usuarios")
        .document(_firebaseUser.uid)
        .setData(userData);
  }
}
