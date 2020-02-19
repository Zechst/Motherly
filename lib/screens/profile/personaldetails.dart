import 'package:flutter/material.dart';
import 'package:motherly/shared/constant.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();

  // text field state
  String firstName = '';
  String lastName = '';
  String contactNum = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 3.0,
                title: Text('Personal Details',
                    style: TextStyle(
                      fontFamily: 'FredokaOne',
                      fontSize: 20.0,
                    ))

                //child: Text('Tell us about yourself'),
                ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                        'Your name and age will be visible to other mothers. Your age helps us introduce you to mothers at a similar stage of life',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Ebrima',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 60.0),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    labelText: 'First Name',
                                    counterStyle: TextStyle(fontSize: 20.0)),
                                validator: (val) => val.isEmpty
                                    ? 'Enter your first name'
                                    : null,
                                onChanged: (val) {
                                  setState(() => firstName = val);
                                }),
                            SizedBox(height: 30.0),
                            TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    labelText: 'Last Name',
                                    counterStyle: TextStyle(fontSize: 20.0)),
                                validator: (val) =>
                                    val.isEmpty ? 'Enter your last name' : null,
                                onChanged: (val) {
                                  setState(() => firstName = val);
                                }),
                            SizedBox(height: 30.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  labelText: "Mobile Number",
                                  hintText: '+65',
                                  hintStyle: TextStyle(color: Colors.grey[450]),
                                  counterStyle: TextStyle(fontSize: 20.0)),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter mobile number' : null,
                              onChanged: (val) {
                                setState(() => contactNum = val);
                              },
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 100.0),
                            SizedBox(
                              width: 250.0,
                              height: 40.0,
                              child: RaisedButton(
                                  color: Color(0xFFFA9A9A),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text('Continue',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/childselect');
                                  }),
                            ), // Only numbers can be entered
                          ],
                        ))
                  ],
                ))));
  }
}
