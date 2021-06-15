import 'package:flutter/cupertino.dart';
import 'page/main_page.dart';

import 'page/account/create_account_page.dart';
import 'page/account/verify_account_page.dart';
import 'page/home_page.dart';

class AppRoute {
  static String home = '/';

  static String createAccount = '/create-account';

  static String verifyAccount = '/verify-account';

  static String main = '/main';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Map<String, WidgetBuilder> routes = {
    home: (_) => HomePage(),
    createAccount: (_) => CreateAccountPage(),
    verifyAccount: (_) => VerifyAccountPage(),
    main: (_) => MainPage()
  };
}
