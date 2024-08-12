import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    home: const HomePage(),
    theme: ThemeData(hintColor: Colors.green, primaryColor: Colors.white),
    debugShowCheckedModeBanner: false,
  ));
}
