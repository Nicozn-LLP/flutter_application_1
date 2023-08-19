import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:renttt/screens/profile_screen.dart';
import 'package:renttt/screens/rent_screen.dart';

import 'favourite_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottombar(),
    );
  }
}

class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedPos = 0;
  PageController _pageController = PageController();

  List<Widget> widgetsList = [
    const HomeScreen(),
    RentScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("RentEasy"),
        actions: [],
      ),
      body: PageView(
        controller: _pageController,
        children: widgetsList,
        onPageChanged: (index) {
          setState(() {
            selectedPos = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedPos,
        showElevation: true,
        backgroundColor: Colors.black, // Set the color to black
        onItemSelected: (index) {
          setState(() {
            selectedPos = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.post_add_rounded),
            title: Text('Post'),
            activeColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Text('Bookmarks'),
            activeColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_2),
            title: Text('Profile'),
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
