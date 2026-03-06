import 'package:flutter/material.dart';

class BorrowerDashboard extends StatelessWidget {
  const BorrowerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryMaroon = Color(0xFF882244);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text("IBED Library Companion", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/catalog'), icon: const Icon(Icons.search, color: Colors.black87)),
          IconButton(onPressed: () => Navigator.pushNamed(context, '/profile'), icon: const Icon(Icons.account_circle, color: primaryMaroon)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWelcomeHeader(primaryMaroon),
                  const SizedBox(height: 30),
                  _buildSectionTitle("Quick Actions"),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      _buildSquareAction(Icons.auto_stories, "Catalog", Colors.blue, () => Navigator.pushNamed(context, '/catalog')),
                      const SizedBox(width: 15),
                      _buildSquareAction(Icons.history, "History", Colors.orange, () => Navigator.pushNamed(context, '/history')),
                      const SizedBox(width: 15),
                      _buildSquareAction(Icons.bookmark_outline, "Saved", Colors.teal, () => Navigator.pushNamed(context, '/saved')),
                    ],
                  ),
                  const SizedBox(height: 35),
                  _buildSectionTitle("Reminders"),
                  const SizedBox(height: 15),
                  _buildReminderCard(primaryMaroon, () => Navigator.pushNamed(context, '/history')),
                  const SizedBox(height: 35),
                  _buildSectionTitle("New Arrivals"),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildBookCard(context, "The Great Gatsby", "Fiction"),
                        _buildBookCard(context, "Science 101", "Academic"),
                        _buildBookCard(context, "Modern Art", "Arts"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomButtons(context, primaryMaroon),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context, Color primaryMaroon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, -5))]),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/catalog'),
              style: OutlinedButton.styleFrom(side: BorderSide(color: primaryMaroon), padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text("View All Books", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
            )),
            const SizedBox(width: 15),
            Expanded(child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/borrow_form'),
              style: ElevatedButton.styleFrom(backgroundColor: primaryMaroon, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text("Borrow Book", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCard(BuildContext context, String title, String category) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/book_details', arguments: title),
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)), child: const Center(child: Icon(Icons.book, color: Colors.grey)))),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), maxLines: 1),
            Text(category, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // Reuse your existing _buildWelcomeHeader, _buildSectionTitle, _buildSquareAction, and _buildReminderCard here...
  Widget _buildWelcomeHeader(Color color) { return Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)), child: const Row(children: [CircleAvatar(radius: 25, backgroundColor: Colors.white24, child: Icon(Icons.local_library, color: Colors.white)), SizedBox(width: 15), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Welcome, Borrower!", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), Text("Learn through reading today!", style: TextStyle(color: Colors.white70, fontSize: 13))])])); }
  Widget _buildSectionTitle(String title) { return Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87)); }
  Widget _buildSquareAction(IconData icon, String label, Color color, VoidCallback onTap) { return Expanded(child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(12), child: Container(padding: const EdgeInsets.symmetric(vertical: 15), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5)]), child: Column(children: [Icon(icon, color: color), const SizedBox(height: 5), Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500))])))); }
  Widget _buildReminderCard(Color accent, VoidCallback onTap) { return InkWell(onTap: onTap, child: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: ListTile(contentPadding: EdgeInsets.zero, leading: const Icon(Icons.notifications_active, color: Colors.amber), title: const Text("Upcoming Due Date", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), subtitle: const Text("Don't forget to return books on time!"), trailing: Text("10-25", style: TextStyle(color: accent, fontWeight: FontWeight.bold))))); }
}