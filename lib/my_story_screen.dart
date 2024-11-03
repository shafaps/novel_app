import 'package:flutter/material.dart';

import 'novel_detail_screen.dart'; // Make sure to import NovelDetailScreen
import 'write_story_screen.dart'; // Import your existing WriteStoryScreen

class MyStoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> novel = [
    {
      'title': 'Cerita Saya 1',
      'author': 'Saya',
      'coverUrl': 'https://picsum.photos/100/150?random=10',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi chapter 1 dari Cerita Saya 1.',
        },
        {
          'title': 'Chapter 2',
          'content': 'Ini adalah isi chapter 2 dari Cerita Saya 1.',
        },
        {
          'title': 'Chapter 3',
          'content': 'Ini adalah isi chapter 3 dari Cerita Saya 1.',
        },
      ],
      'likes': 123,
      'comments': 45,
    },
    {
      'title': 'Cerita Saya 2',
      'author': 'Saya',
      'coverUrl': 'https://picsum.photos/100/150?random=11',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi chapter 1 dari Cerita Saya 2.',
        },
        {
          'title': 'Chapter 2',
          'content': 'Ini adalah isi chapter 2 dari Cerita Saya 2.',
        },
      ],
      'likes': 98,
      'comments': 22,
    },
    {
      'title': 'Cerita Saya 3',
      'author': 'Saya',
      'coverUrl': 'https://picsum.photos/100/150?random=12',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi chapter 1 dari Cerita Saya 3.',
        },
        {
          'title': 'Chapter 2',
          'content': 'Ini adalah isi chapter 2 dari Cerita Saya 3.',
        },
        {
          'title': 'Chapter 3',
          'content': 'Ini adalah isi chapter 3 dari Cerita Saya 3.',
        },
        {
          'title': 'Chapter 4',
          'content': 'Ini adalah isi chapter 4 dari Cerita Saya 3.',
        },
      ],
      'likes': 200,
      'comments': 65,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Cerita Saya',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black), // Back button color
      ),
      backgroundColor: Colors.grey[100], // Light gray background color for subtle contrast
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        itemCount: novel.length,
        itemBuilder: (context, index) {
          final chaptersCount = novel[index]['chapters'].length;
          final likesCount = novel[index]['likes'];
          final commentsCount = novel[index]['comments'];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: InkWell(
              onTap: () {
                // Navigate to NovelDetailScreen with novel data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NovelDetailScreen(
                      novel: novel[index],
                      currentUser: 'Saya',
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.white, // Card background color to maintain the light theme
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          novel[index]['coverUrl']!,
                          width: 80,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              novel[index]['title']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.format_list_numbered, size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  '$chaptersCount bab',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '"Perasaan kita sama, tapi sayang Tuhan kita beda."',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.favorite, size: 16, color: Colors.red), // Red for likes
                                SizedBox(width: 4),
                                Text(
                                  '$likesCount',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                ),
                                SizedBox(width: 16),
                                Icon(Icons.comment, size: 16, color: Colors.blue), // Blue for comments
                                SizedBox(width: 4),
                                Text(
                                  '$commentsCount',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '*****',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WriteStoryScreen(),
            ),
          );
        },
        backgroundColor: Colors.blue, // Subtle blue for FAB
        child: Icon(
          Icons.create,
          color: Colors.white,
        ),
      ),
    );
  }
}
