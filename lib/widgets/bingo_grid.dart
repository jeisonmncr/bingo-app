import 'package:flutter/material.dart';

class BingoGrid extends StatelessWidget {
  final List<List<int?>> grid;
  final Set<int> calledNumbers;
  final void Function(int row, int col)? onTap;

  const BingoGrid({
    super.key,
    required this.grid,
    required this.calledNumbers,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: List.generate(5, (row) {
        return TableRow(
          children: List.generate(5, (col) {
            final number = grid[row][col];
            final isMarked = number == null || calledNumbers.contains(number);
            final isCenter = row == 2 && col == 2;
            return GestureDetector(
              onTap: () => onTap?.call(row, col),
              child: Container(
                height: 48,
                alignment: Alignment.center,
                color: isMarked ? Colors.green.withOpacity(0.5) : null,
                child: Text(
                  isCenter ? '★' : (number?.toString() ?? ''),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
