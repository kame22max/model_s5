import 'package:flutter/material.dart';
import 'package:model_s4/add_book/add_book_page.dart';
import 'package:model_s4/book_list/book_list_model.dart';
import 'package:model_s4/domain/book.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBookList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('本一覧'),
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
              onPressed: () async {
                //画面遷移
                final bool? added = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBookPage(),
                    fullscreenDialog: true,
                  ),
                );

                if (added != null && added){
                  var snackBar = const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      '本を追加しました',
                      textAlign: TextAlign.center,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                }
                model.fetchBookList();
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
