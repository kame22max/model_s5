// テーマ変更用の状態クラス
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_page.dart';

class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool _isDark = false;

  // とりあえずトグルでテーマを切り替える関数だけ定義しています
  toggle() {
    _isDark = !_isDark;
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

} //ダークモードのON/OFF切り替え
