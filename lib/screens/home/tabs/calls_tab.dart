import 'package:flutter/material.dart';
import 'package:social_app/widgets/avatar.dart';
import 'package:provider/provider.dart';
import 'package:social_app/state/app_state.dart';
import 'package:social_app/screens/contacts_list_screen.dart';
import 'package:social_app/screens/mock_call_screen.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<AppState>().contacts;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _section(
          context,
          title: 'Friends',
          children: contacts
              .map(
                (c) => _CallTile(
                  name: c.name,
                  info: 'Recent call • ${c.time}',
                  icon: Icons.call,
                  iconColor: Colors.amber,
                  imageUrl: c.imageUrl,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        _section(
          context,
          title: 'Groups',
          children: context
              .watch<AppState>()
              .groups
              .map(
                (g) => _CallTile(
                  name: g.name,
                  info: g.lastMessage,
                  icon: Icons.call,
                  iconColor: Colors.amber,
                  imageUrl: g.imageUrl,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _section(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: children),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ContactsListScreen(title: 'All Calls'),
              ),
            ),
            icon: const Icon(Icons.chevron_right),
            label: const Text('See more'),
            style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
          ),
        ),
      ],
    );
  }
}

class _CallTile extends StatelessWidget {
  const _CallTile({
    required this.name,
    required this.info,
    required this.icon,
    required this.iconColor,
    this.imageUrl,
  });

  final String name;
  final String info;
  final IconData icon;
  final Color iconColor;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: Avatar(imageUrl: imageUrl, radius: 22, color: Colors.blueGrey),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(info),
      trailing: Icon(icon, color: iconColor),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MockCallScreen(name: name, imageUrl: imageUrl),
          ),
        );
      },
    );
  }
}
