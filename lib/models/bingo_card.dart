import 'package:hive/hive.dart';
part 'bingo_card.g.dart';

@HiveType(typeId: 1)
class BingoCard extends HiveObject {
  @HiveField(0)
  String id; // UUID

  @HiveField(1)
  String sessionId;

  @HiveField(2)
  String cardNumber;

  @HiveField(3)
  List<List<int?>> grid;

  BingoCard({
    required this.id,
    required this.sessionId,
    required this.cardNumber,
    required this.grid,
  }) {
    _validateGrid();
  }

  void _validateGrid() {
    if (grid.length != 5 || grid.any((col) => col.length != 5)) {
      throw ArgumentError('Grid must be 5x5');
    }

    for (int row = 0; row < 5; row++) {
      for (int col = 0; col < 5; col++) {
        if (row == 2 && col == 2) continue; // Free center cell
        final number = grid[row][col];
        if (number == null) throw ArgumentError('Null value in grid');
        final range = _rangeForColumn(col);
        if (number < range[0] || number > range[1]) {
          throw ArgumentError('Number $number out of range for column $col');
        }
      }
    }

    final seen = <int>{};
    for (final row in grid) {
      for (final n in row) {
        if (n != null && !seen.add(n)) {
          throw ArgumentError('Duplicate number $n');
        }
      }
    }
  }

  List<int> _rangeForColumn(int col) {
    switch (col) {
      case 0: return [1, 15];
      case 1: return [16, 30];
      case 2: return [31, 45];
      case 3: return [46, 60];
      case 4: return [61, 75];
      default: throw ArgumentError('Invalid column');
    }
  }
}
