import 'package:flutter/material.dart';

class AddBookPage extends StatelessWidget {
  const AddBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register New Book")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "ISBN Number", prefixIcon: Icon(Icons.qr_code))),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: "Book Title", prefixIcon: Icon(Icons.book))),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: "Author", prefixIcon: Icon(Icons.person))),
            const SizedBox(height: 15),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: "Category", prefixIcon: Icon(Icons.category)),
              items: const [
                DropdownMenuItem(value: "Science", child: Text("Science")),
                DropdownMenuItem(value: "Fiction", child: Text("Fiction")),
              ], 
              onChanged: (val) {},
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A237E),
                minimumSize: const Size(double.infinity, 55),
              ),
              child: const Text("SAVE TO DATABASE", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}