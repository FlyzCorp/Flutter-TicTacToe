import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/defaultTheme.dart';
import 'package:tictactoe/pages/game.dart';
import 'package:tictactoe/pages/home.dart';

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
      theme: defaultTheme,
      home: const Scaffold(body: Home()),
    );
  }
}
