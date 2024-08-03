import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/config/theme/bloc/theme_event.dart';
import 'package:business_tracker/config/theme/blue_theme.dart';
import 'package:business_tracker/config/theme/dark_theme.dart';
import 'package:business_tracker/config/theme/purple_theme.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/light_theme.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'settings_page';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeChanged(lightTheme),
                );
              },
              child: const Text('Light Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeChanged(darkTheme),
                );
              },
              child: const Text('Dark Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeChanged(blueTheme),
                );
              },
              child: const Text('Blue Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeChanged(purpleTheme),
                );
              },
              child: const Text('Purple Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
