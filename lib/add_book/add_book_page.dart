import 'package:flutter/material.dart';
import 'package:model_s4/book_list/book_list_model.dart';
import 'package:model_s4/domain/book.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBookList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('本を追加する'),
        ),
        body: Center(
          child: Consumer<BookListModel>(
            builder: (context, model, child) {
              final List<Book>? books = model.books;

              if (books == null) {
                return const CircularProgressIndicator();
              }

              final List<Widget> widgets = books
                  .map(
                    (book) => ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.author),
                    ),
                  )
                  .toList();
              return ListView(
                children: widgets,
              );
            },
          ),
        ),
        floatingActionButton: Consumer<BookListModel>(
          builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
