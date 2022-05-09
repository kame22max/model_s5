import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;

  Future addbook() async {
    if (title == null || title == "") {
      throw 'やることが入力されていません';
    }
    if (author == null || author == "") {
      throw '内容が入力されていません。';
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
