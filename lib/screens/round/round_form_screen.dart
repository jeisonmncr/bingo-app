import 'package:flutter/material.dart';

class RoundFormScreen extends StatelessWidget {
  const RoundFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Round')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Select cards, patterns and add called numbers.'),
          ],
        ),
      ),
    );
  }
}
