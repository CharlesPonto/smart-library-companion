import 'package:flutter/material.dart';
import 'screens/auth/login_page.dart';
import 'screens/borrower/borrower_dashboard.dart';
import 'screens/borrower/book_catalog_page.dart';
import 'screens/borrower/borrow_form_page.dart';
import 'screens/borrower/history_page.dart';
import 'screens/borrower/saved_books_page.dart';
import 'screens/borrower/profile_page.dart';
import 'screens/borrower/book_details_page.dart';

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
        '/login': (context) => const LoginPage(),
        '/borrower_home': (context) => const BorrowerDashboard(),
        '/catalog': (context) => const BookCatalogPage(),
        '/borrow_form': (context) => const BorrowFormPage(),
        '/history': (context) => const HistoryPage(),
        '/saved': (context) => const SavedBooksPage(),
        '/profile': (context) => const ProfilePage(),
        '/book_details': (context) => const BookDetailsPage(),
      },
    );
  }
}