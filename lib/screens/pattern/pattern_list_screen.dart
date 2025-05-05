import 'package:flutter/material.dart';

class PatternListScreen extends StatelessWidget {
  const PatternListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patterns')),
      body: const Center(child: Text('List of patterns will appear here.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/pattern/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
