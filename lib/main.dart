import 'package:flutter/material.dart';
import 'package:jamm/screens/cart_screen.dart';
import 'package:jamm/screens/home_screen.dart';
import 'package:jamm/screens/search_screen.dart';
import 'package:jamm/screens/signin_screen.dart';
import 'package:jamm/screens/favorit_screen.dart';
import 'package:jamm/screens/checkout_screen.dart';

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
<<<<<<< Updated upstream
      home: SigninScreen(),
      // home:CheckoutScreen(),
      // home:FavoritScreen(),
      //home: CartScreen(),
      //home: SearchScreen(),
      //home: HomeScreen(),
=======
      // home: SigninScreen(),
      // home: CheckoutScreen(), diakses melalui cartscreen soalnya kode ini dinamis bukan statis
      home: FavoritScreen(),
      // home: CartScreen(),
      //home: SearchScreen(),
      // home: HomeScreen(),
      // home: ProfileScreen(),
      //home : OrderHistoryScreen()
>>>>>>> Stashed changes
    );
  }
}
