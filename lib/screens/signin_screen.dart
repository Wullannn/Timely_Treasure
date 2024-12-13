import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey, // Latar belakang biru abu-abu
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo dan Judul
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Timely Treasure',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Tempat Belanja Jam Tangan No. 1\n Barang Berkualitas dan Terpercaya',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Form Login
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Input Email
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'No. Handphone/Username/Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Input Password
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 15),
                        // Tombol Login
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Logika login di sini
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Lupa Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Arahkan ke halaman lupa password
                            },
                            child: Text(
                              'Lupa Password?',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey[300]),
                        SizedBox(height: 10),
                        // Tambahkan teks "Belum punya akun? Daftar di sini"
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Belum punya akun?"),
                            TextButton(
                              onPressed: () {
                                // Arahkan ke halaman registrasi
                              },
                              child: Text(
                                "Daftar di sini",
                                style: TextStyle(color: Colors.blueAccent),
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
