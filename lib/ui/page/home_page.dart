import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../data/model/account.dart';
import '../../logic/account/account_cubit.dart';
import '../app_route.dart';
import '../component/common/button.dart';

class HomePage extends StatelessWidget {
  Widget _accountLoading() {
    return Text("account loading");
  }

  Widget _hasNotAccount(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final riveComponent = RiveAnimation.asset(
      'assets/rive/ball.riv',
      fit: BoxFit.contain,
    ).height(256);

    final createAccount = PrimaryButton(
            onPressed: () async =>
                Navigator.of(context).pushNamed(AppRoute.createAccount),
            child: Text("创建账户").textColor(theme.colorScheme.onPrimary))
        .height(48)
        .center();

    final importAccount = TextButton(
            onPressed: () async =>
                Future.delayed(Duration(seconds: 2), () => print("导入账户")),
            child: Text("已有账号"))
        .height(48)
        .center();

    return Wrap(
      runSpacing: 16,
      children: [riveComponent, createAccount, importAccount],
    );
  }

  Widget _accountLoaded(Account account) {
    Future.delayed(
        Duration(seconds: 1),
        () => AppRoute.navigatorKey.currentState!
            .pushNamedAndRemoveUntil(AppRoute.main, (_) => false));

    return Wrap(
      runSpacing: 16,
      children: [
        ExtendedImage.network(
          account.avatar,
          cache: true,
          borderRadius: BorderRadius.all(Radius.circular(96)),
        )
            .parent(({required child}) => Hero(tag: "avatar", child: child))
            .constrained(width: 96, height: 96)
            .center(),
        Text("欢迎回家").center()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final blocBuilder = BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is HasNotAccount) {
          return _hasNotAccount(context);
        } else if (state is AccountLoaded) {
          return _accountLoaded(state.account);
        } else {
          return _accountLoading();
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: blocBuilder.center().padding(all: 16),
      ),
    );
  }
}
