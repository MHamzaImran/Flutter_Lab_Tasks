import 'package:flutter/material.dart';
import 'package:mad_lab1/screens/lab7/bottomnavbar_screen.dart';
import 'package:mad_lab1/screens/profile/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'assignment1/welcome.dart';
import 'bl_project/bl.dart';
import 'lab10/task1.dart';
import 'lab12/task1.dart';
import 'lab3.dart';
import 'lab4/lab4.dart';
import 'lab5/lab5task3.dart';
import 'lab7/tabbar_screen.dart';
import 'lab9/todo_screen.dart';
import 'lab9_s/todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    if (!mounted) return;
    Navigator.pop(context);
  }

  final projectItems = [
    'Splash Screen',
    'Welcome Screen',
    'Profile',
    'Restful APIs Integration',
    'Generating Random Numbers',
    'Nested Widgets',
    'Top Navigation Bar',
    'Bottom Navigation Bar',
    'Online Search List Fetched from API',
    'Bluetooth Connection',
    'Custom Stream',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width / 100;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Mobile Application Development"),
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              child: const Text(
                'Flutter Lab Tasks',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Profile
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Profile(
                              name: "Hamza Imran",
                              email: "hamza@gmail.com",
                              phone: "0300-1234567",
                              address: "House # 123, Sector # 6, Islamabad",
                              imageName: 'assets/profile.png',
                              biometric: true,
                            )));
              },
            ),
            // Fetch Data from API using Future Builder
            ListTile(
              title: const Text('Restful API'),
              leading: const Icon(Icons.api),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MadLab3()));
              },
            ),
            // random number
            ListTile(
              title: const Text('Random Number'),
              leading: const Icon(Icons.shuffle),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MadLab4()));
              },
            ),
            // nested widgets
            ListTile(
              title: const Text('Nested Widgets'),
              leading: const Icon(Icons.widgets),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Lab3Task3()));
              },
            ),
            // welcome screen
            ListTile(
              title: const Text('Welcome Screen'),
              leading: const Icon(Icons.wb_sunny),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()));
              },
            ),
            // top navigation bar
            ListTile(
              title: const Text('Top Navigation Bar'),
              leading: const Icon(Icons.navigation),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TabBarScreen()));
              },
            ),
            // bottom navigation bar
            ListTile(
              title: const Text('Bottom Navigation Bar'),
              leading: const Icon(Icons.navigation),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBarScreen()));
              },
            ),
            // list of todos
            ListTile(
              title: const Text('Todo App'),
              leading: const Icon(Icons.list),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TodoListScreen()));
              },
            ),

            // list of todos modifies
            ListTile(
              title: const Text('Todo App (Modified)'),
              leading: const Icon(Icons.list),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaskListScreen()));
              },
            ),
            // online search list
            ListTile(
              title: const Text('Online Search List'),
              leading: const Icon(Icons.search),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchListScreen()));
              },
            ),
            // bluetooth connection
            ListTile(
              title: const Text('Bluetooth Connection'),
              leading: const Icon(Icons.bluetooth),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BluetoothDeviceScreen()));
              },
            ),
            // custom stream
            ListTile(
              title: const Text('Custom Stream'),
              leading: const Icon(Icons.stream),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Lab12()));
              },
            ),
            // logout
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            _logout(context);
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        )),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Project Overview',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenWidth * 5),
                  const Text(
                    'This Flutter project was created during a semester for learning purposes. It covers various aspects of Dart and Flutter development along with other functionalities:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: screenWidth * 5),
                  for (var i = 0; i < projectItems.length; i++)
                    ListTile(
                      leading: const Icon(Icons.arrow_right),
                      title: Text(projectItems[i]),
                    ),
                  SizedBox(height: screenWidth * 5),
                  const Text(
                    'Created by',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenWidth * 5),
                  const Text(
                    'Muhammad Hamza Imran',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
