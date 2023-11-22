import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toon/screens/favorite.dart';
import 'package:toon/screens/home.dart';
import 'package:toon/screens/meals.dart';
import 'package:toon/screens/settings.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

const SelectColor = Color.fromRGBO(255, 162, 0, 1);

class TabsScreens extends StatefulWidget {
  const TabsScreens({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreensState();
  }
}

class _TabsScreensState extends State<TabsScreens> {
  int _selectedIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen();

    var currentScreenTitle = 'Home';

    if (_selectedIndex == 1) {
      currentScreenTitle = 'Favorite';
      activePage = FavoriteScreen();
    }
    if (_selectedIndex == 2) {
      currentScreenTitle = 'Meals';
      activePage = MealsScreen();
    }
    if (_selectedIndex == 3) {
      currentScreenTitle = 'Settings';
      activePage = SettingsScreen();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          currentScreenTitle,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _selectScreen,
          backgroundColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                  color: _selectedIndex == 0 ? SelectColor : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.book,
                  color: _selectedIndex == 1 ? SelectColor : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.heart_circle,
                  color: _selectedIndex == 2 ? SelectColor : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.settings,
                  color: _selectedIndex == 3 ? SelectColor : Colors.white,
                ),
                label: ''),
          ]),
    );
  }
}
