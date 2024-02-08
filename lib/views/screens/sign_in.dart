import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frist_app/core/firebase_Auth_util.dart';
import 'package:frist_app/service/cart_service.dart';
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
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordConrroller = TextEditingController();
  bool isloading = false;
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
                controller: EmailController,
                validator: (value) {
                  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value!)) {
                    return 'enter valid Email';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
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
            isloading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : AppButton(
                    label: 'Log in',
                    color: Colors.blue,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          bool isLoggedIn = false;
                          isloading = true;
                          setState(() {});
                          bool loginResult = await firebaseAuthUtil.loginIn(
                              email: EmailController.text,
                              password: PasswordConrroller.text);
                          if (loginResult) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          } else {
                            var snackBar = const SnackBar(
                                content:
                                    Text("Email or password is not correct"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } catch (e) {
                          isloading = false;
                          setState(() {});
                          var snackbar = SnackBar(
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
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
