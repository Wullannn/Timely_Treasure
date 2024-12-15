import 'package:flutter/material.dart';
import 'package:jam/screens/profile_screen.dart';
import 'package:jam/screens/riwayat_pemesanan.dart';
import 'package:jam/screens/signin_screen.dart';
import 'package:jam/screens/cart_screen.dart';
import 'package:jam/screens/home_screen.dart';
import 'package:jam/screens/search_screen.dart';
import 'package:jam/screens/signin_screen.dart';
import 'package:jam/screens/favorit_screen.dart';
import 'package:jam/screens/checkout_screen.dart';

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

      // home: SigninScreen(),
      // home:FavoritScreen(),
      //home: HomeScreen(),
      // home: CheckoutScreen(), diakses melalui cartscreen soalnya kode ini dinamis bukan statis
      // home: CartScreen(),
      //home: SearchScreen(),
       home: HomeScreen(),
      // home: ProfileScreen(),
      //home : OrderHistoryScreen()
    );
  }
}
