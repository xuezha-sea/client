import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../function.dart';

class Button extends StatefulWidget {
  final Widget child;

  final FutureVoidCallback? onPressed;

  final Color color;

  Button(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  bool processing = false;

  Widget _box(
      {required Widget child, required bool disable, required Color color}) {
    var box = child.center();
    if (!disable) {
      box = box.ripple(splashColor: Colors.white.withOpacity(0.1));
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return box
            .clipRRect(all: constraints.maxHeight)
            .width(processing ? constraints.maxHeight : constraints.maxWidth,
                animate: true)
            .decorated(
                color: color,
                borderRadius: BorderRadius.circular(constraints.maxHeight),
                boxShadow: [
                  BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 8))
                ],
                animate: true);
      },
    );
  }

  void _process(bool value) {
    if (this.mounted) {
      this.setState(() {
        processing = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final disable = this.widget.onPressed == null || processing;
    final color = disable ? Colors.grey : this.widget.color;
    return _box(
            child: processing
                ? CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ).padding(all: 4)
                : this.widget.child,
            disable: disable,
            color: color)
        .gestures(
            onTap: disable
                ? null
                : () async {
                    _process(true);
                    if (this.widget.onPressed != null) {
                      await this.widget.onPressed!();
                    }
                    _process(false);
                  },
            behavior: HitTestBehavior.deferToChild)
        .animate(Duration(milliseconds: 200), Curves.fastLinearToSlowEaseIn);
  }
}

class PrimaryButton extends StatelessWidget {
  final Widget child;

  final FutureVoidCallback? onPressed;

  PrimaryButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Button(
        child: child, onPressed: onPressed, color: theme.primaryColor);
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget child;

  final FutureVoidCallback? onPressed;

  SecondaryButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Button(
        child: child, onPressed: onPressed, color: theme.colorScheme.secondary);
  }
}
