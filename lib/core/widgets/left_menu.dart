import 'package:flutter/material.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('左メニュー', style: TextStyle(color: Colors.white)),
          ),
          ListTile(title: Text('メニュー1')),
          ListTile(title: Text('メニュー2')),
        ],
      ),
    );
  }
}
