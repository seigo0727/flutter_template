import 'package:flutter/material.dart';
import '../constants/packages.dart';

class BottomMenu extends StatelessWidget {
  final int currentIndex;

  const BottomMenu({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/settings');
            break;
          // case 2:
          //   context.go('/profile');
          //   break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'プロフィール'),
      ],
    );
  }
}
