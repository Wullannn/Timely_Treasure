import 'package:flutter/material.dart';
import 'package:jam/provider/provider.dart';
import 'package:provider/provider.dart';
// Import screens
import 'Secreen/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timely Treasure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomeScreen(), // Langsung menampilkan HomeScreen
    );
  }
}
