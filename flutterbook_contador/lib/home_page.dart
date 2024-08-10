import 'package:flutter/material.dart';
import 'item_counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Cor de fundo da AppBar
        title: const Center(
          child: Text(
            'Contador de cliques',
            style: TextStyle(
              color: Colors.white, // Cor personalizada para o título
              fontSize: 20, // Ajuste o tamanho da fonte conforme necessário
            ),
          ),
        ),
        elevation: 0, // Remove a sombra para melhor visualização
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemCounter('Cliques'),
          ],
        ),
      ),
    );
  }
}
