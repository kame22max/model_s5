import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class My_Page extends StatefulWidget {
  const My_Page({Key? key}) : super(key: key);

  @override
  State<My_Page> createState() => _My_PageState();
}

class _My_PageState extends State<My_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: PreferredSize(
            child: Container(
              height: 2,
              color: const Color.fromARGB(100, 172, 172, 172),
            ),
            preferredSize: const Size.fromHeight(2),
          ),
          title: Center(
            child: TextButton(
              onPressed: () {},
              child: const Text("プロフィールを編集"),
            ),
          ),
          leadingWidth: 90,
          leading: Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("キャンセル"),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text("完了"),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Column(
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      child: Center(
                        child: Image.asset("images/top_icon.png"),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        child: const Text("プロフィール写真を変更"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                height: 2,
                thickness: 3,
                color: Color.fromARGB(100, 172, 172, 172),
              ),
              ListTile(
                  leading: const Text("名前"),
                  title: Center(
                    child: Text("三好　昭宏"),
                  )),
              ListTile(
                  leading: const Text("ユーザーネーム"),
                  title: Center(
                    child: Text("ちいちゃみ"),
                  ))
            ],
          ),
        ));
  }
}
