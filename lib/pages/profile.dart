import 'package:collagecompanion/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;
  String name = 'Sushant Raj';
  String urn = '190280118';
  String crn = ' 194113';
  String branch = 'CSE';
  String batch = '2K19';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.normal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF5F5F5),
        // title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                signOff();
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              });
            },
            child: const Text(
              'LOGOUT',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            buildPro(),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  showData(FontAwesomeIcons.user, name),
                  showData(FontAwesomeIcons.university, urn + ',' + crn),
                  showData(FontAwesomeIcons.table, batch),
                  showData(FontAwesomeIcons.networkWired, branch),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPro() => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey,
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/icons/naruto.png'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  Widget showData(IconData ico, String s) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              ico,
              color: Color(0xff1976d2),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              s,
              style: optionStyle,
            ),
          ],
        ),
      );

  Future<void> signOff() async {
    await _auth.signOut();
  }
}
