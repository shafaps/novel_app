import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  final TextEditingController _nameController =
      TextEditingController(text: 'Nama Pengguna');
  final TextEditingController _emailController =
      TextEditingController(text: 'user@example.com');
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Akun'),
        backgroundColor: Colors.white, // Mengatur warna AppBar menjadi putih
        iconTheme: IconThemeData(color: Colors.black), // Mengubah warna ikon menjadi hitam
      ),
      body: Container(
        color: Colors.grey[50], // Mengatur warna latar belakang abu-abu
        height: MediaQuery.of(context).size.height, // Mengatur tinggi kontainer
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0), // Padding untuk konten
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Data Pengguna',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Divider(), // Pembatas antar bagian
              SizedBox(height: 16),
              Text(
                'Edit Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password Baru',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Simpan perubahan data pengguna di sini
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String confirmPassword = _confirmPasswordController.text;

                  if (password.isNotEmpty && password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password tidak cocok!')),
                    );
                    return;
                  }

                  // Logika penyimpanan dapat ditambahkan di sini, misalnya:
                  // Mengupdate profil pengguna ke database atau API

                  // Notifikasi berhasil disimpan
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data berhasil disimpan!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Mengatur warna tombol menjadi biru
                  minimumSize: Size(double.infinity, 48), // Membuat tombol memanjang
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Mengurangi kelengkungan sudut
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white), // Mengatur warna teks tombol menjadi putih
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
