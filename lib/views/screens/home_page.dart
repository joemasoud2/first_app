import 'package:flutter/material.dart';
import 'package:frist_app/core/settings_util.dart';
import 'package:frist_app/views/screens/cart_page.dart';
import 'package:frist_app/views/screens/nav_bar/categories.dart';
import 'package:frist_app/views/screens/nav_bar/main_screen.dart';
import 'package:frist_app/views/screens/nav_bar/settings.dart';

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
  String phoneNumber = "";
  List<Widget> pages = [
    const MainScreen(),
    const categoriesPage(),
    const settingsPage()
  ];
  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  Future<void> getPhoneNumber() async {
    phoneNumber = await SettingsUtil.getCachedUserPhone();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      Text("User Name"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Phone: $phoneNumber")],
                  )
                ],
              ),
            ),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text("Add product"),
                )),
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text("Cart"),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                )),
            const Divider(),
            InkWell(
                onTap: () async {
                  SettingsUtil.signOutFlow(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign out"),
                ))
          ],
        ),
      ),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
