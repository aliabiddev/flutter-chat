import 'package:flutter/material.dart';
import 'package:my_chat_app/pages/edit_profile_page.dart';
import 'package:my_chat_app/pages/rooms_page.dart';
import 'package:my_chat_app/pages/search_page.dart';
import 'package:my_chat_app/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: ListTile(
              title: const Text('Rooms'),
              onTap: () {
                Navigator.push(
                  context,
                  RoomsPage.route(), // Use RoomsPage.route here
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Search'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
