import 'package:flutter/material.dart';
import '../core/constants/packages.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', redirect: (_, __) => '/home'),
    GoRoute(
      path: '/home',
      pageBuilder: (_, __) => noTransitionPage(const HomePage()),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (_, __) => noTransitionPage(const SettingsPage()),
    ),
  ],
);

/// アニメーションなしページ遷移用ヘルパー
CustomTransitionPage<void> noTransitionPage(Widget child) {
  return CustomTransitionPage<void>(
    child: child,
    transitionsBuilder: (_, __, ___, child) => child, // アニメなし
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}
