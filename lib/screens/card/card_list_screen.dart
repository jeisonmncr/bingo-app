import 'package:flutter/material.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bingo Cards')),
      body: const Center(child: Text('List of cards will appear here.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/card/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
