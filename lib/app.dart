import 'package:flutter/material.dart';

import 'home/views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Price Tracker',
      theme: ThemeData(
          primarySwatch: Colors.teal, scaffoldBackgroundColor: Colors.teal),
      home: const MyHomePage(),
    );
  }
}
