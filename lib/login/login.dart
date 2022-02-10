// ignore_for_file: deprecated_member_use

import 'package:collagecompanion/login/forgotpassword.dart';
import 'package:collagecompanion/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  //key for form
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: CircleAvatar(
                foregroundImage: AssetImage('images/icons/splashScreen.png'),
                radius: 60,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                'Proceed with your',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                'Login ',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKeyEmail,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(FontAwesomeIcons.user),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKeyPass,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(FontAwesomeIcons.key),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    RegExp regExp = RegExp(r'^.{6,10}$');
                    if (value!.isEmpty) {
                      return ("Required Password");
                    }
                    if (!regExp.hasMatch(value)) {
                      return ("Please Enter Min. 6 Characters and Max. 10");
                    }
                  },
                  autofocus: false,
                  onSaved: (value) {
                    passController.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() async {
                    // signIn(emailController.text, passController.text);
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  });
                },
                child: Icon(
                  FontAwesomeIcons.arrowCircleRight,
                  color: Colors.blue.shade500,
                  size: 40,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.forgotpasswordRoute);
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.signupRoute);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //login function
  void signIn(String email, String password) async {
    try {
      if (_formKeyEmail.currentState!.validate() &&
          _formKeyPass.currentState!.validate()) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: 'Login Successful'),
                  Navigator.pushNamed(context, MyRoutes.homeRoute),
                });
      }
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: 'Failed With Error Code: ${error.code}');
    }
  }
}


     //     .catchError((e) {
      //   Fluttertoast.showToast(msg: e!.toString());
      // });