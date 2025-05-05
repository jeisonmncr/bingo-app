import 'package:flutter/material.dart';

class SessionListScreen extends StatelessWidget {
  const SessionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sessions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'View History',
            onPressed: () => Navigator.pushNamed(context, '/history'),
          ),
        ],
      ),
      body: const Center(child: Text('List of sessions will appear here.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/session/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
