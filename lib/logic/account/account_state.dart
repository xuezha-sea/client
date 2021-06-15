part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {

  final Account account;

  AccountLoaded({required this.account});

}

class HasNotAccount extends AccountState {}
