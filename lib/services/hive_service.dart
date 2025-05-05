import 'package:hive_flutter/hive_flutter.dart';
import '../models/session.dart';
import '../models/bingo_card.dart';
import '../models/round.dart';
import '../models/pattern.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SessionAdapter());
    Hive.registerAdapter(BingoCardAdapter());
    Hive.registerAdapter(RoundAdapter());
    Hive.registerAdapter(PatternAdapter());
  }

  static Box<Session> getSessionBox() => Hive.box<Session>('sessions');
  static Box<BingoCard> getCardBox() => Hive.box<BingoCard>('cards');
  static Box<Round> getRoundBox() => Hive.box<Round>('rounds');
  static Box<Pattern> getPatternBox() => Hive.box<Pattern>('patterns');
}
