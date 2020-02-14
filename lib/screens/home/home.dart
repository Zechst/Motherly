import 'package:flutter/material.dart';

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

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motherly')
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.calendar_today,
        //   color: Color(0XFFFA9A9A),
        //   ),
        
        //   title: Text('Appointment'),
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text('Appointment'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          title: Text('Rewards'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          title: Text('Social'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          title: Text('Messages'),
        ),BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Profile'),
        ),
      ],
      currentIndex: _selectedIndex,
      // selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    ),
    );
  }
}