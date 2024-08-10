import 'package:flutter/material.dart';

class ItemCounter extends StatefulWidget {
  final String name;
  const ItemCounter(this.name, {super.key});

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
      },
      child: Text(
        '${widget.name}: $count',
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}
