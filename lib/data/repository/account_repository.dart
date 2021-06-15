import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/account.dart';

class AccountRepository {
  Future<Account?> account() async {
    return SharedPreferences.getInstance().then((value) async {
      final jsonStr = value.getString("account");
      if (jsonStr != null) {
        final json = JsonDecoder().convert(jsonStr);
        return Account.fromJson(json);
      }
      return null;
    });
  }

  Future<void> save(Account account) async {
    final json = JsonEncoder().convert(account);

    return await SharedPreferences.getInstance()
        .then((value) => value.setString("account", json));
  }
}
