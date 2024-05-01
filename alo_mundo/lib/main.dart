import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu de navegação',
          onPressed: null,
        ),
        title: const Text('Exemplo de título'),
        actions: const <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Buscar',
            onPressed: null,
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Olá, mundo!",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Adicionar',
        onPressed: null,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
