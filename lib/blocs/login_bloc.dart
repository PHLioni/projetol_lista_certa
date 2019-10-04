import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:listacerta/validators/login_validators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

enum LoginState { IDLE, LOADING, SUCCESS, FAIL }

class LoginBloc extends BlocBase with LoginValidators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();
  

  Stream<String> get outEmail =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword =>
      _passwordController.stream.transform(validatePass);
  Stream<LoginState> get outState => _stateController.stream;

  Stream<bool> get outSubmitValid =>
      Observable.combineLatest2(outEmail, outPassword, (a, b) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passwordController.sink.add;

  StreamSubscription _subscription;

  LoginBloc() {
    _subscription = FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user != null) {
        _stateController.add(LoginState.SUCCESS);
      } else {
        _stateController.add(LoginState.IDLE);
      }
    });
  }

  void submit() {
    final email = _emailController.value;
    final pass = _passwordController.value;

    _stateController.add(LoginState.LOADING);

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .catchError((e) {
      _stateController.add(LoginState.FAIL);
    });
  }

  logOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _stateController.close();
    _subscription.cancel();
  }
}
