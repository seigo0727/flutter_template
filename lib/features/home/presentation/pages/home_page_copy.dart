import 'package:flutter/material.dart';
import '/../../../../core/constants/constants.dart';
import '/../../../../core/theme/theme.dart';
import '/../../../../core/utils/utils.dart';
import '/../../../../core/widgets/widgets.dart';
import '../../parameters/ui_parameters.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'ホーム',
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text('Item 1'),
            Text('Item 2'),
            Text('Item 3'),
            Text('Item 4'),
            Text('Item 5'),
            // もっとアイテムを追加してもスクロール可能
          ],
        ),
      ),
      showDrawer: UiParameters.showDrawer,
      showEndDrawer: UiParameters.showEndDrawer,
      currentIndex: 0,
    );
  }
}
