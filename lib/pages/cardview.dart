
import 'package:flutter/material.dart';

class homeAdmin extends StatelessWidget {

  static const MaterialColor blueMod = const MaterialColor(
    0xFF030D61,
    const <int, Color>{
      50: const Color(0xFF030D61),
      100: const Color(0xFF030D61),
      200: const Color(0xFF030D61),
      300: const Color(0xFF030D61),
      400: const Color(0xFF030D61),
      500: const Color(0xFF030D61),
      600: const Color(0xFF030D61),
      700: const Color(0xFF030D61),
      800: const Color(0xFF030D61),
      900: const Color(0xFF030D61),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Administrador',
      theme: ThemeData(
        primarySwatch: blueMod,
      ),
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Cardview en flutter'),
              subtitle: Text('Esto es una prueba para hacer un cardview.'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Aceptar'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('Cancelar'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}