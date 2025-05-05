import 'package:hive/hive.dart';
part 'round.g.dart';

@HiveType(typeId: 2)
class Round extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String sessionId;

  @HiveField(2)
  List<String> activeCardIds;

  @HiveField(3)
  List<String> patternIds;

  @HiveField(4)
  List<int> calledNumbers;

  @HiveField(5)
  bool isPaused;

  @HiveField(6)
  Map<String, List<String>> winners; // cardNumber -> matched patterns

  Round({
    required this.id,
    required this.sessionId,
    required this.activeCardIds,
    required this.patternIds,
    this.calledNumbers = const [],
    this.isPaused = false,
    this.winners = const {},
  });
}
