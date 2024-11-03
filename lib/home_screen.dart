import 'package:flutter/material.dart';

import 'favorite_screen.dart';
import 'my_story_screen.dart';
import 'novel_detail_screen.dart'; // Ensure you have this screen for novel details
import 'novel_item_horizontal.dart';
import 'novel_item_vertical.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    NovelListScreen(), // Halaman Home
    FavoriteScreen(), // Halaman Favorit
    MyStoryScreen(), // Halaman Cerita Saya
    ProfileScreen(), // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah indeks yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Menampilkan halaman berdasarkan indeks
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Cerita Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Warna biru untuk ikon yang dipilih
        unselectedItemColor: Colors.blue, // Warna abu-abu untuk ikon yang tidak dipilih
        showSelectedLabels: true, // Menampilkan label yang terpilih
        showUnselectedLabels: true, // Menampilkan label yang tidak terpilih
        onTap: _onItemTapped,
      ),
    );
  }
}

class NovelListScreen extends StatelessWidget {
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
        title: Text('Readify', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white, // Set the background color of AppBar
      ),
      body: Container(
        color: Colors.grey[50], // Set the body background color to grey
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20),
                child: Text(
                  'Novel Terbaru',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: novel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NovelDetailScreen(novel: novel[index]),
                          ),
                        );
                      },
                      child: NovelItemHorizontal(novel: novel[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20),
                child: Text(
                  'Rekomendasi untuk Anda',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: novel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to NovelDetailScreen when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NovelDetailScreen(novel: novel[index]),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Container(
                        width: 60, // Adjust the width to make it rectangular
                        height: 90, // Adjust the height to make it rectangular
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                          image: DecorationImage(
                            image: NetworkImage(novel[index]['coverUrl']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        novel[index]['title']!,
                        textAlign: TextAlign.left, // Align the title to the left
                      ),
                      subtitle: Text(
                        novel[index]['author']!,
                        textAlign: TextAlign.left, // Align the author to the left
                      ),
                    ),
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
