import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final List<String> mnemonics;

  final String privateKey;

  final String publicKey;

  final String address;

  //https://robohash.org/$publicKey
  String get avatar => "https://api.multiavatar.com/${address.hashCode}.png";

  // String get avatar => "https://i.pravatar.cc/96?u=$address";

  // String get avatar => "https://robohash.org/${address.hashCode}?set=set4";

  Account(
      {required this.mnemonics,
      required this.privateKey,
      required this.publicKey,
      required this.address});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
