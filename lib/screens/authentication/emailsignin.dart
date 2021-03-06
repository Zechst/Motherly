import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motherly/services/auth.dart';
import 'package:motherly/shared/constant.dart';
import 'package:motherly/shared/loading.dart';

//TODO Fix signin redirect to homepage. Currently does nothing.

class EmailSignIn extends StatefulWidget {
  @override
  _EmailSignInState createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final String logoPink = 'assets/logopink.svg';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Stack(children: <Widget>[
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
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
                                  decoration: textInputDecoration.copyWith(
                                      labelText: 'Email'),
                                  validator: (val) => val.isEmpty
                                      ? 'Enter a valid email'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  }),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      labelText: 'Password',
                                      // Toggles Password Visibility
                                      suffixIcon: IconButton(
                                          onPressed: _toggleVisibility,
                                          icon: _isHidden
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility))),
                                  validator: (val) => val.length < 8
                                      ? 'Please enter 8 characters or more'
                                      : null,
                                  obscureText: _isHidden ? true : false,
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
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Invalid email or password';
                                  loading = false;
                                });
                              } else if (result != null) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/home', (_) => false);
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
                        style:
                            TextStyle(color: Color(0xffd32f2f), fontSize: 14.0),
                      )
                    ]),
                  ),
                ))))
          ]);
  }
}
