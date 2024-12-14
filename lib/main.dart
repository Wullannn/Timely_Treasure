import 'package:flutter/material.dart';
import 'package:jamm/screens/cart_screen.dart';
import 'package:jamm/screens/home_screen.dart';
import 'package:jamm/screens/search_screen.dart';
import 'package:jamm/screens/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Timle Treasure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SigninScreen(),
      //home: CartScreen(),
      //home: SearchScreen(),
      //home: HomeScreen(),
    );
  }
}
