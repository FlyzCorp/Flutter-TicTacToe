import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/pages/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xFF1A1423),
        scaffoldBackgroundColor: const Color(0xFF1A1423),
      ),
      home: const Scaffold(body: GameScreen()),
    );
  }
}
