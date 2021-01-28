import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumeros = new List();
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      
      //print('Scroll!!');
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista page'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(
          onRefresh: opterPagina1,
          child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listNumeros[index];
            return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage('https://i.picsum.photos/id/$imagen/500/400.jpg')
            );
          },
      ),
    );
  }

  Future<Null> opterPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listNumeros.clear();
      _ultimoNumero++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoNumero++;
      _listNumeros.add(_ultimoNumero);
    }

    setState(() {
      
    });
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duracion = new Duration(seconds: 2);

    return new Timer(duracion, respuestaHTTP);

  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn,
    );
    _agregar10();
  }

  Widget _crearLoading () {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 10.0,),
        ],
      );
    } else {
      return Container();
    }
  }
}