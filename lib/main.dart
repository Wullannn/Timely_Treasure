import 'package:flutter/material.dart';
import 'package:jamm/screens/signin_screen.dart';
import 'package:jamm/screens/checkout_screen.dart';
import 'package:jamm/screens/favorit_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timle Treasure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: CheckoutScreen(),
      // home: FavoritScreen(),
      // home: SigninScreen(),
    );
  }
}
