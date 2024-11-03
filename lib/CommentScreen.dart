import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  final List<Map<String, dynamic>> comments; // Data komentar

  CommentScreen({required this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komentar'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50], // Mengubah latar belakang menjadi warna abu-abu
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final comment = comments[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(comment['avatarUrl'] ?? 'https://example.com/default-avatar.png'),
                    radius: 20,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment['username'] ?? 'User',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(height: 4),
                        Text(
                          comment['content'] ?? '',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(height: 4),
                        Text(
                          comment['timestamp'] ?? 'Just now',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Tambahkan komentar...',
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // Tambahkan fungsi untuk mengirim komentar
              },
            ),
          ),
        ),
      ),
    );
  }
}
