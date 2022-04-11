import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_s4/book_list/book_list_model.dart';
import 'package:provider/provider.dart';


class BookListPage extends StatelessWidget {


  BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('リスト'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
        body:Center(
          child: Consumer<BookListModel>(builder: (context, model, child) {
            final List<Book> books = model.books;
            return ListView.builder(itemBuilder: itemBuilder)
          }),

              ),

        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}