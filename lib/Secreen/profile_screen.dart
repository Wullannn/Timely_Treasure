import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jam/Secreen/signIn_screen.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import 'home_screen.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool isSignedIn = true;
  String profileImage = 'images/placeholder_image.png';

  @override
  void initState() {
    super.initState();
    // Pre-fill data from user provider
    final user = context.read<UserProvider>().currentUser;
    _usernameController.text = user.username ?? '';
    _fullNameController.text = user.fullName ?? '';
    _phoneController.text = user.phone ?? '';
    _emailController.text = user.email ?? '';
    _addressController.text = user.address ?? '';
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        profileImage = pickedFile.path;
      });
    }
  }

  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, size: 20),
                title: Text('Kamera'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, size: 20),
                title: Text('Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

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
          Container(
            height: 80,
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
            padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: profileImage.startsWith('images/')
                              ? AssetImage(profileImage) as ImageProvider
                              : FileImage(File(profileImage)),
                        ),
                        if (isSignedIn)
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.black,
                            child: IconButton(
                              onPressed: showImagePickerOptions,
                              icon: Icon(Icons.edit, color: Colors.white, size: 12),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(color: Colors.blueGrey[100], thickness: 1),
                  buildTextField('Username', Icons.account_circle, _usernameController),
                  buildTextField('Nama Lengkap', Icons.person, _fullNameController),
                  buildTextField('No. Handphone', Icons.phone, _phoneController),
                  buildTextField('Email', Icons.email, _emailController),
                  buildTextField('Alamat', Icons.home, _addressController),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Update user profile in provider
                      userProvider.updateProfile(
                        username: _usernameController.text,
                        fullName: _fullNameController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        address: _addressController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Profil berhasil diperbarui!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text(
                      'Simpan Profil',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SigninScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: Icon(icon, size: 20),
        ),
      ),
    );
  }
}
