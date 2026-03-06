import 'package:flutter/material.dart';

class BookCatalogPage extends StatelessWidget {
  const BookCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryMaroon = Color(0xFF882244);

    // Mock data for books
    final List<Map<String, String>> books = [
      {"title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "status": "Available"},
      {"title": "Physics Vol 1", "author": "Dr. Smith", "status": "Borrowed"},
      {"title": "Modern Art", "author": "Jane Doe", "status": "Available"},
      {"title": "Introduction to Java", "author": "Oracle", "status": "Available"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Library Catalog",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.5,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search by title, author, or ISBN...",
                prefixIcon: const Icon(Icons.search, color: primaryMaroon),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Book List
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                bool isAvailable = books[index]['status'] == "Available";

                return ListTile(
                  leading: const Icon(Icons.book, color: primaryMaroon),

                  title: Text(
                    books[index]['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  subtitle: Text(books[index]['author']!),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        books[index]['status']!,
                        style: TextStyle(
                          color: isAvailable ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/borrow_form',
                      arguments: books[index]['title'],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}