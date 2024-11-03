import 'package:flutter/material.dart';

class ChapterDetailScreen extends StatelessWidget {
  final String title;
  final String content;
  final String author; // Menambahkan parameter author
  final String currentUser; // Menambahkan parameter currentUser

  ChapterDetailScreen({
    required this.title,
    required this.content,
    required this.author,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.black), // Warna teks menjadi hitam
        ),
        backgroundColor: Colors.white, // Mengatur warna latar belakang AppBar menjadi putih
        iconTheme: IconThemeData(color: Colors.black), // Mengatur warna ikon menjadi hitam
        actions: [
          // Menambahkan ikon edit jika author sama dengan currentUser
          if (author == currentUser) // Cek jika author sama dengan currentUser
            IconButton(
              icon: Icon(Icons.edit, color: Colors.black),
              onPressed: () {
                // Navigasi ke halaman edit chapter
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditChapterScreen(
                      title: title,
                      content: content,
                      onEditChapter: (newTitle, newContent) {
                        // Tambahkan logika untuk menyimpan perubahan
                      },
                    ),
                  ),
                );
              },
            ),
        ],
      ),
      body: Container(
        // Mengatur Container untuk mengisi seluruh halaman
        color: Colors.grey[50], // Set warna latar belakang menjadi abu-abu
        constraints: BoxConstraints.expand(), // Memastikan Container memenuhi seluruh area
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                content,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Kelas untuk mengedit chapter
class EditChapterScreen extends StatefulWidget {
  final String title;
  final String content;
  final Function(String title, String content) onEditChapter; // Callback for editing chapter

  EditChapterScreen({
    required this.title,
    required this.content,
    required this.onEditChapter,
  }); // Constructor

  @override
  _EditChapterScreenState createState() => _EditChapterScreenState();
}

class _EditChapterScreenState extends State<EditChapterScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the current title and content
    _titleController.text = widget.title;
    _contentController.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Chapter'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black), // Black icons
      ),
      body: Container(
        color: Color(0xFFF8F8F8), // Light grey background for the entire screen
        width: double.infinity, // Set width to fill the available space
        height: double.infinity, // Set height to fill the available space
        padding: const EdgeInsets.all(16.0), // Maintain padding
        child: SingleChildScrollView( // Allow scrolling for smaller devices
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title input
              Text(
                'Judul Chapter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // White background for text field
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Light shadow
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners for the border
                      borderSide: BorderSide.none, // Remove border line
                    ),
                    hintText: 'Masukkan judul chapter',
                    filled: true,
                    fillColor: Colors.white, // White background for text field
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Spacing between title and content

              // Content input
              Text(
                'Isi Chapter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // White background for text field
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Light shadow
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                child: TextField(
                  controller: _contentController,
                  maxLines: 10, // Allow multiline input
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners for the border
                      borderSide: BorderSide.none, // Remove border line
                    ),
                    hintText: 'Masukkan isi chapter',
                    filled: true,
                    fillColor: Colors.white, // White background for text field
                  ),
                ),
              ),
              SizedBox(height: 20.0), // Spacing before the button

              // Save button
              SizedBox(
                width: double.infinity, // Set width to fill the available space
                child: ElevatedButton(
                  onPressed: () {
                    // Call the callback function with title and content
                    widget.onEditChapter(
                      _titleController.text,
                      _contentController.text,
                    );

                    // Optionally, navigate back to the previous screen
                    Navigator.pop(context);
                  },
                  child: Text('Simpan Chapter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set button color to blue
                    foregroundColor: Colors.white, // Set text color to white
                    padding: EdgeInsets.symmetric(vertical: 12), // Padding for the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Less rounded corners
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
