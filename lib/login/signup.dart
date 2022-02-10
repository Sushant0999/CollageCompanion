import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //our form key
  static final GlobalKey<FormState> _formKeyname = GlobalKey<FormState>();
  static final GlobalKey<FormState> _formKeyroll = GlobalKey<FormState>();
  static final GlobalKey<FormState> _formKeyemail = GlobalKey<FormState>();
  static final GlobalKey<FormState> _formKeypass = GlobalKey<FormState>();
  static final GlobalKey<FormState> _formKeyconpass = GlobalKey<FormState>();
  //editing controller
  final nameController = new TextEditingController();
  final rollController = new TextEditingController();
  final emailController = new TextEditingController();
  final passController = new TextEditingController();
  final conpassController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      key: _formKeyname,
      keyboardType: TextInputType.name,
      // validator: (){},
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefix: Icon(
          Icons.person,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final rollField = TextFormField(
      autofocus: false,
      controller: rollController,
      key: _formKeyroll,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regExp = RegExp(r'^.{3,10}$');
        if (value!.isEmpty) {
          return ("Required Name");
        }
        if (!regExp.hasMatch(value)) {
          return ("Please Enter Min. 3 Characters and Max. 10");
        }
      },
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefix: Icon(FontAwesomeIcons.university),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Roll No.',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      key: _formKeyemail,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Email";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return "Enter a valid email";
        }
        return null;
      },
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefix: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passField = TextFormField(
      autofocus: false,
      controller: passController,
      key: _formKeypass,
      validator: (value) {
        RegExp regExp = RegExp(r'^.{6,10}$');
        if (value!.isEmpty) {
          return ("Required Password");
        }
        if (!regExp.hasMatch(value)) {
          return ("Please Enter Min. 6 Characters and Max. 10");
        }
      },
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefix: Icon(FontAwesomeIcons.key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Passowrd',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final conpassField = TextFormField(
      autofocus: false,
      controller: conpassController,
      key: _formKeyconpass,
      validator: (value) {
        if (passController.text.length > 6 && passController.text != value) {
          return "Password Dont Match";
        }
      },
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefix: Icon(FontAwesomeIcons.key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    child: Image.asset(
                      'images/image/signup.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Form(
                    child: nameField,
                    key: _formKeyname,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: rollField,
                    key: _formKeyroll,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: emailField,
                    key: _formKeyemail,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: passField,
                    key: _formKeypass,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: conpassField,
                    key: _formKeyconpass,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Icon(
                        FontAwesomeIcons.arrowCircleRight,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void signUp(String email, String password) {}
}
