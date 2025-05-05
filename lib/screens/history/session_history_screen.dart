import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../models/session.dart';
import '../../models/round.dart';

class SessionHistoryScreen extends StatelessWidget {
  const SessionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionBox = Hive.box<Session>('sessions');
    final roundBox = Hive.box<Round>('rounds');

    return Scaffold(
      appBar: AppBar(title: const Text('Session History')),
      body: ListView(
        children: sessionBox.values.map((session) {
          final rounds = roundBox.values.where((r) => r.sessionId == session.key.toString());
          return ExpansionTile(
            title: Text(session.title),
            subtitle: Text('Rounds: ${rounds.length}'),
            children: rounds.map((round) {
              return ListTile(
                title: Text('Round: ${round.id}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Called: ${round.calledNumbers.length}'),
                    if (round.winners.isNotEmpty)
                      Text('Winners: ${round.winners.entries.map((e) => '${e.key} (${e.value.join(', ')})').join('; ')}')
                    else
                      const Text('No winners recorded'),
                  ],
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
