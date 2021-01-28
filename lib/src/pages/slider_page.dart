import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 10.0;
  bool _valorCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            )
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigo,
      //divisions: 10,
      label: 'Tamano de la imagen',
      value: _valorSlider,
      min: 10.0,
      max: 400.0, 
      onChanged: (_valorCheck) ? null : (value) {
        setState(() {
          _valorSlider = value;
        });
      }
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    //   value: _valorCheck, 
    //   onChanged: (value) {
    //     setState(() {
    //       _valorCheck = value;
    //     });
    //   }
    // );

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _valorCheck, 
      onChanged: (value) {
        setState(() {
          _valorCheck = value;
        });
      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _valorCheck, 
      onChanged: (value) {
        setState(() {
          _valorCheck = value;
        });
      }
    );
  }


  Widget _crearImagen() {
    return Image(
      width: _valorSlider,
      image: NetworkImage('https://www.elcomercio.com/files/article_main/uploads/2019/03/29/5c9e3ddfc85ca.jpeg')
    );
  }
}