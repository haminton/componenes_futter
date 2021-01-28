import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_utils.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {

        print('builder');
        print(snapshot.data);

        return ListView(
                children: _listItems( snapshot.data, context ),
              );
      },
    );

    
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context) {
    
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTem = ListTile(
        title: Text( opt['texto'] ),
        leading: getIcon( opt['icon'] ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue,),
        onTap: (){

          Navigator.pushNamed(context, opt['ruta']);
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage(),
          // );
          // Navigator.push(context, route);
        },
      );

      opciones..add(widgetTem)
              ..add(Divider());

    });

    return opciones;
    
  }
}