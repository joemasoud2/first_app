import 'package:flutter/material.dart';
import 'package:frist_app/app_settings.dart';
import 'package:frist_app/core/settings_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  String userPhone = "";
  @override
  void initState() {
    super.initState();
    getUserPhoneNumber();
  }

  Future<void> getUserPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userPhone = prefs.getString(AppSettings.EmailSharedPrefsKey) ?? "--";
    userPhone = (await SettingsUtil.getCachedUserEmail());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              color: Colors.blue,
              size: 70,
            )),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text("User Phone: $userPhone"),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(padding: EdgeInsets.all(8.0)),
        Container(
          color: Colors.grey[200],
          child: const ListTile(
            title: Text("Edit Profile."),
            leading: Icon(Icons.edit),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            subtitle: Text("Mange Your Account."),
          ),
        ),
        const Padding(padding: EdgeInsets.all(8.0)),
        Container(
          color: Colors.grey[200],
          child: const ListTile(
            title: Text("App Settings."),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            subtitle: Text("Mange Your Settings."),
          ),
        ),
        const Padding(padding: EdgeInsets.all(8.0)),
        Container(
          color: Colors.grey[200],
          child: const ListTile(
            title: Text("About App."),
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            subtitle: Text("About developer and app."),
          ),
        ),
        InkWell(
            onTap: () {
              SettingsUtil.signOutFlow(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign out"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            )),
      ],
    );
  }
}
