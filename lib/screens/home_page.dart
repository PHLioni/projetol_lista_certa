import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:listacerta/blocs/mercados_blocs.dart';
import 'package:listacerta/screens/mercados_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _page = 0;

  MercadosBloc _mercadosBloc;


  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _mercadosBloc = MercadosBloc();
  
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.blueAccent,
                primaryColor: Colors.white,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: TextStyle(color: Colors.white54))),
            child: BottomNavigationBar(
              currentIndex: _page,
              onTap: (p) {
                _pageController.animateToPage(p,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.store), title: Text("Minhas Compras")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.view_list), title: Text("Listas")),
              ],
            )),
        body: SafeArea(
            child: BlocProvider<MercadosBloc>(
          bloc: _mercadosBloc,
          child: PageView(
            controller: _pageController,
            onPageChanged: (p) {
              setState(() {
                _page = p;
              });
            },
            children: <Widget>[Container(color: Colors.red), MercadosScreen()],
          ),
        )));
  }
}
