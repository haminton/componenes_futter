import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://dam.menshealthlatam.com/wp-content/uploads/2018/11/STANLEE.jpg'),
              radius: 23.0,
            ),
          ),

          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('St'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://as.com/meristation/imagenes/2018/11/12/noticia/1542053880_906934_1542962110_sumario_normal.jpeg'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}