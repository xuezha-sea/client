import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:uuid/uuid.dart';

import '../app_route.dart';
import '../component/chat/chat_item.dart';

class ChatListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uuid = Uuid();

    var list = List.filled(10, 0)
        .map((e) => uuid.v4())
        .map((e) => ChatItem(
            name: e,
            content: "${uuid.v1()}",
            onPressed: () => AppRoute.goChat(e)))
        .toList();

    return ListView(
      itemExtent: 96,
      children: list,
    );
  }
}
