import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:business_tracker/features/settings/navigation/settings_arguments.dart';
import 'package:business_tracker/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/navigation/dashboard_arguments.dart';

class AppRoutes {
  static const String dashboardPage = Dashboard.routeName;
  static const String settingsPage = SettingsPage.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardPage:
        return MaterialPageRoute(
          builder: (_) => Dashboard(),
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
