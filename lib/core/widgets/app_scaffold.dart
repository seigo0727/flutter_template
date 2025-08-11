import 'package:flutter/material.dart';
import '/../../../../core/constants/constants.dart';
import '/../../../../core/theme/theme.dart';
import '/../../../../core/utils/utils.dart';
import '/../../../../core/widgets/widgets.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showDrawer;
  final bool showEndDrawer;
  final int currentIndex;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.showDrawer,
    required this.showEndDrawer,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title),
        actions: [
          AppBarActions(
            onSearch: AppActions.onSearchTap,
            onUser: AppActions.onUserTap,
          ),
        ]
      ),
      drawer: (showDrawer || AppParameters.showDrawer)
          ? const LeftMenu()
          : null,
      endDrawer: (showEndDrawer || AppParameters.showDrawer)
          ? const RightMenu()
          : null,
      bottomNavigationBar: BottomMenu(currentIndex: currentIndex),
      body: body,
    );
  }
}
