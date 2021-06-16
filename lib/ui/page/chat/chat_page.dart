import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatPage extends StatelessWidget {
  final String uid;

  ChatPage({required this.uid});

  Widget _body() {
    return Chat(
        messages: [
          types.TextMessage(
              id: "me",
              author: types.User(id: "me"),
              text: "Hello",
              createdAt: DateTime.now().microsecondsSinceEpoch~/1000-2000000
          ),
          types.TextMessage(
              id: "1",
              author: types.User(id: "1"),
              text: "Hello",
              createdAt: DateTime.now().microsecondsSinceEpoch~/1000-1000000
          ),
          types.TextMessage(
              id: "me",
              author: types.User(id: "me"),
              text: "Hello",
              createdAt: DateTime.now().microsecondsSinceEpoch~/1000-500000
          ),
          types.TextMessage(
            id: "2",
            author: types.User(id: "${this.uid}"),
            text: "Hello",
            createdAt: DateTime.now().microsecondsSinceEpoch~/1000
          ),

        ],
        onSendPressed: (text) {
          print("send message ${text.toJson()}");
        },
        user:
            types.User(id: "me", firstName: "0x", lastName: "02x", role: types.Role.user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("0x987541254eb1a45e2c3e5894cc-${this.uid}"),
      ),
      body: _body(),
    );
  }
}
