import 'package:flutter/material.dart';

main(){
  runApp(
    const Center(
      child: Text(
        'Olá, Pessoal!',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
    ),
  );
}