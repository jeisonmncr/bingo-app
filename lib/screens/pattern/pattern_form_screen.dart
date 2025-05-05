import 'package:flutter/material.dart';

class PatternFormScreen extends StatelessWidget {
  const PatternFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Pattern')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Pattern Name')),
            SizedBox(height: 12),
            Text('Pattern grid selector goes here.'),
          ],
        ),
      ),
    );
  }
}
