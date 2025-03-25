import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/search_weather_screen.dart';
import 'services/database_service.dart';

class AppColors {
  static const MaterialColor primary = Colors.blue;
  static const Color primaryBackground = Color(0xFF2196F3);
  static const Color cardBackground = Colors.white;
  static const Color errorColor = Color(0xFFEF5350);
  static final Color secondaryBackground = Colors.grey[100]!;
  static final Color textPrimary = Colors.grey[800]!;
  static final Color textSecondary = Colors.grey[600]!;
  static const Color white = Colors.white;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initializeDatabase();
  runApp(WeatherJournalApp());
}

class WeatherJournalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.primaryBackground,
        cardColor: AppColors.cardBackground,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryBackground,
          error: AppColors.errorColor,
          surface: AppColors.cardBackground,
          onSurface: AppColors.textPrimary,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/search': (context) => SearchWeatherScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}
