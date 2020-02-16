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
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

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
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Color(0xffd32f2f)),
                                errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffd32f2f))),
                                focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffd32f2f)))),
                            validator: (val) =>
                                val.isEmpty ? 'Enter a valid email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Color(0xffd32f2f)),
                                errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffd32f2f))),
                                focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffd32f2f)))),
                            validator: (val) => val.length < 8
                                ? 'Please enter 8 characters or more'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            })
                      ],
                    )),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 130.0,
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
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                            print('signin');
                            if (result == null){
                              setState(() => error = 'Failed to Sign in');
                            }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Color(0xffd32f2f), fontSize: 14.0),
                )
              ]),
            ),
          ))))
    ]);
  }
}
