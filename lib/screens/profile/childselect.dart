import 'package:flutter/material.dart';
import 'package:motherly/custom_icons.dart';

class ChildSelect extends StatefulWidget {
  @override
  _ChildSelectState createState() => _ChildSelectState();
}

class _ChildSelectState extends State<ChildSelect> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 3.0,
                title: Text('Every Child is an Angel',
                    style: TextStyle(
                      fontFamily: 'FredokaOne',
                      fontSize: 20.0,
                    ))

                //child: Text('Tell us about yourself'),
                ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 0.0),
                child: Column(
                  children: <Widget>[
                    Text(
                        "Select your kid's gender to get started",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Ebrima',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 60.0),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 30.0,),
                        SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: RaisedButton.icon(
                                  icon: Icon(CustomIcons.boy_underwear, color: Colors.white, size: 50.0),
                                  label: Text('',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold)),
                                  color: Color(0xFFFA9A9A),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/childselect');
                                  }),
                            ),
                            SizedBox(width: 10.0,),
                        SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: RaisedButton.icon(
                                  icon: Icon(CustomIcons.girl_underwear, color: Colors.white,size: 50.0,),
                                  label: Text('',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold)),
                                  color: Color(0xFFFA9A9A),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/childselect');
                                  }),
                            ),
                            SizedBox(width: 10.0,),
                        SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: RaisedButton.icon(
                                  icon: Icon(CustomIcons.pregnancy, color: Colors.white, size: 50.0,),
                                  label: Text('',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold)),
                                  color: Color(0xFFFA9A9A),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/childselect');
                                  }),
                            )
                      ],
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
                                        child: Text('Add a kid to continue',
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
                            ), 
                          ],
                        )),
                ));
  }
}
