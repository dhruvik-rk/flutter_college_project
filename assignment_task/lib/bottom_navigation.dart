import 'package:assignment_task/discover.dart';
import 'package:assignment_task/inbox.dart';
import 'package:assignment_task/user.dart';
import 'package:flutter/material.dart';

import 'document.dart';
import 'location.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;

  final List<Widget> pages = [
    DiscoverPage(),
    LoctionPage(),
    InboxPage(),
    DocumentPage(),
    UserPage(),
  ];

  updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0, //bottom navigation bar shadow = null
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined, color: Colors.black54,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined, color: Colors.black54,),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined, color: Colors.black54,),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.picture_as_pdf_outlined, color: Colors.black54,),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined, color: Colors.black54,),
              label: ''
          ),
        ],
        currentIndex: _currentIndex,
        onTap: updateIndex,
      ),
    );
  }
}