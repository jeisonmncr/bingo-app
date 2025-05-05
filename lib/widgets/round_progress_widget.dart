import 'package:flutter/material.dart';

class RoundProgressWidget extends StatelessWidget {
  final int totalCalled;
  final int totalBalls;
  final Map<String, List<String>> winners; // cardNumber -> patternNames

  const RoundProgressWidget({
    super.key,
    required this.totalCalled,
    required this.totalBalls,
    required this.winners,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: totalCalled / totalBalls,
          minHeight: 8,
        ),
        const SizedBox(height: 8),
        Text('Balls called: $totalCalled / $totalBalls',
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 12),
        if (winners.isNotEmpty) ...[
          Text('Winners:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          ...winners.entries.map((entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text('${entry.key} → ${entry.value.join(', ')}'),
              )),
        ] else
          const Text('No winners yet.'),
      ],
    );
  }
}
