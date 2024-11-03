import 'package:flutter/material.dart';

import 'AccountSettingScreen.dart'; // Impor halaman pengaturan akun
import 'LoginScreen.dart'; // Pastikan ini diimpor jika belum

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Pengguna',
          style: TextStyle(color: Colors.black), // Set title text color to black
        ),
        backgroundColor: Colors.white, // Set the AppBar background color to white
        iconTheme: IconThemeData(color: Colors.black), // Change icon color to black
      ),
      body: Container(
        color: Colors.grey[50], // Set the body background color to a light grey for a soft aesthetic
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16), // Adjusted padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Atur menjadi start
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Placeholder untuk foto profil
              ),
              SizedBox(height: 12), // Adjusted size for better spacing
              Text(
                'Nama Pengguna',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set text color to black for readability
                ),
              ),
              SizedBox(height: 24), // Adjusted spacing for better layout

              // Menu Pengaturan Akun
              ListTile(
                title: Text(
                  'Pengaturan Akun',
                  style: TextStyle(color: Colors.black), // Set text color for ListTile
                ),
                leading: Icon(Icons.settings, color: Colors.black), // Set icon color to black
                onTap: () {
                  // Navigasi ke halaman Pengaturan Akun ketika menu diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountSettingsScreen(),
                    ),
                  );
                },
              ),

              // Menu Logout
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black), // Set text color for ListTile
                ),
                leading: Icon(Icons.logout, color: Colors.black), // Set icon color to black
                onTap: () {
                  // Navigasi ke halaman login ketika menu logout diklik
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
