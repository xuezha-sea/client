import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../app_route.dart';
import '../component/chat/chat_item.dart';

class ChatListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 96,
      children: [
        ChatItem(
          onPressed: () => AppRoute.goChat("1"),
        ),
        ChatItem(
          onPressed: () => AppRoute.goChat("2"),
        ),
        ChatItem(
          onPressed: () => AppRoute.goChat("3"),
        ),
        ChatItem(
          onPressed: () => AppRoute.goChat("4"),
        ),
        ChatItem(
          onPressed: () => AppRoute.goChat("5"),
        ),
        ChatItem(
          onPressed: () => AppRoute.goChat("6"),
        ),
        ChatItem(
          onPressed: () => AppRoute.goChat("7"),
        ),
        ChatItem(
          onPressed: () => AppRoute.goChat("8"),
        ),
      ],
    );
  }
}
