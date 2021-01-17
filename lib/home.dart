import 'package:flutter/material.dart';
import 'package:jobproject_1/job.dart';
import 'course_main.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Job(),
    CourseMain()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F6),
        elevation: 0.0,
        toolbarHeight: 10.0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap:(index){
          setState(() {
            _selectedIndex=index;
          });
        },
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label:'Home',
            icon:Icon(Icons.home,color:Colors.white ,)
          ),
          BottomNavigationBarItem(
            label:'Upskill',
            icon:Icon(Icons.chrome_reader_mode_outlined,color:Colors.white ,)
          ),
          BottomNavigationBarItem(
            label:'Profile',
            icon:Icon(Icons.person,color:Colors.white ,)
          ),
        ],
      )
    );
  }
}
