import 'package:flutter/material.dart';
import 'package:motherly/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:motherly/models/user.dart';
import 'package:motherly/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}