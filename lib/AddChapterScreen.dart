import 'package:flutter/material.dart';

class AddChapterScreen extends StatefulWidget {
  final Function(String title, String content) onAddChapter; // Callback for adding chapter

  AddChapterScreen({required this.onAddChapter}); // Constructor

  @override
  _AddChapterScreenState createState() => _AddChapterScreenState();
}

class _AddChapterScreenState extends State<AddChapterScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Chapter'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black), // Black icons
      ),
      body: Container(
        color: Color(0xFFF8F8F8), // Light grey background for the entire screen
        width: double.infinity, // Set width to fill the available space
        height: double.infinity, // Set height to fill the available space
        child: Padding(
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
                      widget.onAddChapter(
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
      ),
    );
  }
}
