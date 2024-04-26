import 'package:flutter/material.dart';
import 'package:weather_app/feature/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      // theme: AppTheme.darkThemeMode,
      home: HomePage(),
    );
  }
}
