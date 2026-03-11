import 'package:flutter/material.dart';
import 'screens/auth/login_page.dart';
import 'screens/borrower/borrower_dashboard.dart';
import 'screens/borrower/book_catalog_page.dart';
import 'screens/borrower/borrow_form_page.dart';
import 'screens/borrower/history_page.dart';
import 'screens/borrower/saved_books_page.dart';
import 'screens/borrower/profile_page.dart';
import 'screens/borrower/book_details_page.dart';
// Librarian Imports
import 'screens/librarian/librarian_dashboard.dart';
import 'screens/librarian/add_book_page.dart'; 
import 'screens/librarian/reports_page.dart';
import 'screens/librarian/settings_page.dart';
import 'screens/librarian/user_list_page.dart';
import 'screens/librarian/inventory_page.dart';
import 'screens/librarian/request_review_page.dart';

void main() {
  runApp(const JMCFILibraryApp());
}

class JMCFILibraryApp extends StatelessWidget {
  const JMCFILibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JMCFI Library Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF882244),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginPage(),
      routes: {
        // Auth
        '/login': (context) => const LoginPage(),
        
        // Borrower Routes
        '/borrower_home': (context) => const BorrowerDashboard(),
        '/catalog': (context) => const BookCatalogPage(),
        '/borrow_form': (context) => const BorrowFormPage(),
        '/history': (context) => const HistoryPage(),
        '/saved': (context) => const SavedBooksPage(),
        '/profile': (context) => const ProfilePage(),
        '/book_details': (context) => const BookDetailsPage(),
        
        // Librarian Routes
        '/librarian_home': (context) => const LibrarianDashboard(),
        '/add_book': (context) => const AddBookPage(),
        '/user_list': (context) => const UserListPage(),
'/inventory': (context) => const InventoryPage(),
'/reports': (context) => const ReportsPage(),
  '/settings': (context) => const LibrarianSettingsPage(),
  '/inventory': (context) => const InventoryPage(),
  '/user_list': (context) => const UserListPage(),
  '/request_review': (context) => const RequestReviewPage(),
  '/login': (context) => const LoginPage(),
        '/borrower_home': (context) => const BorrowerDashboard(),
        '/librarian_home': (context) => const LibrarianDashboard(),
        '/catalog': (context) => const BookCatalogPage(),
        '/inventory': (context) => const InventoryPage(), // Linked to Stats
        '/reports': (context) => const ReportsPage(),     // Linked to Stats
        '/user_list': (context) => const UserListPage(),
        '/add_book': (context) => const AddBookPage(),
        '/settings': (context) => const LibrarianSettingsPage(),
        '/request_review': (context) => const RequestReviewPage(), //
  
        // '/user_list': (context) => const UserListPage(), // Uncomment when file is created
      },
    );
  }
}