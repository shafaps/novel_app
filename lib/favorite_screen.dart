import 'package:flutter/material.dart';

import 'novel_detail_screen.dart'; // Import NovelDetailScreen

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> novel = [
    {
      'title': 'Strongest God System 2',
      'author': 'Timur',
      'coverUrl': 'https://picsum.photos/100/150?random=1',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi dari Chapter 1 di Novel 1.',
        },
      ],
    },
    {
      'title': 'Genius yang Ditelantarkan',
      'author': 'Urban',
      'coverUrl': 'https://picsum.photos/100/150?random=2',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi dari Chapter 1 di Novel 2.',
        },
      ],
    },
    {
      'title': 'Jodohku Kakak Angkatku',
      'author': 'Anak Rahasia',
      'coverUrl': 'https://picsum.photos/100/150?random=3',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi dari Chapter 1 di Novel 3.',
        },
      ],
    },
    {
      'title': 'The Dark Chronicles',
      'author': 'Nightfall',
      'coverUrl': 'https://picsum.photos/100/150?random=4',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi dari Chapter 1 di Novel 4.',
        },
      ],
    },
    {
      'title': 'Mystic Love',
      'author': 'Heartstrings',
      'coverUrl': 'https://picsum.photos/100/150?random=5',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi dari Chapter 1 di Novel 5.',
        },
      ],
    },
    {
      'title': 'Warrior\'s Fate',
      'author': 'Legend Tales',
      'coverUrl': 'https://picsum.photos/100/150?random=6',
      'chapters': [
        {
          'title': 'Chapter 1',
          'content': 'Ini adalah isi dari Chapter 1 di Novel 6.',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit Cerita'),
        backgroundColor: Colors.white, // White background for the AppBar
        iconTheme: IconThemeData(color: Colors.blueAccent), // Change icon color
        elevation: 0, // Remove shadow
      ),
      body: Container(
        color: Colors.grey[50], // Light grey background for the body
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: novel.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.56,
            ),
            itemBuilder: (context, index) {
              final selectedNovel = novel[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NovelDetailScreen(
                        novel: selectedNovel,
                        currentUser: null,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        selectedNovel['coverUrl']!,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      selectedNovel['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black, // Text color
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      selectedNovel['author']!,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
