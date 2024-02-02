import 'package:flutter/material.dart';
import 'package:frist_app/screens/sign_in.dart';

class WelcomePge extends StatefulWidget {
  const WelcomePge({super.key});

  @override
  State<WelcomePge> createState() => _WelcomePgeState();
}

class _WelcomePgeState extends State<WelcomePge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2,
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
      body: Container(
        color: Colors.black,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [],
        ),
      ),
    );
  }
}
