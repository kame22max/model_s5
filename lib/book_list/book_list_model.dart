import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_s4/domain/book.dart';

class BookListModel extends ChangeNotifier {

  List<Book>? books;

  void fetchBookList() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('books').get();

    final List<Book> books = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String author = data['author'];
      final String id = document.id;
      return Book(title, author,id);
    }).toList();

    this.books = books;
    notifyListeners();
  }
}
