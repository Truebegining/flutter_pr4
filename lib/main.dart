import 'package:flutter/material.dart';

import 'screen_first/fragment1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Практическая работа',
      home: Fragment1(),
    );
  }
}
