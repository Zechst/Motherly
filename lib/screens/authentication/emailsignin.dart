import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motherly/services/auth.dart';

class EmailSignIn extends StatefulWidget {
  @override
  _EmailSignInState createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final String logoPink = 'assets/logopink.svg';
  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          // TODO make AppBar Floating and scrollable to prevent it from covering up the elements in body
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text('Join Now',
                      style: TextStyle(color: Color(0xFFFA9A9A))))
            ],
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Center(
              child: Column(children: <Widget>[
                SvgPicture.asset(
                  logoPink,
                  fit: BoxFit.contain,
                  height: 170.0,
                ),
                Text('Motherly',
                    style: TextStyle(
                        fontFamily: 'FredokaOne',
                        fontSize: 20.0,
                        color: Color(0xFFFA9A9A))),
                Form(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(onChanged: (val) {
                      setState(() => email = val);
                    }),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        })
                  ],
                )),
                SizedBox(height: 50.0),
                SizedBox(
                  width: 100.0,
                  height: 40.0,
                  child: RaisedButton(
                    color: Color(0xFFFA9A9A),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text('Log In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    onPressed: () async {
                      print(email);
                      print(password);

                      // dynamic result = await _auth.signInAnon();
                      // if (result == null){
                      //   print('error signing in');
                      // } else {
                      //   print ('signed in');
                      //   print (result.uid);
                      //   Navigator.pushNamed(context, '/home');
                      // }
                    },
                  ),
                ),
              ]),
            ),
          ))))
    ]);
  }
}
