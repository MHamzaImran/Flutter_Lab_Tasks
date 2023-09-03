import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    TabBarView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 50),
            SizedBox(height: 10),
            Text('Home Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                  'This is the main screen of the app where you can view your personalized content, including your saved articles and recommended stories based on your interests.'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.search, size: 50),
            SizedBox(height: 10),
            Text('Search Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                  'This screen allows you to search for articles and stories based on keywords or topics of your interest. You can also filter your search results to refine your search.'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.person, size: 50),
            SizedBox(height: 10),
            Text('Profile Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                  'This screen displays your user profile where you can update your account settings, view your reading history, and manage your preferences for personalized content.'),
            ),
          ],
        ),
      ],
    ),
    const Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Lab 7'),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'LEFT',
                  ),
                  Tab(
                    text: 'MIDDLE',
                  ),
                  Tab(
                    text: 'RIGHT',
                  ),
                ],
              ),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
    );
  }
}
