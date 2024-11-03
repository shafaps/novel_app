import 'package:flutter/material.dart';

class WriteStoryScreen extends StatefulWidget {
  @override
  _WriteStoryScreenState createState() => _WriteStoryScreenState();
}

class _WriteStoryScreenState extends State<WriteStoryScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveStory() {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String content = _contentController.text;

    if (title.isNotEmpty && description.isNotEmpty && content.isNotEmpty) {
      // Simpan cerita di sini
      // Lakukan operasi seperti menyimpan ke database atau API

      // Setelah disimpan, berikan notifikasi dan reset form
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cerita berhasil disimpan!')),
      );
      _titleController.clear();
      _descriptionController.clear();
      _contentController.clear();
    } else {
      // Jika ada yang kosong, berikan peringatan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap lengkapi semua field')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tulis Cerita'),
        backgroundColor: Colors.white, // Warna AppBar putih
        iconTheme: IconThemeData(color: Colors.black), // Ikon hitam
      ),
      body: Container(
        color: Colors.grey[50], // Mengatur warna latar belakang menjadi abu-abu
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kotak untuk menunjukkan tempat upload foto sampul buku
            Container(
              width: 120, // Lebar container yang lebih kecil
              height: 120, // Tinggi container untuk membuatnya persegi panjang
              decoration: BoxDecoration(
                color: Colors.grey[200], // Warna latar belakang abu-abu muda
                borderRadius: BorderRadius.circular(8), // Sudut dibulatkan
                border: Border.all(color: Colors.grey), // Border abu-abu
              ),
              child: Center(
                child: Text(
                  'Tempat Upload Foto Sampul Buku',
                  style: TextStyle(color: Colors.grey[600]), // Teks abu-abu
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Judul Cerita',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Isi Cerita',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                expands: true,
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity, // Set width to fill the available space
              child: ElevatedButton(
                onPressed: _saveStory,
                child: Text('Simpan Cerita'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Mengatur warna latar belakang tombol menjadi biru
                  foregroundColor: Colors.white, // Mengatur warna teks tombol menjadi putih
                  padding: EdgeInsets.symmetric(vertical: 12), // Padding untuk tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Sudut dibulatkan
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
