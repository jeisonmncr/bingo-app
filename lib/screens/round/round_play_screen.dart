import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../models/round.dart';
import '../../services/real_round_evaluator.dart';
import '../../widgets/round_progress_widget.dart';

class RoundPlayScreen extends StatefulWidget {
  const RoundPlayScreen({super.key});

  @override
  State<RoundPlayScreen> createState() => _RoundPlayScreenState();
}

class _RoundPlayScreenState extends State<RoundPlayScreen> {
  final TextEditingController _numberController = TextEditingController();
  final Set<int> calledNumbers = {};
  final int totalBalls = 75;
  Map<String, List<String>> winners = {};
  Round? currentRound;

  @override
  void initState() {
    super.initState();
    loadCurrentRound();
  }

  void loadCurrentRound() {
    final box = Hive.box<Round>('rounds');
    if (box.isNotEmpty) {
      currentRound = box.values.last;
      calledNumbers.addAll(currentRound!.calledNumbers);
      winners = currentRound!.winners;
    }
  }

  Future<void> callNumber(String value) async {
    final number = int.tryParse(value);
    if (number == null || number < 1 || number > 75 || calledNumbers.contains(number)) {
      _numberController.clear();
      return;
    }

    setState(() {
      calledNumbers.add(number);
      _numberController.clear();
    });

    final detectedWinners = await RealRoundEvaluator.evaluateWinners(
      calledNumbers: calledNumbers.toList(),
    );

    setState(() {
      winners = detectedWinners;
    });

    if (currentRound != null) {
      currentRound!.calledNumbers = calledNumbers.toList();
      currentRound!.winners = winners;
      await currentRound!.save();
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalCalled = calledNumbers.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Live Round')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RoundProgressWidget(
              totalCalled: totalCalled,
              totalBalls: totalBalls,
              winners: winners,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              autofocus: true,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Enter called number',
                border: OutlineInputBorder(),
              ),
              onSubmitted: callNumber,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: calledNumbers
                  .map((n) => Chip(label: Text('$n')))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
