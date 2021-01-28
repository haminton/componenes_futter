import 'package:flutter/material.dart';

class HomePageTem extends StatelessWidget {

  final operador = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componente tem'),
      ),
      body: ListView(
        //children: _crearItems()
        children: _crearItemsCorta()
      ),
    );
  }

  // List<Widget> _crearItems() {

  //   List<Widget> lista = new List<Widget>();

  //   for (var opt in operador) {
      
  //     final temWidget = ListTile(title: Text(opt),);

  //     lista..add( temWidget )
  //          ..add( Divider() );

  //   }

  //   return lista;

  // }

  List<Widget> _crearItemsCorta(){

    return operador.map(( item ) {

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('subtitle'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();

  }

}