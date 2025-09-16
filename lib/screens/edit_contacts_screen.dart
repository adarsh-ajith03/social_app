import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/state/app_state.dart';
import 'package:social_app/widgets/avatar.dart';

class EditContactsScreen extends StatelessWidget {
  const EditContactsScreen({super.key});

  static const String route = '/edit-contacts';

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Contacts & Chats')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Contact? created = await showDialog<Contact>(
            context: context,
            builder: (_) => const _EditContactDialog(),
          );
          if (created != null) context.read<AppState>().addContact(created);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: app.contacts.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final c = app.contacts[index];
          return ListTile(
            leading: Avatar(imageUrl: c.imageUrl),
            title: Text(c.name),
            subtitle: Text(c.lastMessage),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    final Contact? edited = await showDialog<Contact>(
                      context: context,
                      builder: (_) => _EditContactDialog(contact: c),
                    );
                    if (edited != null) context.read<AppState>().updateContact(index, edited);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => context.read<AppState>().deleteContact(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EditContactDialog extends StatefulWidget {
  const _EditContactDialog({this.contact});
  final Contact? contact;

  @override
  State<_EditContactDialog> createState() => _EditContactDialogState();
}

class _EditContactDialogState extends State<_EditContactDialog> {
  late final TextEditingController _name = TextEditingController(text: widget.contact?.name ?? '');
  late final TextEditingController _message = TextEditingController(text: widget.contact?.lastMessage ?? '');
  late final TextEditingController _time = TextEditingController(text: widget.contact?.time ?? '7.00 PM');
  late final TextEditingController _image = TextEditingController(text: widget.contact?.imageUrl ?? '');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _message.dispose();
    _time.dispose();
    _image.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.contact == null ? 'Add Contact' : 'Edit Contact'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(decoration: const InputDecoration(labelText: 'Name'), controller: _name, validator: _req),
              const SizedBox(height: 8),
              TextFormField(decoration: const InputDecoration(labelText: 'Last message'), controller: _message, validator: _req),
              const SizedBox(height: 8),
              TextFormField(decoration: const InputDecoration(labelText: 'Time'), controller: _time, validator: _req),
              const SizedBox(height: 8),
              TextFormField(decoration: const InputDecoration(labelText: 'Image URL (optional)'), controller: _image),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop<Contact>(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            Navigator.pop<Contact>(
              context,
              Contact(name: _name.text.trim(), lastMessage: _message.text.trim(), time: _time.text.trim(), imageUrl: _image.text.trim().isEmpty ? null : _image.text.trim()),
            );
          },
          child: const Text('Save'),
        )
      ],
    );
  }

  String? _req(String? v) => (v == null || v.trim().isEmpty) ? 'Required' : null;
}


