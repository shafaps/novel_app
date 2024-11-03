import 'package:flutter/material.dart';

class NovelItemVertical extends StatelessWidget {
  final Map<String, dynamic> novel;

  NovelItemVertical({required this.novel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 70, // Adjust width for rectangular shape
              height: 90, // Adjust height for rectangular shape
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Rounded corners
                image: DecorationImage(
                  image: NetworkImage(novel['coverUrl']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16), // Space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    novel['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    novel['author']!,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.visibility,
                        size: 16,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '63.1K', // Replace with the actual view count from your data if available
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
