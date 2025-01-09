import 'package:flutter/material.dart';
import 'package:jam/Secreen/signUp_screen.dart';

import 'home_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo dan Judul
                Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Timely Treasure',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFD700), // Warna emas
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Tempat Belanja Jam Tangan No. 1\n Barang Berkualitas dan Terpercaya',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Teks isi berwarna putih
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Form Login
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  color: Colors.black, // Warna latar belakang kartu hitam
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Input Email
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'No. Handphone/Username/Email',
                            labelStyle: const TextStyle(color: Colors.white), // Label berwarna putih
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.person, color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white), // Teks input berwarna putih
                        ),
                        const SizedBox(height: 15),
                        // Input Password dengan fitur lihat password
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white), // Label berwarna putih
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white, // Ikon berwarna putih
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_isPasswordVisible,
                          style: const TextStyle(color: Colors.white), // Teks input berwarna putih
                        ),
                        const SizedBox(height: 15),
                        // Tombol Login
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigasi ke Home Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFD700), // Warna emas
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black, // Teks tombol berwarna hitam
                              ),
                            ),
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey[700]), // Divider lebih gelap
                        const SizedBox(height: 10),
                        // Tambahkan teks "Belum punya akun? Daftar di sini"
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Belum punya akun?",
                              style: TextStyle(color: Colors.white), // Teks berwarna putih
                            ),
                            TextButton(
                              onPressed: () {
                                // Arahkan ke halaman registrasi
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                );
                              },
                              child: const Text(
                                "Daftar di sini",
                                style: TextStyle(color: Color(0xFFFFD700)), // Teks berwarna emas
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
