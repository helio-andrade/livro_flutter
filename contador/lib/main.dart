import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Livro sobre Flutter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nosso aplicativo',),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Vezes que o botão foi apertado',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.add_box, color: Colors.white),
                      onPressed: () {
                        alert('Adicionei qualquer coisa');
                      }),
                  IconButton(
                      icon: const Icon(Icons.add_a_photo, color: Colors.white),
                      onPressed: () {
                        alert('Adicionei uma foto');
                      })
                ],
              ),
            )),
      ),
    );
  }
}

void alert(String message) {
  // ignore: avoid_print
  print(message);
}
