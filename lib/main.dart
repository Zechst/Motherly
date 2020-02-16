import 'package:flutter/material.dart';
import 'package:motherly/screens/authentication/emailsignin.dart';
import 'package:motherly/screens/authentication/login.dart';
import 'package:motherly/screens/setProfile.dart';
import 'package:motherly/screens/home/home.dart';
import 'package:motherly/shared/themedata.dart';
import 'package:provider/provider.dart';
import 'package:motherly/services/auth.dart';
import 'package:motherly/models/user.dart';
import 'package:motherly/screens/authentication/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
        //Theme
        theme: myTheme,

        //Routes
        routes: {
         '/': (context) => LoginScreen(),
         '/emailSignIn': (context) => EmailSignIn() ,
         '/register': (context) => Register(),
         '/home': (context) => Home()
        }

      ),
    );
  }
}
