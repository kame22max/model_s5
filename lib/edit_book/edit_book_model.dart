import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_s4/domain/book.dart';


class EditBookModel extends ChangeNotifier {

  final Book book;
  EditBookModel(this.book){
    titleController.text = book.title;
    authorController.text = book.author;

  }

  final titleController = TextEditingController();
  final authorController = TextEditingController();

  String? title;
  String? author;

  bool isUpdate(){
    return title != null && author != null;
}

  Future update() async {
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
