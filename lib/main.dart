import 'package:flutter/material.dart';

import 'LoginScreen.dart';
void main() {
  runApp(NovelApp());
}

class NovelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
