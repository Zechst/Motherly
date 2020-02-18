import 'package:flutter/material.dart';
import 'package:motherly/services/auth.dart';

class Home extends StatefulWidget {

static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
// static const List<Widget> _widgetOptions = <Widget>[
//   Text(
//     'Index 0: Home',
//     style: optionStyle,
//   ),
//   Text(
//      'Index 1: Business',
//      style: optionStyle,
//   ),
//   Text(
//      'Index 2: School',
//      style: optionStyle,
//   ),
// ];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final AuthService _auth = AuthService();

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motherly', style: TextStyle(color: Colors.white),),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('Log Out', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, size: 30.0),
          title: Text('Appointment', style: TextStyle(fontSize: 6.0, color: Colors.white)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border, size: 30.0),
          title: Text('Rewards',style: TextStyle(fontSize: 6.0, color: Colors.white)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline, size: 30.0),
          title: Text('Social',style: TextStyle(fontSize: 6.0, color: Colors.white)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline, size: 30.0),
          title: Text('Messages',style: TextStyle(fontSize: 6.0, color: Colors.white)),
        ),BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30.0),
          title: Text('Profile',style: TextStyle(fontSize: 6.0, color: Colors.white)),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    ),
    );
  }
}