import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. CATCH THE FILTER ARGUMENT FROM THE DASHBOARD
    final String? filter = ModalRoute.of(context)?.settings.arguments as String?;

    // 2. MOCK DATA (In a real app, this comes from your SQL Database)
    final List<Map<String, String>> allBooks = [
      {"title": "Physics Vol. 1", "status": "Borrowed", "user": "Juan Dela Cruz", "id": "2024-001"},
      {"title": "The Great Gatsby", "status": "Overdue", "user": "Maria Garcia", "id": "2024-002"},
      {"title": "Modern Art", "status": "Available", "user": "N/A", "id": "N/A"},
      {"title": "Calculus II", "status": "Borrowed", "user": "Robert Reyes", "id": "2024-003"},
      {"title": "Chemistry 101", "status": "Overdue", "user": "Dexter Umali", "id": "2024-005"},
      {"title": "Intro to Java", "status": "Available", "user": "N/A", "id": "N/A"},
    ];

    // 3. FILTER LOGIC
    // If filter is 'Borrowed', show only borrowed. If 'Overdue', show only overdue.
    // If filter is null (clicked from "Inventory" card), show everything.
    final List<Map<String, String>> displayedBooks = filter == null
        ? allBooks
        : allBooks.where((book) => book['status'] == filter).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: Text(
          filter == null ? "Book Inventory" : "$filter Books",
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Optional: Summary header inside the list
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Text(
              "Showing ${displayedBooks.length} items",
              style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: displayedBooks.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: displayedBooks.length,
                    itemBuilder: (context, index) {
                      final book = displayedBooks[index];
                      return _buildBookCard(book);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCard(Map<String, String> book) {
    Color statusColor = book['status'] == 'Overdue' ? Colors.red : Colors.blue;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      shadowColor: Colors.black12,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.menu_book_rounded, color: statusColor),
        ),
        title: Text(
          book['title']!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text("Status: ${book['status']}"),
            Text("Holder: ${book['user']} (${book['id']})"),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.inbox_rounded, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text("No books found in this category", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}