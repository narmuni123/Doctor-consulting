import 'package:doctorconsultationproject/screens/bottomNavigationBar/account.dart';
import 'package:doctorconsultationproject/screens/bottomNavigationBar/camera.dart';
import 'package:doctorconsultationproject/screens/bottomNavigationBar/history.dart';
import 'package:doctorconsultationproject/screens/bottomNavigationBar/live.dart';
import 'package:flutter/material.dart';

import 'bottomNavigationBar/Home.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  List<Widget> _indexedArray = [
    Home(),
    Live(),
    Camera(),
    History(),
    Account(),
  ];
  List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> items;
    items = [
      BottomNavigationBarItem(
      icon: Icon(Icons.add,
      color:  index == 0
      ? Colors.blue
          : Colors.grey,
      ),
      title: new Text("Booking",
      style: TextStyle(
      fontFamily: 'Roboto',
      color: index == 0
      ? Colors.blue
          : Colors.grey,
      )),),
      BottomNavigationBarItem(
        icon: Icon(Icons.movie_outlined,
          color:  index == 1
              ? Colors.blue
              : Colors.grey,
        ),
        title: new Text("Live",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: index == 1
                  ? Colors.blue
                  : Colors.grey,
            )),),
      new BottomNavigationBarItem(
        icon: Icon(Icons.camera_alt_outlined,
          color:  index == 2
              ? Colors.blue
              : Colors.grey,
        ),
        title: new Text("Camera",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: index == 2
                  ? Colors.blue
                  : Colors.grey,
            )),),
      new BottomNavigationBarItem(
        icon: Icon(Icons.hourglass_bottom,
          color:  index == 3
              ? Colors.blue
              : Colors.grey,
        ),
        title: new Text("History",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: index == 3
                  ? Colors.blue
                  : Colors.grey,
            )),),
      new BottomNavigationBarItem(
        icon: Icon(Icons.person_outline,
          color:  index == 4
              ? Colors.blue
              : Colors.grey,
        ),
        title: new Text("Account",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: index == 4
                  ? Colors.blue
                  : Colors.grey,
            )),),
    ];

    return items;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: _indexedArray[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: getBottomNavItems(),
      ),
    );
  }
}
