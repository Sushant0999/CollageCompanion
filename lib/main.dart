import 'package:collagecompanion/data/calculator.dart';
import 'package:collagecompanion/data/faq.dart';
import 'package:collagecompanion/data/halloffame.dart';
import 'package:collagecompanion/data/library.dart';
import 'package:collagecompanion/data/qpapers.dart';
import 'package:collagecompanion/data/syllabus.dart';
import 'package:collagecompanion/login/forgotpassword.dart';
import 'package:collagecompanion/login/login.dart';
import 'package:collagecompanion/login/signup.dart';
import 'package:collagecompanion/metadata/question.dart';
import 'package:collagecompanion/utils/routes.dart';
import 'package:collagecompanion/pages/dashBoard.dart';
import 'package:collagecompanion/pages/updates.dart';
import 'package:collagecompanion/pages/profile.dart';
import 'package:collagecompanion/pages/homePage.dart';
import 'package:collagecompanion/data/faculty.dart';
import 'package:collagecompanion/data/calender.dart';
import 'package:collagecompanion/data/events.dart';
import 'package:collagecompanion/data/books.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'latoTextTheme',
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.cyanAccent.shade400,
        ),
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: "/login",
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.dashBoardRoute: (context) => DashBoard(),
        MyRoutes.updatesRoute: (context) => Updates(),
        MyRoutes.profileRoute: (context) => Profile(),
        MyRoutes.calenderRoute: (context) => Calender(),
        MyRoutes.eventsRoute: (context) => Events(),
        MyRoutes.facultyRoute: (context) => Faculty(),
        MyRoutes.faqRoute: (context) => Faq(),
        MyRoutes.halloffame: (context) => HallOfFame(),
        MyRoutes.libraryRoute: (context) => Library(),
        MyRoutes.qpapersRoute: (context) => QPapers(),
        MyRoutes.syllabusRoute: (context) => Syllabus(),
        MyRoutes.calculatorRoute: (context) => Calculator(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.signupRoute: (context) => SignUp(),
        MyRoutes.forgotpasswordRoute: (context) => ForgotPassword(),
        MyRoutes.questionRoute: (context) => Question(),
        MyRoutes.booksRoute: (context) => Books(),
      },
    );
  }
}


//flutter run --no-sound-null-safety