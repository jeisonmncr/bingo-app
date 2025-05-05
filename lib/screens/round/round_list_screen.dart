import 'package:flutter/material.dart';

class RoundListScreen extends StatelessWidget {
  const RoundListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rounds')),
      body: const Center(child: Text('List of rounds will appear here.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/round/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
