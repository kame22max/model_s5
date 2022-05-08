
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.dark,//ステータスバーの色を黒
              )
            ),

            themeMode: ThemeMode.system,//端末のテーマ設定による。
            home: const Login(),
          );
        }

}

// @override
// Widget build(BuildContext context) {
//   return ChangeNotifierProvider(
//     create: (_) => MyTheme(),
//     child: Consumer<MyTheme>(
//       builder: (context, theme, _) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: theme.current,
//           themeMode: ThemeMode.system,
//           home: const Login(),
//         );
//       },
//     ),
//   );
// }


// return MaterialApp(
// theme: ThemeData.light(),
// // ライト用テーマ
// darkTheme: ThemeData.dark(),
// // ダーク用テーマ
// themeMode: ThemeMode.system,
// // モードをシステム設定にする
// debugShowCheckedModeBanner: false,
// //デバッグバー非表示
// home: const Login(),
// );