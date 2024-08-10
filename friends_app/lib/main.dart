import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const FriendsApp());
}

class FriendsApp extends StatelessWidget {
  const FriendsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meus amigos e amigas',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
