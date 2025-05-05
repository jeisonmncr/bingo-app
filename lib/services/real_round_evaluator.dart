import 'package:hive/hive.dart';
import '../models/bingo_card.dart';
import '../models/pattern.dart';
import 'game_logic_service.dart';

class RealRoundEvaluator {
  static Future<Map<String, List<String>>> evaluateWinners({
    required List<int> calledNumbers,
  }) async {
    final cardBox = Hive.box<BingoCard>('cards');
    final patternBox = Hive.box<Pattern>('patterns');
    final winners = <String, List<String>>{};
    final calledSet = Set<int>.from(calledNumbers);

    for (final card in cardBox.values) {
      final matched = GameLogicService.checkWinningPatterns(
        card: card,
        patterns: patternBox.values.toList(),
        calledNumbers: calledSet,
      );

      if (matched.isNotEmpty) {
        winners[card.cardNumber] = matched;
      }
    }

    return winners;
  }
}
