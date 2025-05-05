import '../models/bingo_card.dart';
import '../models/pattern.dart';

class GameLogicService {
  // Checks if a given bingo card matches any winning pattern based on called numbers
  static List<String> checkWinningPatterns({
    required BingoCard card,
    required List<Pattern> patterns,
    required Set<int> calledNumbers,
  }) {
    final matches = <String>[];
    for (final pattern in patterns) {
      if (_matchesPattern(card, pattern, calledNumbers)) {
        matches.add(pattern.name);
      }
    }
    return matches;
  }

  static bool _matchesPattern(
      BingoCard card, Pattern pattern, Set<int> calledNumbers) {
    for (int row = 0; row < 5; row++) {
      for (int col = 0; col < 5; col++) {
        if (pattern.mask[row][col]) {
          final number = card.grid[row][col];
          if (!(row == 2 && col == 2) && (number == null || !calledNumbers.contains(number))) {
            return false;
          }
        }
      }
    }
    return true;
  }
}
