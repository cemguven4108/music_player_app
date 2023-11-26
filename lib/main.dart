import 'package:flutter/material.dart';
import 'package:music_player_app/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: const HomeScreen(),
  ));
}
