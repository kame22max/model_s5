import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //画面をタップした時に呼ばれる。
      child: Scaffold(
        body: SafeArea(
          child: Stack(//重ねて表示する。
              children: <Widget>[
            IconButton(
                onPressed:(){
                  Navigator.pop(context);
                },
                //前のログイン画面に戻る。
                icon: const Icon(Icons.arrow_back_ios_outlined)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Kamelog",
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(fontSize: 40),
                  ),
                ),
                Image.asset(
                  'images/top_icon.png',
                  scale: 10,
                ),
                ElevatedButton(
                    onPressed: () {

                    }, //イベント処理
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: const Text("新しいアカウントを作成")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(),
                        child: const Text("ログイン")),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
