import 'package:flutter/material.dart';
import 'package:social_app/screens/home/tabs/chats_tab.dart';
import 'package:social_app/screens/home/tabs/status_tab.dart';
import 'package:social_app/screens/home/tabs/calls_tab.dart';
import 'package:social_app/screens/new_message_screen.dart';
import 'package:social_app/screens/profile_screen.dart';
import 'package:social_app/screens/edit_contacts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.maybePop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.black87),
            ),
          ),
        ),
        title: const Text('INMOOD'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => Navigator.pushNamed(context, ProfileScreen.route),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.settings, color: Colors.black87),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.black45,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                tabs: const [
                  Tab(text: 'Chats'),
                  Tab(text: 'Status'),
                  Tab(text: 'Calls'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatsTab(),
          StatusTab(),
          CallsTab(),
        ],
      ),
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    final Color primary = Theme.of(context).colorScheme.primary;
    // Status tab has its own two FABs inside the tab (to match mock), so none here
    if (_tabController.index == 1) return const SizedBox.shrink();
    // Chats: show Edit (yellow) + New Message (blue). Calls: single blue.
    if (_tabController.index == 0) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'fab-edit-chats',
            backgroundColor: const Color(0xFFFFD54F),
            child: const Icon(Icons.edit, color: Colors.black87),
            onPressed: () => Navigator.pushNamed(context, EditContactsScreen.route),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'fab-newmessage-chats',
            backgroundColor: primary,
            child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, NewMessageScreen.route),
          ),
        ],
      );
    }
    return FloatingActionButton(
      heroTag: 'fab-calls',
      backgroundColor: primary,
      child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
      onPressed: () => Navigator.pushNamed(context, NewMessageScreen.route),
    );
  }
}


