import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final Set<String> _favoriteContacts = <String>{};
  final List<Contact> contacts = <Contact>[
    Contact(
      name: 'Logan Nesser',
      lastMessage: 'Hy, How are your?',
      time: '7.30 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=400&auto=format&fit=crop',
    ),
    Contact(
      name: 'Logan Nesser',
      lastMessage: 'Hi.When you meet?',
      time: '5.30 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=400&auto=format&fit=crop',
    ),
    Contact(
      name: 'Logan Nesser',
      lastMessage: 'See you in LA!',
      time: '2.30 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  final List<GroupChat> groups = <GroupChat>[
    GroupChat(
      name: 'AI & Mechanism',
      lastMessage: 'Albert Dune: Hy,Every...',
      time: '7.30 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1504208434309-cb69f4fe52b0?q=80&w=400&auto=format&fit=crop',
    ),
    GroupChat(
      name: 'Weight Loss',
      lastMessage: 'David Thomas: Haha!',
      time: '5.30 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?q=80&w=400&auto=format&fit=crop',
    ),
    GroupChat(
      name: 'Trip',
      lastMessage: 'Albert Dune: See you',
      time: '2.30 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  // Statuses
  final List<Status> statuses = <Status>[];

  void addStatus(Status status) {
    statuses.insert(0, status);
    notifyListeners();
  }

  Set<String> get favoriteContacts => _favoriteContacts;

  bool isFavorite(String name) => _favoriteContacts.contains(name);

  void toggleFavorite(String name) {
    if (_favoriteContacts.contains(name)) {
      _favoriteContacts.remove(name);
    } else {
      _favoriteContacts.add(name);
    }
    notifyListeners();
  }

  void addContact(Contact contact) {
    contacts.add(contact);
    notifyListeners();
  }

  void updateContact(int index, Contact contact) {
    contacts[index] = contact;
    notifyListeners();
  }

  void deleteContact(int index) {
    contacts.removeAt(index);
    notifyListeners();
  }
}

class Status {
  Status({required this.text, required this.time, this.imageUrl});
  String text;
  String time;
  String? imageUrl;
}

class Contact {
  Contact({
    required this.name,
    required this.lastMessage,
    required this.time,
    this.imageUrl,
  });
  String name;
  String lastMessage;
  String time;
  String? imageUrl;
}

class GroupChat {
  GroupChat({
    required this.name,
    required this.lastMessage,
    required this.time,
    this.imageUrl,
  });
  String name;
  String lastMessage;
  String time;
  String? imageUrl;
}
