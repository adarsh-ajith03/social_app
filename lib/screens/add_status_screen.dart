import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/state/app_state.dart';

class AddStatusScreen extends StatefulWidget {
  const AddStatusScreen({Key? key}) : super(key: key);

  @override
  State<AddStatusScreen> createState() => _AddStatusScreenState();
}

class _AddStatusScreenState extends State<AddStatusScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Status')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'What\'s on your mind?',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final text = _controller.text.trim();
                if (text.isNotEmpty) {
                  final now = TimeOfDay.now();
                  final time =
                      '${now.hourOfPeriod}:${now.minute.toString().padLeft(2, '0')} ${now.period == DayPeriod.am ? 'AM' : 'PM'}';
                  context.read<AppState>().addStatus(
                    Status(text: text, time: time),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
