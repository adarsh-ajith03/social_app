import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String route = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController(text: 'inmood_user');
  final TextEditingController _name = TextEditingController(text: 'Logan Nesser');
  final TextEditingController _phone = TextEditingController(text: '+1 555-0100');
  final TextEditingController _email = TextEditingController(text: 'logan@example.com');

  @override
  void dispose() {
    _username.dispose();
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(radius: 40),
                const SizedBox(height: 16),
                _field('Username', _username),
                _field('Name', _name),
                _field('Phone number', _phone, keyboardType: TextInputType.phone),
                _field('Email', _email, keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile saved')));
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController controller, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
      ),
    );
  }
}


