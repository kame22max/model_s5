import 'package:flutter/material.dart';
import 'package:model_s4/edit_book/edit_book_model.dart';
import 'package:provider/provider.dart';

import '../domain/book.dart';

class EditBookPage extends StatelessWidget {
  final Book book;

  EditBookPage(this.book);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditBookModel>(
      create: (_) => EditBookModel(book),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.transparent,
          // elevation: 0,
          title: const Text('やることを編集'),
        ),
        body: Center(
          child: Consumer<EditBookModel>(builder: (context, model, child) {
            return Column(
              children: [
                TextField(
                  controller: model.titleController,
                  decoration: const InputDecoration(hintText: 'やること'),
                  onChanged: (text) {
                    model.setTitle(text);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: model.authorController,
                  decoration: const InputDecoration(hintText: '内容'),
                  onChanged: (text) {
                    model.setAuthor(text);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: model.isUpdate()
                      ? () async {
                          try {
                            await model.update();

                            Navigator.of(context).pop(model.title);
                          } catch (e) {
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                e.toString(),
                                textAlign: TextAlign.center,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      : null,
                  child: const Text("更新する"),

                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
