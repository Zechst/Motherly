import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motherly/services/auth.dart';
import 'package:motherly/shared/constant.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final String logoPink = 'assets/logopink.svg';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
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
                      Text('Login Details',
                          textAlign: TextAlign
                              .left), //TODO Shift this line towards the left on appscreen
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Please enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'Password'),
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
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() => error = 'Please enter a valid email');
                      }
                    }

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
              SizedBox(height: 15.0,),
              Text(error, style: TextStyle(color: Color(0xffd32f2f), fontSize: 14.0)) //TODO Consider adding the error message under the textformfield 
            ]),
          ),
        ))));
  }
}
