import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List pages = [
    const HomeBody(),
    const Center(
      child: Text("Cart"),
    ),
    const Center(
      child: Text("Categories"),
    ),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.jpeg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.jpeg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.jpeg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.jpeg'),
                ),
              ],
              accountName: Text("Aashbin Sunar"),
              accountEmail: Text("aashbinsunar1@gmail.com"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              trailing: const Icon(
                Icons.arrow_forward_outlined,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.notifications_rounded),
              title: const Text("Notifications"),
              trailing: const Icon(
                Icons.arrow_forward_outlined,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.directions_bus_filled),
              title: const Text("Orders"),
              trailing: const Icon(
                Icons.arrow_forward_outlined,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              trailing: const Icon(
                Icons.arrow_forward_outlined,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Logout"),
              trailing: const Icon(
                Icons.arrow_forward_outlined,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.search_outlined),
      ),
      appBar: AppBar(
        title: const Text("My Shopping App"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
              ))
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Colors.black,
          currentIndex: currentIndex,
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.category_outlined),
                label: "Categories"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.purple,
            ),
          ]),
    );
  }
}
