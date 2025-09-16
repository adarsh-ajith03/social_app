import 'package:flutter/material.dart';

class MockCallScreen extends StatelessWidget {
  final String name;
  final String? imageUrl;

  const MockCallScreen({Key? key, required this.name, this.imageUrl})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
                  ? NetworkImage(imageUrl!)
                  : null,
              backgroundColor: Colors.blueGrey[700],
              child: imageUrl == null || imageUrl!.isEmpty
                  ? const Icon(Icons.person, size: 60, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 24),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Calling...',
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: const StadiumBorder(),
              ),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.call_end),
              label: const Text('End Call'),
            ),
          ],
        ),
      ),
    );
  }
}
