import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String logoWhite = 'assets/logowhite.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFA9A9A), Color(0xFFFD4F5F)])),
            child: Padding(
              //padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Center(
                  child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    logoWhite,
                    fit: BoxFit.contain,
                    height: 170.0,
                  ),
                  Text('Motherly',
                      style: TextStyle(
                          fontFamily: 'FredokaOne',
                          fontSize: 30.0,
                          color: Colors.white)),
                  SizedBox(height: 20.0),
                  Text("Baby's Edge to be Healthier,",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'FredokaOne',
                          fontSize: 15.0,
                          color: Colors.white)),
                  Text("Smarter and Sociable",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'FredokaOne',
                          fontSize: 15.0,
                          color: Colors.white)),

                  SizedBox(
                    height: 20.0,
                  ),
                  GoogleSignInButton(
                    onPressed: () {},
                    text: 'Login with Google',
                    borderRadius: 10.0,
                  ),
                  SizedBox(height: 20.0),
                  FacebookSignInButton(
                      onPressed: () {},
                      text: 'Login with Facebook',
                      borderRadius: 10.0),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: 320.0,
                    height: 50.0,
                    child: OutlineButton(
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.email, color: Colors.white)),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Login with Email Address',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/emailSignIn');
                      },
                      color: Colors.transparent,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text("Why social login?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Calibri',
                          fontSize: 10.0,
                          color: Colors.white))
                ],
              )),
    ))));
  }
}
