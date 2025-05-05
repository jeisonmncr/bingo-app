import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bingo_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BingoApp());
    expect(find.text('Sessions'), findsOneWidget);
  });
}
