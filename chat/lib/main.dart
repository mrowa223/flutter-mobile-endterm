import 'package:chat/screens/auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/home_screen.dart';
import 'package:chat/screens/auth/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:chat/helper/helper_function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  }


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightBlue[400],
          scaffoldBackgroundColor: Colors.lightBlue[25]),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }

}

//class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //@override
  //Widget build(BuildContext context) {
    //return MaterialApp(
      //title: 'Flutter Chat UI',
      //debugShowCheckedModeBanner: false,
      //theme: ThemeData(
        //primaryColor: Colors.red,
        //accentColor: Color(0xFFFEF9EB),
      //),
      //home: HomeScreen(),
    //);
  //}
  //}