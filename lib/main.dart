import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/database/isar_provider.dart';
import 'core/database/isar_service.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/screens/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Isar once at startup
  final isar = await IsarService.init();

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const MobilePrepApp(),
    ),
  );
}

class MobilePrepApp extends StatelessWidget {
  const MobilePrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const MainNavigationScreen(),
    );
  }
}
