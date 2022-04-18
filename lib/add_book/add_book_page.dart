import 'package:flutter/material.dart';
import 'package:model_s4/add_book/add_book_model.dart';
import 'package:model_s4/book_list/book_list_model.dart';
import 'package:model_s4/domain/book.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('本を追加'),
        ),
        body: Center(
          child: Consumer<AddBookModel>(builder: (context, model, child) {
            return Column(
              children: [
                TextField(
                  decoration: const InputDecoration(hintText: '本のタイトル'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: '本の著者'),
                  onChanged: (text) {
                    model.author = text;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      var snackBar = const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          '本を追加しました'
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      await model.addbook();
                    } catch (e) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          e.toString(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text("追加する"),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}