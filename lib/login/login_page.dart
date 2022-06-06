import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



import '../book_list/book_list_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //画面をタップした時に呼ばれる。
      child: Scaffold(
        body: SingleChildScrollView(//画面にキーボードが出てきた時のサイズ調整
          child: SizedBox(
            height: MediaQuery.of(context).size.height,//画面のサイズ調整を行うとColumnなどのレイアウトが崩れるのを防止
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //上下に空白ができる。
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Kamelog",
                          style: GoogleFonts.lobster(
                            textStyle: const TextStyle(fontSize: 40),
                          ),
                        ),
                        // Image.asset(
                        //   'images/top_icon.png',
                        //   scale: 10,
                        // ),
                      ],
                    ),
                    Column(children: <Widget>[
                      const Text(
                        "ようこそ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        width: 320,
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(12, 0, 0, 0),
                            filled: true,
                            labelText: "メールアドレスまたはアカウント名",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 320,
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _isObscure, //入力時に見えなくなる。
                          decoration: InputDecoration(
                            fillColor: const Color.fromARGB(12, 0, 0, 0),
                            filled: true,
                            labelText: "パスワード",
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });

                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ElevatedButton(
                          onPressed: () {

                          },
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: const Text("ログイン")),
                      const Text("ログイン情報を忘れてしまった場合には、"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                              },
                              style: TextButton.styleFrom(),
                              child: const Text("ログインのヘルプ")),
                          const Text("をチェック。"),
                        ],
                      ),

                      // Column(
                      //   children: <Widget>[
                      //     TextButton(
                      //         onPressed: () {},
                      //         child: const Text("Googleアカウントでログイン")),
                      //   ],
                      // ),
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {

                              },
                              child: const Text("登録はこちら")),
                          const Text("または"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookListPage(),
                                    ));
                              },
                              child: const Text("ログインせずにつかう。"))
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
