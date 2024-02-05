import 'package:flutter/material.dart';
import 'package:frist_app/views/screens/home_page.dart';
import 'package:frist_app/views/widgets/buttoms.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signInpage extends StatefulWidget {
  const signInpage({super.key});

  @override
  State<signInpage> createState() => _signInpageState();
}

class _signInpageState extends State<signInpage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController PasswordConrroller = TextEditingController();
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
                controller: PhoneNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  String pattern = r'^(/+201|01|00201)[0-2,5]{1}[0-9]{8}';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value!)) {
                    return 'enter valid phone number';
                  } else {
                    return null;
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
                controller: PasswordConrroller,
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
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  print("log in successfully");

                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString(
                      'Phone_Number', PhoneNumberController.text);
                  await prefs.setString(
                      'Phone_Number', PhoneNumberController.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  PasswordConrroller.clear();
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