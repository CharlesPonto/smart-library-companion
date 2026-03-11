import 'package:flutter/material.dart';

class LibrarianDashboard extends StatelessWidget {
  const LibrarianDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryNavy = Color(0xFF1A237E);
    const Color accentMaroon = Color(0xFF882244);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // --- CUSTOM HEADER & PROFILE SECTION ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: primaryNavy,
                        child: Icon(Icons.person, color: Colors.white, size: 30),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hello, Admin!",
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF263238)
                            ),
                          ),
                          Text(
                            "JMCFI Librarian",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                    icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
                    tooltip: "Logout",
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // --- QUICK STATS SECTION ---
              const Text(
                "Library Status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              _buildQuickStats(context, primaryNavy),

              const SizedBox(height: 35),
              _buildSectionHeader("Quick Management"),
              const SizedBox(height: 15),
              _buildActionGrid(context, primaryNavy),

              const SizedBox(height: 35),
              _buildSectionHeader("Pending Approvals"),
              const SizedBox(height: 15),
              
              // --- REQUEST CARDS ---
              _buildRequestCard(context, "Physics Vol. 1", "Juan Dela Cruz", "2024-001", accentMaroon),
              _buildRequestCard(context, "The Great Gatsby", "Maria Garcia", "2024-002", accentMaroon),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // --- BUILDER: ROW OF STATS ---
  Widget _buildQuickStats(BuildContext context, Color color) {
    return Row(
      children: [
        _statBox("Active Loans", "128", color, () {
          Navigator.pushNamed(context, '/inventory', arguments: 'Borrowed');
        }),
        const SizedBox(width: 12),
        _statBox("Overdue", "12", Colors.redAccent, () {
          Navigator.pushNamed(context, '/inventory', arguments: 'Overdue');
        }),
        const SizedBox(width: 12),
        _statBox("Requests", "8", Colors.orange, () {
          Navigator.pushNamed(context, '/reports'); 
        }),
      ],
    );
  }

  // --- COMPONENT: INDIVIDUAL STAT CARD ---
  Widget _statBox(String label, String value, Color color, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, color: Colors.black54, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- BUILDER: GRID OF MODULES ---
  Widget _buildActionGrid(BuildContext context, Color color) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 1.4,
      children: [
        _actionCard(context, Icons.library_add_rounded, "Add Books", color, '/add_book'),
        _actionCard(context, Icons.group_rounded, "User List", color, '/user_list'),
        _actionCard(context, Icons.analytics_rounded, "Reports", color, '/reports'),
        _actionCard(context, Icons.settings_rounded, "Settings", color, '/settings'),
      ],
    );
  }

  // --- COMPONENT: GRID ACTION CARD ---
  Widget _actionCard(BuildContext context, IconData icon, String title, Color color, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF263238))),
          ],
        ),
      ),
    );
  }

  // --- COMPONENT: REQUEST CARD ---
  Widget _buildRequestCard(BuildContext context, String book, String user, String id, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Text("Requested by: $user", style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
                Text("ID: $id", style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/request_review',
              arguments: {'book': book, 'user': user, 'id': id},
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("Review", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF263238)),
    );
  }
}