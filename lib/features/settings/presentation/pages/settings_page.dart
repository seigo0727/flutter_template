import 'package:flutter/material.dart';
import '/../../../../core/constants/constants.dart';
import '/../../../../core/theme/theme.dart';
import '/../../../../core/utils/utils.dart';
import '/../../../../core/widgets/widgets.dart';
import '../../parameters/ui_parameters.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '設定',
      body: Center(child: Text('設定画面')),
      showDrawer: UiParameters.showDrawer,
      showEndDrawer: UiParameters.showEndDrawer,
      currentIndex: 1,
    );
  }
}
