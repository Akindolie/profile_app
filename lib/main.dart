import 'package:flutter/material.dart';
import 'package:profile_app/screens/profile_screen.dart';
import 'package:profile_app/theme/app_theme.dart';

void main() {
  runApp(const ProfileApp());
}

final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (BuildContext context, ThemeMode value, Widget? child) {
        return MaterialApp(
          title: 'My Profile',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: value,
          home: ProfileScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
