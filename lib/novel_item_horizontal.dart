import 'package:flutter/material.dart';

class NovelItemHorizontal extends StatelessWidget {
  final Map<String, dynamic> novel;

  NovelItemHorizontal({required this.novel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            novel['coverUrl']!,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Center( // Center the title
            child: Text(
              novel['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center the text
              maxLines: 2, // Allow for two lines
              overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
            ),
          ),
          Center( // Center the author name
            child: Text(
              novel['author']!,
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center, // Correctly align text to center
            ),
          ),
        ],
      ),
    );
  }
}
