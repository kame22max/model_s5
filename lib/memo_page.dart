import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:model_s5/memo_edit_page.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({Key? key}) : super(key: key);

  @override
  State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {

  List<String> groupList = [];//グループリストのデータ

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //画面をタップした時に呼ばれる。
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: const IconThemeData(size: 22.0),
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.create),
                backgroundColor: Colors.blue,
                label: "新規メモ",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Memo_Edit_Page(),
                      ));
                },
                labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
            SpeedDialChild(
                child: const Icon(Icons.person_add),
                backgroundColor: Colors.green,
                label: "新規グループ作成",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("グループ名"),
                        content: CupertinoTextField(
                          onChanged: (value) {
                            setState(() {});
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
                labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
            SpeedDialChild(
                child: const Icon(Icons.delete),
                backgroundColor: Colors.red,
                label: "削除",
                onTap: () {
                  Navigator.pushNamed(context, "/search_group");
                },
                labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "メモリスト",
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(children: <Widget>[
          Card(
              color: Colors.cyan,
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 右寄せ
                children: <Widget>[
                  ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 180),
                      child: const Center(
                          child:
                              Text("グループなし", style: TextStyle(fontSize: 20)))),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
