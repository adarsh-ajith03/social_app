import 'package:flutter/material.dart';
import 'package:social_app/screens/welcome_screen.dart';
import 'package:social_app/screens/home/home_screen.dart';
import 'package:social_app/screens/new_message_screen.dart';
import 'package:social_app/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:social_app/state/app_state.dart';
import 'package:social_app/screens/edit_contacts_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4E5BFF)),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INMOOD',
      theme: baseTheme.copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4E5BFF),
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (_) => const WelcomeScreen(),
        HomeScreen.route: (_) => const HomeScreen(),
        NewMessageScreen.route: (_) => const NewMessageScreen(),
        ProfileScreen.route: (_) => const ProfileScreen(),
        EditContactsScreen.route: (_) => const EditContactsScreen(),
      },
    );
  }
}
