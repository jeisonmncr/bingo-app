import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/l10n.dart';

// Screens
import 'screens/session/session_list_screen.dart';
import 'screens/session/session_form_screen.dart';
import 'screens/card/card_list_screen.dart';
import 'screens/card/card_form_screen.dart';
import 'screens/round/round_list_screen.dart';
import 'screens/round/round_form_screen.dart';
import 'screens/pattern/pattern_list_screen.dart';
import 'screens/pattern/pattern_form_screen.dart';
import 'screens/history/session_history_screen.dart';
import 'screens/round/round_play_screen.dart';

void main() {
  runApp(const BingoApp());
}

class BingoApp extends StatelessWidget {
  const BingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bingo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/history': (context) => const SessionHistoryScreen(),
        '/round/play': (context) => const RoundPlayScreen(),
        '/': (context) => const SessionListScreen(),
        '/session/new': (context) => const SessionFormScreen(),
        '/card/list': (context) => const CardListScreen(),
        '/card/new': (context) => const CardFormScreen(),
        '/round/list': (context) => const RoundListScreen(),
        '/round/new': (context) => const RoundFormScreen(),
        '/pattern/list': (context) => const PatternListScreen(),
        '/pattern/new': (context) => const PatternFormScreen(),
      },
    );
  }
}
