import 'package:flutter/material.dart';
import 'package:social_app/screens/home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String route = '/welcome';

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              const Text(
                'Welcome to INMOOD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5FF),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text(
                          'SOCIAL\nINMOOD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4E5BFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Read our Privacy Policy. Tap Agree and Continue to\naccept the Terms of Services.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.4),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushReplacementNamed(context, HomeScreen.route),
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text('Agree & Continue'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}


