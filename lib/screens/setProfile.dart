import 'package:flutter/material.dart';

class SetProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        
            child: Column(
      children: <Widget>[
        Text('Tell us about yourself',
            style: TextStyle(fontFamily: 'FredokaOne', fontSize: 20.0,))
      ],
      //child: Text('Tell us about yourself'),
    )));
  }
}
