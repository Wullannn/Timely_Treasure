import 'package:flutter/material.dart';
import 'package:jam/screens/favorit_screen.dart';
import 'package:jam/screens/home_screen.dart';
import 'package:jam/screens/profile_screen.dart';
// import 'package:jamtangan/screens/cart_screen.dart';
// import 'package:jamtangan/screens/checkout_screen.dart';
// import 'package:jamtangan/screens/detail_screen.dart';
// import 'package:jamtangan/screens/favorit_screen.dart';
// import 'package:jamtangan/screens/home_screen.dart';
// import 'package:jamtangan/screens/profile_screen.dart';
// import 'package:jamtangan/screens/signin_screen.dart';

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
      home: MainScreen(), // Menggunakan MainScreen untuk navigasi BottomNavigationBar
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Daftar layar berdasarkan indeks
  final List<Widget> _screens = [
    HomeScreen(),
    FavoritScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Menampilkan layar berdasarkan indeks
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.deepPurple[50]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Mengubah indeks saat ditekan
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.blueGrey,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.blueGrey[100],
          showSelectedLabels: true,
        ),
      ),
    );
  }
}
