import 'package:flutter/material.dart';
import 'package:model_s4/add_book/add_book_page.dart';
import 'package:model_s4/book_list/book_list_model.dart';
import 'package:model_s4/domain/book.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../edit_book/edit_book_page.dart';

class BookListPage extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBookList(),
      child: ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("やることリスト"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  //画面遷移
                },
              ),
            ],
          ),
          body: Consumer<BookListModel>(
            builder: (context, model, child) {
              return RefreshIndicator(
                onRefresh: () async {
                  model.fetchBookList();
                },
                child: Center(
                  child: Consumer<BookListModel>(
                    builder: (context, model, child) {
                      final List<Book>? books = model.books;

                      if (books == null) {
                        return const CircularProgressIndicator();
                      }
                      final List<Widget> widgets = books
                          .map(
                            (book) => Slidable(
                              child: Card(
                                child: ListTile(
                                  onTap: () async {
                                    //編集画面に遷移
                                    final String title = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditBookPage(book),
                                      ),
                                    );

                                    var snackBar = SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        '$titleを編集しました',
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                    model.fetchBookList();
                                    scaffoldMessengerKey.currentState
                                        ?.showSnackBar(snackBar);
                                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    // model.fetchBookList();
                                  },
                                  onLongPress: () async {
                                    //削除する。
                                    await showConfirmDialog(
                                      context,
                                      book,
                                      model,
                                    );
                                  },
                                  title: Text(book.title),
                                  subtitle: Text(book.author),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      await showConfirmDialog(
                                        context,
                                        book,
                                        model,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      //編集画面に遷移
                                      final String title = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditBookPage(book),
                                        ),
                                      );

                                      var snackBar = SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          '$titleを編集しました',
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                      model.fetchBookList();
                                      scaffoldMessengerKey.currentState
                                          ?.showSnackBar(snackBar);
                                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: '編集',
                                  ),
                                  SlidableAction(
                                    onPressed: (BuildContext context) async {
                                      //「削除しますか？」って聞いて、「はい」だったら削除
                                      await showConfirmDialog(
                                        context,
                                        book,
                                        model,
                                      );
                                    },
                                    backgroundColor: Colors.indigoAccent,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: '削除',
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList();

                      return ListView(
                        children: widgets,
                      );
                    },
                  ),
                ),
              );
            },
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

                  if (added != null && added) {
                    var snackBar = const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'やることを追加しました',
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
      ),
    );
  }

  Future showConfirmDialog(
    BuildContext context,
    Book book,
    BookListModel model,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: const Text("削除の確認"),
          content: Text("『${book.title}』を削除しますか？"),
          actions: [
            Builder(
              builder: (context) {
                return TextButton(
                  child: const Text("いいえ"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
            Builder(
              builder: (context) {
                return TextButton(
                  child: const Text("はい"),
                  onPressed: () async {
                    //modelで削除
                    await model.deleteBook(book);
                    model.fetchBookList();
                    var snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        '${book.title}を削除しました',
                        textAlign: TextAlign.center,
                      ),
                    );
                    model.fetchBookList();
                    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
