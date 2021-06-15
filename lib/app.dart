import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import 'data/repository/account_repository.dart';
import 'logic/account/account_cubit.dart';
import 'ui/app_route.dart';
import 'ui/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountRepository repository = AccountRepository();

    return MaterialApp(
      initialRoute: AppRoute.home,
      routes: AppRoute.routes,
      navigatorKey: AppRoute.navigatorKey,
      theme: theme,
    ).parent(({required child}) => BlocProvider(
          create: (context) => AccountCubit(repository: repository),
          child: child,
        ));
  }
}
