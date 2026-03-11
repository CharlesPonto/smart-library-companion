import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryNavy = Color(0xFF1A237E);

    // Mock data based on your SQL users
    final List<Map<String, String>> users = [
      {"name": "John Smith", "id": "2024-001", "dept": "IBED-Elementary"},
      {"name": "Maria Garcia", "id": "2024-002", "dept": "IBED-Junior High"},
      {"name": "Robert Reyes", "id": "2024-003", "dept": "IBED-Faculty"},
      {"name": "Dexter Umali", "id": "2024-005", "dept": "IBED-Senior High"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Management", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search by ID or Name...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: primaryNavy,
                    child: Text(users[index]['name']![0], style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(users[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("${users[index]['id']} | ${users[index]['dept']}"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Action to view user's currently borrowed books
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