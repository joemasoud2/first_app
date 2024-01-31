import 'package:flutter/material.dart';

class WelcomePge extends StatefulWidget {
  const WelcomePge({super.key});

  @override
  State<WelcomePge> createState() => _WelcomePgeState();
}

class _WelcomePgeState extends State<WelcomePge> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: Icon(
      //         Icon.arrow_back_ios,
      //       )),
      // ),
      body: Center(
        child: Text(
          'welcome',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
