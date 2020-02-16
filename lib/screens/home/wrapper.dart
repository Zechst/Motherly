import 'package:flutter/material.dart';
import 'package:motherly/screens/authentication/login.dart';
import 'package:provider/provider.dart';
import 'package:motherly/models/user.dart';
import 'package:motherly/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either Home or Login screen
    if (user == null) {
      return LoginScreen();
    } else {
      return Home();
    }
  }
}