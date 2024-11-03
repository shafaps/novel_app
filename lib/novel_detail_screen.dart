import 'package:flutter/material.dart';

import 'AddChapterScreen.dart';
import 'ChapterDetailScreen.dart';
import 'CommentScreen.dart'; // Import halaman komentar

class NovelDetailScreen extends StatefulWidget {
  final Map<String, dynamic> novel;
  final String? currentUser; // Mengubah menjadi opsional dengan tanda tanya

  NovelDetailScreen({required this.novel, this.currentUser});

  @override
  _NovelDetailScreenState createState() => _NovelDetailScreenState();
}

class _NovelDetailScreenState extends State<NovelDetailScreen> {
  // Contoh data komentar
  final List<Map<String, dynamic>> comments = [
    {
      'username': 'nowers.bdg',
      'content': 'Kalau melangkah ke jenjang lebih serius gimana no?',
      'timestamp': '3 hari',
      'avatarUrl': 'https://example.com/avatar1.png', // Ganti dengan URL avatar yang sesuai
    },
    {
      'username': 'sfy.ers',
      'content': 'Pas bilang klarifikasi, hati deg deg an takut.',
      'timestamp': '3 hari',
      'avatarUrl': 'https://example.com/avatar2.png', // Ganti dengan URL avatar yang sesuai
    },
    {
      'username': 'tx_bal',
      'content': 'Oke nt kita mabr epep ya bimo',
      'timestamp': '3 hari',
      'avatarUrl': 'https://example.com/avatar3.png', // Ganti dengan URL avatar yang sesuai
    },
    {
      'username': 'r0w.nnd44__',
      'content': 'astaga 😂',
      'timestamp': '3 hari',
      'avatarUrl': 'https://example.com/avatar4.png', // Ganti dengan URL avatar yang sesuai
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Mencetak nilai currentUser ke konsol
    print('Current User: ${widget.currentUser}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow for a flat look
        iconTheme: IconThemeData(color: Colors.black), // Icon color for back button
        title: Text(
          widget.novel['title'],
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey[50], // Very light gray background for contrast
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the cover image, title, and author in a single row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cover Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.novel['coverUrl'],
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.0),
                // Title, Author, Likes, Comments
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display the title of the novel
                      Text(
                        widget.novel['title'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      // Display the author
                      Text(
                        '${widget.novel['author']}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 10), // Space between author and like/comment
                      // Row for likes and comments
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.novel['isFavorite'] = !(widget.novel['isFavorite'] ?? false);
                              });
                            },
                            child: Icon(
                              widget.novel['isFavorite'] ?? false
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget.novel['isFavorite'] ?? false ? Colors.red : Colors.grey,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${widget.novel['likes'] ?? 0}', // Display likes count
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CommentScreen(
                                    comments: comments, // Mengirim data komentar
                                  ),
                                ),
                              );
                            },
                            child: Icon(Icons.comment,
                                color: Colors.blue,
                                size: 20), // Blue color for comment icon
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${comments.length}', // Display comments count
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Display the chapters list
            Text(
              'Daftar Chapter:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: (widget.novel['chapters'] ?? []).length,
                itemBuilder: (context, index) {
                  final chapter = widget.novel['chapters'][index];
                  // Menentukan warna latar belakang berdasarkan index ganjil/genap
                  final backgroundColor = index % 2 == 0 ? Colors.white : Colors.grey[200];

                  return Container(
                    color: backgroundColor, // Set warna latar belakang
                    child: ListTile(
                      title: Text(
                        chapter['title'],
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChapterDetailScreen(
                              title: chapter['title'],
                              content: chapter['content'],
                              author: widget.novel['author'], // Menambahkan parameter author
                              currentUser: widget.currentUser ?? '', // Menambahkan parameter currentUser
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            // Display the Add Chapter button for the current user
            if (widget.novel['author'] == widget.currentUser)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Tambah Chapter"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
                      foregroundColor: Colors.white, // Button text/icon color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      // Navigate to add chapter screen
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddChapterScreen(
                            onAddChapter: (String title, String content) {
                              setState(() {
                                widget.novel['chapters'].add({
                                  'title': title,
                                  'content': content,
                                });
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
