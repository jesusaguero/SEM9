import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: Routes.primeraPantalla,
      routes: {
        Routes.primeraPantalla: (context) => PrimeraPantalla(),
        Routes.segundaPantalla: (context) => SegundaPantalla(),
      },
    );
  }
}

class PrimeraPantalla extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: 'Ingrese texto',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.segundaPantalla,
                  arguments: _textFieldController.text,
                );
              },
              child: Text('Ir a la Segunda Pantalla'),
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String texto = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Texto ingresado:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              texto,
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
