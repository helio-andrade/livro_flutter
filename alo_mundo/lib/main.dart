import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),

      // Barra
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff8b9ae7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),

        // Título da AppBar
        title: const Text(
          "Exemplo de Título",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xffffffff),
          ),
        ),
        leading: const Icon(
          Icons.menu,
          color: Color(0xffffffff),
          size: 24,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(Icons.search, color: Color(0xfffdfdff), size: 24),
        ],
      ),

      // Corpo
      body: const Center(
        child: Text('Olá, Mundo!'),
      ),

      // Botão flutuante
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar',
        onPressed: null,
        child: const Icon(Icons.add),
      ),
    );
  }
}
