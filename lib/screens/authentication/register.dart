import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motherly/services/auth.dart';
import 'package:motherly/shared/constant.dart';
import 'package:motherly/shared/loading.dart';

//TODO fix register screen signup. Currently signs in but does not do anything but return error message

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Register'),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
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
                  //Text('™'),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          //TODO Shift this line towards the left on appscreen
                          SizedBox(height: 20.0),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Email',
                                  hintText: 'example@gmail.com',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[450])),
                              validator: (val) =>
                                  val.isEmpty ? 'Please enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Password',
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
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                      onPressed: _toggleVisibility,
                                      icon: _isHidden
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility))),
                              validator: (val) => val != password
                                  ? 'Password do not match'
                                  : null,
                              obscureText: _isHidden ? true : false,
                              onChanged: (val) {
                                setState(() => confirmPassword = val);
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
                            child: Text('Join Now',
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
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email, confirmPassword);
                          if (result == null) {
                            setState(() {
                              error = 'Please enter a valid email';
                              loading = false;
                            });
                          } else if (result != null) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/personaldetails', (_) => false);
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(error,
                      style: TextStyle(
                          color: Color(0xffd32f2f),
                          fontSize:
                              14.0)) //TODO Consider adding the error message under the textformfield
                ]),
              ),
            ))));
  }
}
