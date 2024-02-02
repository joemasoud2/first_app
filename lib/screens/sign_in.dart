import 'package:flutter/material.dart';
import 'package:frist_app/screens/home_page.dart';
import 'package:frist_app/widgets/buttoms.dart';

class signInpage extends StatefulWidget {
  const signInpage({super.key});

  @override
  State<signInpage> createState() => _signInpageState();
}

class _signInpageState extends State<signInpage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/logo.jpeg'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  String pattern = r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value!)) {
                    return null;
                  } else {
                    return 'enter valid phone number';
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Phone Number"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(label: Text('Password')),
                validator: (value) {
                  String pattern =
                      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value!)) {
                    return 'enter valid password';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              label: 'Log in',
              color: Colors.blue,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print("log in successfully");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomePge()),
                  );
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 30),
            const Text(
              'Forgot password?No yawa. Tap me.',
              style: TextStyle(
                  color: Color.fromARGB(255, 104, 102, 102), fontSize: 15),
            ),
            const SizedBox(height: 30),
            AppButton(
              label: 'No Account?Sign Up',
              color: Colors.grey,
              onTap: () {
                print("welcome");
              },
            ),
          ],
        ),
      ),
    ));
  }
}
