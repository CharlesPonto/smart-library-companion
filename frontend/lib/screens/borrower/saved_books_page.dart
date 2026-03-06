import 'package:flutter/material.dart';

class SavedBooksPage extends StatelessWidget {
  const SavedBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Books", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark_border, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 16),
            const Text("No saved books yet.", style: TextStyle(color: Colors.grey)),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/catalog'),
              child: const Text("Browse Catalog", style: TextStyle(color: Color(0xFF882244))),
            )
          ],
        ),
      ),
    );
  }
}