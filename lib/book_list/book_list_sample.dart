import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class BookListPage extends StatelessWidget {


  BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            ),

      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}