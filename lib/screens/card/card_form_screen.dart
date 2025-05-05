import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../models/bingo_card.dart';
import '../../models/round.dart';

class CardFormScreen extends StatefulWidget {
  final BingoCard? existingCard;
  const CardFormScreen({super.key, this.existingCard});

  @override
  State<CardFormScreen> createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  final _cardNumberController = TextEditingController();
  bool isUsedInRound = false;

  @override
  void initState() {
    super.initState();
    if (widget.existingCard != null) {
      _cardNumberController.text = widget.existingCard!.cardNumber;
      checkIfUsedInRound(widget.existingCard!);
    }
  }

  Future<void> checkIfUsedInRound(BingoCard card) async {
    final roundBox = Hive.box<Round>('rounds');
    for (final round in roundBox.values) {
      if (round.calledNumbers.isNotEmpty &&
          round.activeCardIds.contains(card.key.toString())) {
        setState(() {
          isUsedInRound = true;
        });
        break;
      }
    }
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.existingCard == null ? 'New Bingo Card' : 'Edit Card')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cardNumberController,
              decoration: const InputDecoration(labelText: 'Card Number'),
              enabled: !isUsedInRound,
            ),
            const SizedBox(height: 12),
            Text(isUsedInRound
                ? 'This card is in use in a started round and cannot be edited.'
                : 'Grid entry form goes here.'),
          ],
        ),
      ),
    );
  }
}
