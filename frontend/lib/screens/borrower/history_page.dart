import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryMaroon = Color(0xFF882244);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("My Book History", style: TextStyle(color: Colors.black)),
          bottom: const TabBar(
            labelColor: primaryMaroon,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryMaroon,
            tabs: [
              Tab(text: "Currently Borrowed"),
              Tab(text: "Returned"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildHistoryList([
              {"title": "Physics Vol. 1", "date": "Due: Oct 25, 2025", "status": "Active"},
              {"title": "The Great Gatsby", "date": "Due: Nov 02, 2025", "status": "Active"},
            ], isCurrent: true),
            _buildHistoryList([
              {"title": "Modern Art", "date": "Returned: Sept 15, 2025", "status": "Returned"},
              {"title": "Java Basics", "date": "Returned: Aug 10, 2025", "status": "Returned"},
            ], isCurrent: false),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList(List<Map<String, String>> data, {required bool isCurrent}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
          color: Colors.grey[100],
          child: ListTile(
            leading: Icon(Icons.book, color: isCurrent ? const Color(0xFF882244) : Colors.grey),
            title: Text(data[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(data[index]['date']!),
            trailing: isCurrent 
              ? const Icon(Icons.hourglass_bottom, color: Colors.orange, size: 20)
              : const Icon(Icons.check_circle, color: Colors.green, size: 20),
          ),
        );
      },
    );
  }
}