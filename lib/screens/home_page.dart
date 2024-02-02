import 'package:flutter/material.dart';
import 'package:frist_app/screens/nav_bar/categories.dart';
import 'package:frist_app/screens/nav_bar/main_screen.dart';
import 'package:frist_app/screens/nav_bar/settings.dart';
import 'package:frist_app/screens/sign_in.dart';

class WelcomePge extends StatefulWidget {
  const WelcomePge({super.key});

  @override
  State<WelcomePge> createState() => _WelcomePgeState();
}

class _WelcomePgeState extends State<WelcomePge> {
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
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const signInpage()));
                },
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
}
