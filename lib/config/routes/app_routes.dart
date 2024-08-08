import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:business_tracker/features/products/presentation/pages/all_products.dart';
import 'package:business_tracker/features/settings/presentation/navigation/settings_arguments.dart';
import 'package:business_tracker/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/navigation/dashboard_arguments.dart';

class AppRoutes {
  static const String authenticationPage = AuthenticationPage.routeName;
  static const String dashboardPage = Dashboard.routeName;
  static const String settingsPage = SettingsPage.routeName;
  static const String allProductsPage = AllProducts.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authenticationPage:
        return MaterialPageRoute(
          builder: (_) => AuthenticationPage(),
        );
      case dashboardPage:
        return MaterialPageRoute(
          builder: (_) => Dashboard(),
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      case allProductsPage:
        return MaterialPageRoute(
          builder: (_) => AllProducts(),
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
