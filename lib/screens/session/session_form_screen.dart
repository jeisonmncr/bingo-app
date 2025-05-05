import 'package:flutter/material.dart';

class SessionFormScreen extends StatelessWidget {
  const SessionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Session')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Title')),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'Date')),
          ],
        ),
      ),
    );
  }
}
