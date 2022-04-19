import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;

  Future addbook() async {
    if (title == null || title == "") {
      throw '本のタイトルが入力されていません';
    }
    if (author == null || author == "") {
      throw '本の著者が入力されていません。';
    }
    //firebaseに追加
    await FirebaseFirestore.instance.collection('books').add(
      {
        'title': title,
        'author': author,
      },
    );
  }
}
