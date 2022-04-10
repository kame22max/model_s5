
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting_Page extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[

              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),

              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  Provider.of<MyTheme>(context, listen: false).toggle();
                },
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: const Text('ダークテーマ'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// テーマ変更用の状態クラス
class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool _isDark = false;

  // とりあえずトグルでテーマを切り替える関数だけ定義しています
  toggle() {
    _isDark =! _isDark;
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();

  }
}