import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../theme.dart';

class ChatItem extends StatelessWidget {
  final VoidCallback onPressed;

  ChatItem({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        ChatAvatar(),
        Expanded(
            child: Wrap(
          runSpacing: 8,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Text("address or nickname")
                    .fontSize(titleSize)
                    .alignment(Alignment.centerLeft)
                    .expanded(),
                Text("昨天 16:20")
                    .fontSize(smallSize)
                    .textColor(secondaryTextColor)
              ],
            ).padding(right: 16),
            Text("last content")
                .fontSize(contentSize)
                .textColor(secondaryTextColor)
                .alignment(Alignment.centerLeft)
          ],
        ))
      ],
    ).ripple().gestures(onTap: this.onPressed);
  }
}

class ChatAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        ExtendedImage.network(
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2237571785,737973661&fm=224&gp=0.jpg",
          cache: true,
        ).clipRRect(all: 96),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: ChatAvatarBadge(number: 10),
        )
      ],
    ).padding(all: 16);
  }
}

class ChatAvatarBadge extends StatelessWidget {
  final int number;

  ChatAvatarBadge({required this.number});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Text("$number")
        .textColor(theme.colorScheme.onError)
        .fontSize(smallSize)
        .padding(all: 4)
        .backgroundColor(theme.errorColor)
        .clipRRect(all: 96);
  }
}
