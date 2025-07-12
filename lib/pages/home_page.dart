import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sell_page.dart';
import '../tab/gadget_tab.dart';
import '../tab/makeup_tab.dart';
import '../tab/clothes_tab.dart';
import '../tab/furniture_tab.dart';
import 'package:medicalappui/util/my_tab.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // My tabs
  List<Widget> myTabs = const [
    MyTab(iconPath: 'lib/icons/furniture.png'),

    MyTab(iconPath: 'lib/icons/wardrobe.png'),

    MyTab(iconPath: 'lib/icons/cosmetics.png'),

    MyTab(iconPath: 'lib/icons/gadget.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
                size: 36,
              ),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
          actions: [
            Expanded(
              child: Center(
                child: Text(
                  'REVINTAGE',
                  style: TextStyle(
                    fontFamily: 'Times New Roman', // Apply Times New Roman font
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Adjust color as necessary
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[800],
                  size: 36,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.brown[50],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundImage: AssetImage('lib/icons/profile.jpg'), // Replace with your image
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Welcome, Iness!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.sell, color: Colors.blueGrey[600]),
                  title: const Text(
                    'Sell',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SellPage()),
                    ); // Navigate to SellPage
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.blueGrey[600]),
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: myTabs,
              indicatorColor: Colors.blueGrey,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  furnitureTab(),
                  clothesTab(),
                  makeupTab(),
                  gadgetTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
