import 'package:hive/hive.dart';
part 'pattern.g.dart';

@HiveType(typeId: 3)
class Pattern extends HiveObject {
  @HiveField(0)
  String id; // UUID

  @HiveField(1)
  String name;

  @HiveField(2)
  List<List<bool>> mask; // 5x5 pattern mask

  Pattern({required this.id, required this.name, required this.mask}) {
    if (mask.length != 5 || mask.any((row) => row.length != 5)) {
      throw ArgumentError('Mask must be 5x5');
    }
  }
}
