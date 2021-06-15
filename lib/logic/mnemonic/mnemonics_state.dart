part of 'mnemonics_cubit.dart';

@immutable
abstract class MnemonicsState implements Equatable {
  final List<String> source;

  final List<String> words;

  MnemonicsState({required this.source, required this.words});

  @override
  List<Object?> get props => [this.source, this.words];

  @override
  bool get stringify => true;
}

class MnemonicsVerifying extends MnemonicsState {
  final bool partVerified;

  final bool verified;

  MnemonicsVerifying(
      {required List<String> source,
      required List<String> words,
      required this.partVerified,
      required this.verified})
      : super(source: source, words: words);

  MnemonicsVerifying copyWith(
      {List<String>? source,
      List<String>? words,
      bool? partVerified,
      bool? verified}) {
    return MnemonicsVerifying(
        source: source ?? this.source,
        words: words ?? this.words,
        partVerified: partVerified ?? this.partVerified,
        verified: verified ?? this.verified);
  }

  @override
  List<Object?> get props =>
      [this.source, this.words, this.partVerified, this.verified];
}

class MnemonicsVerified extends MnemonicsState {
  MnemonicsVerified({required List<String> source, required List<String> words})
      : super(source: source, words: words);
}
