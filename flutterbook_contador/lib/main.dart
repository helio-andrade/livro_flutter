import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contador',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
