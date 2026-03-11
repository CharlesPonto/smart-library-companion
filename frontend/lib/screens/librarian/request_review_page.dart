import 'package:flutter/material.dart';

class RequestReviewPage extends StatelessWidget {
  const RequestReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    const Color primaryNavy = Color(0xFF1A237E);

    return Scaffold(
      appBar: AppBar(title: const Text("Review Request")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoSection("BOOK REQUESTED", data['book'] ?? "Unknown Book", Icons.book),
            const SizedBox(height: 20),
            _buildInfoSection("BORROWER", data['user'] ?? "Unknown User", Icons.person),
            const SizedBox(height: 20),
            const Text("Request Note:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            const Text("\"I need this for my research project in Science class.\""),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15), side: const BorderSide(color: Colors.red)),
                    child: const Text("DECLINE", style: TextStyle(color: Colors.red)),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Request Approved Successfully!")));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(vertical: 15)),
                    child: const Text("APPROVE", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF1A237E)),
            const SizedBox(width: 10),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}