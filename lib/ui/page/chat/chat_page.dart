import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatPage extends StatefulWidget {
  final String uid;

  ChatPage({required this.uid});

  @override
  State<StatefulWidget> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final List<types.Message> messages = [];

  Widget _body() {
    return Chat(
        messages: messages,
        theme: DefaultChatTheme(inputBorderRadius: BorderRadius.zero),
        onSendPressed: (text) {
          setState(() {
            this.messages.insert(
                0,
                types.TextMessage.fromPartial(
                    author: types.User(
                        createdAt:
                            DateTime.now().microsecondsSinceEpoch ~/ 1000,
                        id: "me"),
                    id: "${DateTime.now().microsecondsSinceEpoch}",
                    partialText: text));
            this.messages.insert(
                0,
                types.TextMessage.fromPartial(
                    author: types.User(
                        createdAt:
                            DateTime.now().microsecondsSinceEpoch ~/ 1000,
                        id: "${this.widget.uid}"),
                    id: "${DateTime.now().microsecondsSinceEpoch}",
                    partialText: text));
          });
        },
        user: types.User(
            id: "me", firstName: "0x", lastName: "02x", role: types.Role.user));
  }

  @override
  void initState() {
    super.initState();
    this.setState(() {
      [
        types.TextMessage(
            id: "me",
            author: types.User(id: "me"),
            text: "Hello",
            createdAt: DateTime.now().microsecondsSinceEpoch ~/ 1000 - 2000000),
        types.TextMessage(
            id: "1",
            author: types.User(id: "1"),
            text: "Hello",
            createdAt: DateTime.now().microsecondsSinceEpoch ~/ 1000 - 1000000),
        types.TextMessage(
            id: "me",
            author: types.User(id: "me"),
            text: "Hello",
            createdAt: DateTime.now().microsecondsSinceEpoch ~/ 1000 - 500000),
        types.TextMessage(
            id: "2",
            author: types.User(id: "${this.widget.uid}"),
            text: "Hello",
            createdAt: DateTime.now().microsecondsSinceEpoch ~/ 1000),
      ].forEach((element) {
        messages.insert(0, element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("0x987541254eb1a45e2c3e5894cc-${this.widget.uid}"),
      ),
      body: _body(),
    );
  }
}
