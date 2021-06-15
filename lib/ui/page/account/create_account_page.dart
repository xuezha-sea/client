import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../logic/mnemonic/mnemonics_cubit.dart';
import '../../component/common/button.dart';
import '../../component/layout.dart';
import '../../theme.dart';
import 'verify_account_page.dart';

class CreateAccountPage extends StatelessWidget {
  List<Widget> _words(List<String> words, ThemeData theme) {
    return words
        .asMap()
        .map((index, e) => MapEntry(
            index,
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "${index + 1} ",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: theme.unselectedWidgetColor.withOpacity(0.2))),
                TextSpan(text: "$e", style: theme.textTheme.bodyText1)
              ]),
            )))
        .values
        .map((e) => e.padding(vertical: 12, horizontal: 8).card())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final blocBuilder =
        BlocBuilder<MnemonicsCubit, MnemonicsState>(builder: (context, state) {
      MnemonicsCubit cubit = context.read();

      final content = Wrap(
        spacing: 8,
        alignment: WrapAlignment.center,
        children: _words(cubit.words, theme),
      );

      final footer = Wrap(
        runSpacing: 16,
        children: [
          Text(
            '切勿与任何人分享助记词，安全地存储它！',
            style:
                theme.textTheme.bodyText1!.copyWith(color: theme.accentColor),
          )
              .center()
              .padding(all: 16)
              .constrained(width: double.maxFinite)
              .decorated(
                color: theme.accentColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
          PrimaryButton(
              child: Text("继续").textColor(theme.colorScheme.onPrimary),
              onPressed: () async {
                await cubit.shuffle();
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                          value: cubit,
                          child: VerifyAccountPage(),
                        )));
              }).height(48).center()
        ],
      );

      return expandedBodyWithHeaderAndSubHeader(
          context: context,
          title: "您的助记词",
          subTitle: "按正确的顺序记下或复制这些单词，并将它们保存在安全的地方",
          body: content,
          foot: footer);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("创建账户"),
      ),
      body: SafeArea(child: blocBuilder.padding(all: 16))
          .parent(({required child}) => BlocProvider(
                create: (_) => MnemonicsCubit(),
                child: child,
              )),
    );
  }
}
