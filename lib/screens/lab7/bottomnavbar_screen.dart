import 'package:flutter/material.dart';
import 'package:mad_lab1/screens/lab7/tabbar_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.home, size: 100),
        SizedBox(height: 20),
        Text('Home Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        Text('This is the home page of the app',
            style: TextStyle(fontSize: 20, color: Colors.grey)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.search, size: 100),
        SizedBox(height: 20),
        Text('Search Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        Text('Search for anything you want',
            style: TextStyle(fontSize: 20, color: Colors.grey)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.person, size: 100),
        SizedBox(height: 20),
        Text('Profile Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        Text('View and edit your profile',
            style: TextStyle(fontSize: 20, color: Colors.grey)),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAD lab7'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          // info icon
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TabBarScreen()));
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
        ],
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        // Handle button tap
      ),
    );
  }
}
