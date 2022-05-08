import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Memo_Edit_Page extends StatefulWidget {
  const Memo_Edit_Page({Key? key}) : super(key: key);

  @override
  State<Memo_Edit_Page> createState() => _Memo_Edit_PageState();
}

class _Memo_Edit_PageState extends State<Memo_Edit_Page> {


  String _edit_text = "";

  String _title = "新規タイトル";

  final controller = TextEditingController();

  final _controller = TextEditingController();

  void _getTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title = prefs.getString('key_1') ?? ""; //タイトル読み込み
    });
  }
  void _setTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("key_1", _title); //タイトル書き込み
  }

  @override
  void initState() {
    super.initState(); //アプリの起動時に呼ばれる。
    _getTitle(); //初期設定

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _title,
                style: const TextStyle(color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("タイトル編集"),
                        content: CupertinoTextField(
                          controller: _controller, //コントローラーの設定
                          onChanged: (value){
                            setState(() {
                              _title = value;
                            });
                          },

                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text("キャンセル"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isDestructiveAction: true,
                          ),
                          CupertinoDialogAction(

                            child: const Text("完了"),
                            onPressed: () {
                              setState(() {
                                _setTitle();
                              });
                              Navigator.pop(context);
                            },
                            isDefaultAction: true,
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
          leadingWidth: 90,
          leading: Container(
            alignment: FractionalOffset.centerLeft, // <- 追記したコード
            child: OverflowBox(
              maxWidth: 110,
              child: TextButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("保存せずに終了しますか？"),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text("いいえ"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isDestructiveAction: true,
                          ),
                          CupertinoDialogAction(
                            child: const Text("はい"),
                            onPressed: () {
                              Navigator.pop(context);//ダイアログを閉じる。
                              Navigator.pop(context);//メモ画面を閉じる。

                            },
                            isDefaultAction: true,
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "キャンセル",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  ),
                ),
              ),
            ),
          ),

          actions: <Widget>[
            TextButton(
              child: const Text("保存"),
              onPressed: () {
                setState(() {

                });
              },
            )
          ],

        ),
        body: SingleChildScrollView(
            child: TextFormField(
              autofocus: true,
              controller: _controller,
              maxLines: 1000,
              style: const TextStyle(color: Colors.black),
              onChanged: (text) {
                text = _edit_text;
              },
            ),
          ),
        ),
    );
  }
}
