import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkTheme = true;

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('APPEARANCE'),
          tiles: [
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  darkTheme = value;
                });
              },
              initialValue: darkTheme,
              title: Text('Dark Appearance'),
            ),
          ],
        ),
        SettingsSection(
          title: Text('General'),
          tiles: [
            SettingsTile.navigation(
              title: Text('App Version'),
              leading: Icon(CupertinoIcons.wrench),
              description: Text('UI created to show plugin\'s possibilities'),
              onPressed: (context) {},
            )
          ],
        ),
        SettingsSection(
          title: Text('Informations'),
          tiles: [
            SettingsTile.navigation(
              leading: Icon(CupertinoIcons.settings),
              title: Text('FAQs'),
              onPressed: (context) {},
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.settings),
              title: Text('Privacy Policy'),
              onPressed: (context) {},
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.web),
              title: Text('Term of Services'),
              onPressed: (context) {},
            ),
          ],
        ),
      ],
    );
  }
}
