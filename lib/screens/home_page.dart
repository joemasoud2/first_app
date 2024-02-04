import 'package:flutter/material.dart';
import 'package:frist_app/app_settings.dart';
import 'package:frist_app/screens/nav_bar/categories.dart';
import 'package:frist_app/screens/nav_bar/main_screen.dart';
import 'package:frist_app/screens/nav_bar/settings.dart';
import 'package:frist_app/screens/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  // final String phoneNumber;
  // const HomePage({super.key, required this.phoneNumber});
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pages = [mainPage(), categoriesPage(), settingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () async {
                  _showMyDialog();
                },
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const signInpage()));
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    Text('Sign Out'),
                  ],
                ),
              )
            ],
          )),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: onNavbarTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ]),
    );
  }

  onNavbarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signout'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you wanna sign out?'),
                Text('You well need to login again.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.remove(AppSettings.phoneNumberSharedPrefsKey);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => signInpage()),
                );
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
