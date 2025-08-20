import 'package:flutter/material.dart';

// Import labubuDolls if it's defined in another file, or define it here if not imported
import '../data/labubu_dolls.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple.shade300, Colors.pink.shade300],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Labuland',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Discover Labubu Dolls',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            selected: true,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Labubu Collections',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          ...labubuDolls.map((doll) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: doll.theme.primary,
                child: const Icon(Icons.toys, color: Colors.white),
              ),
              title: Text(doll.name),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${doll.name} selected!'),
                    backgroundColor: doll.theme.primary,
                  ),
                );
              },
            );
          }),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('My Orders'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
