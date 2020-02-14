import 'package:flutter/material.dart';
import 'package:motherly/screens/authentication/login.dart';
import 'package:motherly/screens/setProfile.dart';
import 'package:motherly/screens/home/home.dart';
import 'package:motherly/shared/themedata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //Theme
      theme: myTheme,

      //Routes
      routes: {
        '/': (context) => LoginScreen()
      }
    ); 

      }
    }
  