import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';

import '../../data/model/account.dart';
import '../../data/repository/account_repository.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountRepository repository;

  AccountCubit({required this.repository}) : super(AccountLoading()) {
    this.repository.account().then((value) {
      if (value == null) {
        return this.emit(HasNotAccount());
      } else {
        this.emit(AccountLoaded(account: value));
      }
    });
  }

  Future<void> create(List<String> mnemonics) async {
    Uint8List seed = bip39.mnemonicToSeed(mnemonics.join(' '));
    // ECPrivateKey
    KeyData keyData = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    String privateKey = bytesToHex(keyData.key);
    EthPrivateKey ethKey = EthPrivateKey.fromHex(privateKey);
    String publicKey = bytesToHex(privateKeyBytesToPublic(ethKey.privateKey));
    final address = await ethKey.extractAddress();

    final account = Account(
        mnemonics: mnemonics,
        privateKey: privateKey,
        publicKey: publicKey,
        address: address.hex);

    await repository.save(account);

    this.emit(AccountLoaded(account: account));
  }
}
