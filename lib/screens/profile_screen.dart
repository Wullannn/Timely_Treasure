import 'package:flutter/material.dart';
import 'package:jam/screens/signin_screen.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool isSignedIn = true; // Mengatur apakah pengguna sudah signed in
  String fullName = "";
  String email = "";
  int phone = 0;
  String username = "";
  String address = ""; // Tambahkan field alamat

  final TextEditingController _addressController = TextEditingController(); // Controller untuk TextField alamat

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigasi kembali ke HomeScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Text(
          'Akun Saya',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image Container
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://akcdn.detik.net.id/visual/2023/09/13/apple-watch_169.png?w=400&q=90',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Profile content area
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Column(
              children: [
                // Profile Photo with Camera Icon
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: AssetImage('images/placeholder_image.png'),
                      ),
                      if (isSignedIn)
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white, size: 16),
                          ),
                        ),
                    ],
                  ),
                ),

                // Profile Details
                SizedBox(height: 24),
                Divider(color: Colors.blueGrey[100], thickness: 1),
                buildProfileField(Icons.account_circle, 'Username', username),
                buildProfileField(Icons.person, 'Nama Lengkap', fullName),
                buildProfileField(Icons.phone, 'No. Handphone', phone.toString()),
                buildProfileField(Icons.email, 'Email', email),
                buildProfileField(Icons.home, 'Alamat', address),

                // Add/Edit Address Section
                if (isSignedIn) ...[
                  SizedBox(height: 20),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Alamat Baru',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Simpan alamat baru
                      setState(() {
                        address = _addressController.text.isNotEmpty
                            ? _addressController.text
                            : address;
                        _addressController.clear();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Alamat berhasil diperbarui!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text(
                      'Simpan Alamat',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],

                // Sign Out Button
                SizedBox(height: 24),
                if (isSignedIn) ...[
                  ElevatedButton(
                    onPressed: () {
                      // Logic untuk Sign Out, arahkan ke Sign In Screen
                      setState(() {
                        isSignedIn = false;
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SigninScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileField(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey),
          SizedBox(width: 12),
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
