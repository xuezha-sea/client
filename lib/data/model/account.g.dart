// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    mnemonics:
        (json['mnemonics'] as List<dynamic>).map((e) => e as String).toList(),
    privateKey: json['privateKey'] as String,
    publicKey: json['publicKey'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'mnemonics': instance.mnemonics,
      'privateKey': instance.privateKey,
      'publicKey': instance.publicKey,
      'address': instance.address,
    };
