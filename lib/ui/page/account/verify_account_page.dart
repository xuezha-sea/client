import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../logic/account/account_cubit.dart';
import '../../../logic/mnemonic/mnemonics_cubit.dart';
import '../../app_route.dart';
import '../../component/common/button.dart';
import '../../component/layout.dart';

class VerifyAccountPage extends StatelessWidget {
  List<Widget> _wordCards(
      List<String> words, ThemeData theme, ValueChanged? onPressed) {
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
            )
                .padding(vertical: 12, horizontal: 8)
                .card()
                .gestures(onTap: () => onPressed?.call(e))))
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final blocBuilder =
        BlocBuilder<MnemonicsCubit, MnemonicsState>(builder: (context, state) {
      MnemonicsCubit cubit = context.read();

      bool partVerified =
          state is MnemonicsVerifying ? state.partVerified : false;

      bool verified = state is MnemonicsVerifying ? state.verified : false;

      var sources = _wordCards(state.source, theme,
          partVerified == true ? (value) => cubit.add(value) : null);

      var words =
          _wordCards(state.words, theme, (value) => cubit.remove(value));
      var content = Flex(
        direction: Axis.vertical,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: words,
          )
              .constrained(minHeight: 48 * 3, width: double.maxFinite)
              .decorated(
                  color: (partVerified ? theme.disabledColor : theme.errorColor)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4))
              .padding(all: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: sources,
          ).expanded(),
        ],
      );

      return expandedBodyWithHeaderAndSubHeader(
        context: context,
        title: "验证您的助记词",
        subTitle: "点击单词，把他们按正确的顺序放在一起。",
        body: content,
        foot: Text("验证")
            .textColor(theme.colorScheme.onPrimary)
            .parent(({required child}) => PrimaryButton(
                child: child,
                onPressed: verified
                    ? () async {
                        await context.read<AccountCubit>().create(state.words);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoute.home, (_) => false);
                      }
                    : null))
            .height(48),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("创建账户"),
      ),
      body: SafeArea(child: blocBuilder.padding(all: 16)),
    );
  }
}
