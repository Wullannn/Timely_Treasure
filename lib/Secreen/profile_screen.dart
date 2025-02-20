import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jam/Secreen/signIn_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _imageFile = '';
  final picker = ImagePicker();

  // Data profil terenkripsi
  String fullName = '';
  String userName = '';
  String email = '';
  String phoneNumber = '';
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _loadImage();
  }

  Future<void> _saveImage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('imagePath', _imageFile);
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageFile = prefs.getString('imagePath') ?? '';
    });
  }

  Future<void> _getImage(ImageSource source) async {
    if (kIsWeb && source == ImageSource.camera) {
      debugPrint('Kamera tidak didukung di Web.');
      return;
    }
    try {
      final pickedFile = await picker.pickImage(
        source: source,
        maxHeight: 720,
        maxWidth: 720,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile.path;
        });
        _saveImage();
      } else {
        debugPrint('Tidak ada gambar yang dipilih.');
      }
    } catch (e) {
      debugPrint('Kesalahan saat memilih gambar: $e');
    }
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black,
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_enhance, color: Colors.blueGrey),
                title: const Text('Kamera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.blueGrey),
                title: const Text('Galeri'),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? keyString = prefs.getString('key');
    final String? ivString = prefs.getString('iv');

    if (keyString != null && ivString != null) {
      final key = encrypt.Key.fromBase64(keyString);
      final iv = encrypt.IV.fromBase64(ivString);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));

      setState(() {
        fullName = encrypter.decrypt64(prefs.getString('name') ?? '', iv: iv);
        userName = encrypter.decrypt64(prefs.getString('username') ?? '', iv: iv);
        email = encrypter.decrypt64(prefs.getString('email') ?? '', iv: iv);
        phoneNumber = encrypter.decrypt64(prefs.getString('notelpon') ?? '', iv: iv);
        isSignedIn = fullName.isNotEmpty && userName.isNotEmpty;
      });
    } else {
      setState(() {
        isSignedIn = false;
      });
    }
  }

  Future<void> _saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = encrypt.Key.fromSecureRandom(32);
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    prefs.setString('key', key.base64);
    prefs.setString('iv', iv.base64);
    prefs.setString('name', encrypter.encrypt(fullName, iv: iv).base64);
    prefs.setString('username', encrypter.encrypt(userName, iv: iv).base64);
    prefs.setString('email', encrypter.encrypt(email, iv: iv).base64);
    prefs.setString('notelpon', encrypter.encrypt(phoneNumber, iv: iv).base64);
  }

  void _editData(String label, String currentValue, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text);
                _saveProfileData();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      isSignedIn = false;
      fullName = '';
      userName = '';
      email = '';
      phoneNumber = '';
      _imageFile = '';
    });
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  'https://akcdn.detik.net.id/visual/2023/09/13/apple-watch_169.png?w=400&q=90',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _imageFile.isNotEmpty
                                ? (kIsWeb
                                ? NetworkImage(_imageFile)
                                : FileImage(File(_imageFile))) as ImageProvider
                                : const AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.camera_alt_outlined, color: Colors.blueGrey),
                          onPressed: _showPicker,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.blueGrey),
                _buildProfileRow('Nama :', fullName, Icons.person, (value) {
                  setState(() {
                    fullName = value;
                  });
                }),
                Divider(color: Colors.blueGrey),
                _buildProfileRow('Username :', userName, Icons.account_box, (value) {
                  setState(() {
                    userName = value;
                  });
                }),
                Divider(color: Colors.blueGrey),
                _buildProfileRow('Email :', email, Icons.email, (value) {
                  setState(() {
                    email = value;
                  });
                }),
                Divider(color: Colors.blueGrey),
                _buildProfileRow('Telepon :', phoneNumber, Icons.phone, (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                }),
                const SizedBox(height: 20),
                // Tombol Sign In/Out
                isSignedIn
                    ? TextButton(
                  onPressed: signOut,
                  child: const Text('Sign Out'),
                )
                    : ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninScreen()),
                    );
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // Widget untuk membuat baris profil
  Widget _buildProfileRow(
      String label, String value, IconData icon, Function(String) onEdit) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(icon, color: Colors.blueGrey),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blueGrey),
          onPressed: () {
            _editData(label, value, onEdit);
          },
        ),
      ],
    );
  }
}
