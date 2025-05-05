// Consolidated canvas screens file from Project Structure canvas

// --- session_list_screen.dart ---
import 'package:flutter/material.dart';

class SessionListScreen extends StatelessWidget {
  const SessionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sessions')),
      body: const Center(child: Text('List of sessions will appear here.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/session/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// --- session_form_screen.dart ---
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

// --- card_list_screen.dart ---
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

// --- card_form_screen.dart ---
class CardFormScreen extends StatelessWidget {
  const CardFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Bingo Card')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Card Number')),
            SizedBox(height: 12),
            Text('Grid entry form goes here.'),
          ],
        ),
      ),
    );
  }
}

// --- round_list_screen.dart ---
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

// --- round_form_screen.dart ---
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

// --- pattern_list_screen.dart ---
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

// --- pattern_form_screen.dart ---
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
