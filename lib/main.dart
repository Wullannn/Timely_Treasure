import 'package:flutter/material.dart';
import 'package:jam/screens/detail_screen.dart';
import 'package:jam/screens/profile_screen.dart';
import 'package:jam/screens/riwayat_pemesanan.dart';



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

      home: OrderHistoryScreen(),
      //home : ProfileScreen(),
      //home : ProductDetail(product: {},)

    );
  }
}