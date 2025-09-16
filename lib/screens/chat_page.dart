import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String userName;
  final String userAvatar;
  final String lastMessage;

  const ChatPage({
    Key? key,
    required this.userName,
    required this.userAvatar,
    required this.lastMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(userAvatar)),
            const SizedBox(width: 10),
            Text(userName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(lastMessage),
                  ),
                ),
                // Add more messages here
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(icon: const Icon(Icons.send), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
