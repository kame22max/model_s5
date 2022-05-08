import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_s5/mypage.dart';

import 'theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting_Page extends StatefulWidget {
  @override
  State<Setting_Page> createState() => _Setting_PageState();
}

class _Setting_PageState extends State<Setting_Page> {
  bool _dark_swicth = false;
  String test = "日本語";
  String _color_theme = "ブルー";

  void _getDarkSwitchValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _dark_swicth = prefs.getBool('key_1') ?? false; //読み込み
    });
  }

  void _setDarkSwitchValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("key_1", _dark_swicth); //書き込み
  }

  @override
  void initState() {
    super.initState(); //アプリの起動時に呼ばれる。
    _getDarkSwitchValue(); //初期設定
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: SafeArea(
        child: SettingsList(
          sections: [
            SettingsSection(
              title: Text(
                '',
                style: GoogleFonts.shipporiAntiqueB1(
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: const Text('言語'),
                  value: Text(test),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {
                    //Provider.of<MyTheme>(context, listen: false).toggle();
                    setState(() {
                      _dark_swicth = !_dark_swicth;
                      _setDarkSwitchValue();
                    });
                  },
                  initialValue: _dark_swicth,
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('ダークテーマ'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.palette),
                  title: const Text('テーマカラー'),
                  value: Text(_color_theme),
                  onPressed: (context) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text("テーマカラー選択"),
                          actions: [
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: const Text("閉じる"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SettingsSection(
              title: Text("aaa"),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: const Text('アカウント'),
                  onPressed: (context) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => My_Page(),
                    ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
