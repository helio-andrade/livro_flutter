import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus amigos e amigas'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildWelcomeBox('Bem-vindo ao app de amigos e amigas de Hélio Jr.!'),
              const SizedBox(height: 20),
              buildWelcomeBox('Explore e conheça novos amigos!'),
              const SizedBox(height: 20),
              buildWelcomeBox('Josi'),
              const SizedBox(height: 20),
              buildWelcomeBox('Helena'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWelcomeBox(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
