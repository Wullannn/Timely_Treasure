import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jam/screens/signin_screen.dart';
import '../providers/provider.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().currentUser; // Ambil data pengguna dari provider

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
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
          // Background Image
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
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Column(
              children: [
                // Foto Profil
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
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Divider(color: Colors.blueGrey[100], thickness: 1),
                buildProfileField(Icons.account_circle, 'Username', user.username),
                buildProfileField(Icons.person, 'Nama Lengkap', user.fullName),
                buildProfileField(Icons.phone, 'No. Handphone', user.phone.toString()),
                buildProfileField(Icons.email, 'Email', user.email),
                buildProfileField(Icons.home, 'Alamat', user.address),
                SizedBox(height: 20),
                // Input Alamat Baru
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
                    // Update alamat dengan menggunakan provider
                    if (_addressController.text.isNotEmpty) {
                      context.read<UserProvider>().updateAddress(_addressController.text);
                      _addressController.clear();
                    }
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
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Logic untuk logout dan navigasi ke SigninScreen
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
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan field profil
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
