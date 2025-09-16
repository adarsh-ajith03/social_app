import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/state/app_state.dart';
import 'package:social_app/widgets/avatar.dart';

class ContactsListScreen extends StatelessWidget {
  const ContactsListScreen({super.key, this.title = 'Contacts'});

  final String title;

  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<AppState>().contacts;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final c = contacts[index];
          return ListTile(
            leading: Avatar(imageUrl: c.imageUrl),
            title: Text(c.name),
            subtitle: Text(c.lastMessage),
            trailing: Text(c.time, style: const TextStyle(color: Colors.black54)),
          );
        },
      ),
    );
  }
}


