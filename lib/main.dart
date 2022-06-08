import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:model_s4/login/kame_login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // ライト用テーマ
      darkTheme: ThemeData.light(), // ダーク用テーマ
      themeMode: ThemeMode.system, // モードをシステム設定にする
      title: 'BookListSample',
      home: const Kame_Login_Page(),
    );
  }

}

