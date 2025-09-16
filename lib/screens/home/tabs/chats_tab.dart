import 'package:flutter/material.dart';
import 'package:social_app/widgets/avatar.dart';
import 'package:provider/provider.dart';
import 'package:social_app/state/app_state.dart';
import 'package:social_app/screens/contacts_list_screen.dart';
import 'package:social_app/screens/chat_page.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _section(
          context,
          title: 'Friends',
          children: app.contacts
              .map(
                (c) => _ChatTile(
                  name: c.name,
                  message: c.lastMessage,
                  time: c.time,
                  avatarColor: Colors.blueGrey,
                  imageUrl: c.imageUrl,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        _section(
          context,
          title: 'Groups',
          children: app.groups
              .map(
                (g) => _ChatTile(
                  name: g.name,
                  message: g.lastMessage,
                  time: g.time,
                  avatarColor: Colors.blueGrey,
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
                builder: (_) => const ContactsListScreen(title: 'All Friends'),
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

class _ChatTile extends StatelessWidget {
  const _ChatTile({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarColor,
    this.imageUrl,
  });

  final String name;
  final String message;
  final String time;
  final Color avatarColor;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    app.isFavorite(name);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: Avatar(imageUrl: imageUrl, radius: 22, color: avatarColor),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(message),
      trailing: Text(time, style: const TextStyle(color: Colors.black54)),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChatPage(
              userName: name,
              userAvatar: imageUrl ?? '',
              lastMessage: message,
            ),
          ),
        );
      },
      onLongPress: () => context.read<AppState>().toggleFavorite(name),
    );
  }
}
