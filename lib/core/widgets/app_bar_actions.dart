import 'package:flutter/material.dart';
import '/../../../../core/constants/constants.dart';
import '/../../../../core/theme/theme.dart';
import '/../../../../core/utils/utils.dart';
import '/../../../../core/widgets/widgets.dart';

class AppBarActions extends StatelessWidget {
  final VoidCallback? onSearch;
  final VoidCallback? onUser;

  const AppBarActions({
    super.key,
    this.onSearch,
    this.onUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (AppParameters.showSearchIcon)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearch ?? () {},
          ),
        if (AppParameters.showUserIcon)
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: onUser ?? () {},
          ),
      ],
    );
  }
}
