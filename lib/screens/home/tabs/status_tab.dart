import 'package:flutter/material.dart';
import 'package:social_app/widgets/avatar.dart';
import 'package:provider/provider.dart';
import 'package:social_app/state/app_state.dart';
import 'package:social_app/screens/add_status_screen.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _myStatus(context),
            const SizedBox(height: 16),
            const Text(
              'My Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _statusList(context),
            const SizedBox(height: 100),
          ],
        ),
        Positioned(
          right: 16,
          bottom: 88,
          child: FloatingActionButton(
            backgroundColor: const Color(0xFFFFD54F),
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddStatusScreen()),
              );
              if (result != null && result is String && result.isNotEmpty) {
                // TODO: Save status to state
                // Example: context.read<AppState>().addStatus(result);
              }
            },
            child: const Icon(Icons.edit, color: Colors.black87),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {},
            child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _myStatus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Friends',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: Stack(
              children: [
                const Avatar(radius: 22, color: Colors.brown),
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
            title: const Text('My Status'),
            subtitle: const Text('Tap to add status'),
            trailing: const Text(
              '7:30 PM',
              style: TextStyle(color: Colors.black54),
            ),
            onTap: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddStatusScreen()),
              );
              if (result != null && result is String && result.isNotEmpty) {
                // TODO: Save status to state
                // Example: context.read<AppState>().addStatus(result);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _statusList(BuildContext context) {
    final appState = context.watch<AppState>();
    final statuses = appState.statuses;
    final contacts = appState.contacts;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ...statuses.map(
            (s) => ListTile(
              leading: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF4E5BFF),
                    width: 3,
                    style: BorderStyle.solid,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Avatar(radius: 20, color: Colors.green),
              ),
              title: Text('You'),
              subtitle: Text(s.text),
              trailing: Text(
                s.time,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ),
          ...contacts.map(
            (c) => ListTile(
              leading: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF4E5BFF),
                    width: 3,
                    style: BorderStyle.solid,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Avatar(
                  radius: 20,
                  color: Colors.pinkAccent,
                  imageUrl: c.imageUrl,
                ),
              ),
              title: Text(c.name),
              subtitle: const Text('Today,8:30 PM'),
              trailing: Text(
                c.time,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
