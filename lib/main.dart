import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/config/theme/bloc/theme_state.dart';
import 'package:business_tracker/config/theme/blue_theme.dart';
import 'package:business_tracker/config/theme/dark_theme.dart';
import 'package:business_tracker/config/theme/light_theme.dart';
import 'package:business_tracker/config/theme/purple_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_routes.dart';
import 'features/dashboard/presentation/pages/dashboard.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Theme Demo',
          theme: state.theme,
          onGenerateRoute: AppRoutes.generateRoute,
          home: Dashboard(),
        );
      },
    );
  }
}
