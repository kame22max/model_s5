import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:model_s4/domain/book.dart';

class BookListModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('books').snapshots();

  List<Book>? books;

  void fetchBookList() {
    _usersStream.listen((QuerySnapshot snapshots) {
      final List<Book> Books = snapshots.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        final String title = data["title"];
        final String author = data["author"];
        final String test = data["test"];
        return Book(title,author,test);
      }).toList();
      books = books;
      notifyListeners();
    });
  }
}