import 'package:flutter/material.dart';

class PatternSelector extends StatefulWidget {
  final List<List<bool>> initialMask;
  final void Function(List<List<bool>> mask) onChanged;

  const PatternSelector({
    super.key,
    required this.initialMask,
    required this.onChanged,
  });

  @override
  State<PatternSelector> createState() => _PatternSelectorState();
}

class _PatternSelectorState extends State<PatternSelector> {
  late List<List<bool>> mask;

  @override
  void initState() {
    super.initState();
    mask = List.generate(5, (i) => List.from(widget.initialMask[i]));
  }

  void toggle(int row, int col) {
    setState(() {
      mask[row][col] = !mask[row][col];
      widget.onChanged(mask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (col) {
            final active = mask[row][col];
            return GestureDetector(
              onTap: () => toggle(row, col),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.all(4),
                color: active ? Colors.blueAccent : Colors.grey[300],
                child: Center(
                  child: Text(
                    '${row + 1}${col + 1}',
                    style: TextStyle(color: active ? Colors.white : Colors.black),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
