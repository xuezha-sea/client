import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

Widget expandedBody(Widget head, Widget body, Widget foot) {
  var children = [head, body.expanded(), foot].toList();

  return Flex(
    direction: Axis.vertical,
    children: children,
  );
}

Widget expandedBodyWithHeaderAndSubHeader(
    {required BuildContext context,
    required String title,
    required String subTitle,
    required Widget body,
    required Widget foot}) {
  var theme = Theme.of(context);
  var header = [
    Text(
      title,
      style: theme.textTheme.headline6,
    ).padding(all: 8),
    Text(
      subTitle,
      style: theme.textTheme.bodyText2!.copyWith(color: theme.disabledColor),
    ).padding(all: 8)
  ];
  return expandedBody(header.toColumn(), body, foot);
}
