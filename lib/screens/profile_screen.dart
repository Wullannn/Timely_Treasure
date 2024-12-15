import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool isSignedIn = true;
  String fullName = "";
  String email = "";
  int phone = 0;
  String username = "";
  late Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Container
          // Background Image Container
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://akcdn.detik.net.id/visual/2023/09/13/apple-watch_169.png?w=400&q=90'
                ),
                fit: BoxFit.cover, // Menyesuaikan gambar agar memenuhi container
              ),
            ),
          ),

          // Profile content area
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // Poto Profil dengan logo camera
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey, width: 4),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt, color: Colors.blueGrey[50]),
                          ),
                      ],
                    ),
                  ),
                ),

                // Profile details
                SizedBox(height: 20),
                Divider(color: Colors.blueGrey[100]),
                SizedBox(height: 5),

                // Username row
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.account_circle, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Username', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $username', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Divider(color: Colors.blueGrey[100]),
                SizedBox(height: 4),

                // Full Name row
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Name', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $fullName', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(color: Colors.blueGrey[100]),
                SizedBox(height: 5),

                // Phone number row
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.phone, color: Colors.blueGrey),
                          SizedBox(width: 8),
                          Text('Phone', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $phone', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Divider(color: Colors.blueGrey[100]),
                SizedBox(height: 4),

                // Email row
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.email, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Email', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $email', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
