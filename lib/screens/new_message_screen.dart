import 'package:flutter/material.dart';
import 'package:social_app/widgets/avatar.dart';
import 'package:provider/provider.dart';
import 'package:social_app/state/app_state.dart';

class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({super.key});

  static const String route = '/new-message';

  @override
  Widget build(BuildContext context) {
    final suggestions = context.watch<AppState>().contacts;

    return Scaffold(
      appBar: AppBar(title: const Text('New Message')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search name or number',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: suggestions.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = suggestions[index];
                return ListTile(
                  leading: Avatar(imageUrl: item.imageUrl),
                  title: Text(item.name),
                  onTap: () => Navigator.pop(context, item.name),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


