import 'package:hive/hive.dart';
part 'session.g.dart';

@HiveType(typeId: 0)
class Session extends HiveObject {
  @HiveField(0)
  String id; // UUID

  @HiveField(1)
  String title;

  @HiveField(2)
  DateTime date;

  Session({required this.id, required this.title, required this.date});
}
