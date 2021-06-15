import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bip39/bip39.dart' as bip39;

part 'mnemonics_state.dart';

class MnemonicsCubit extends Cubit<MnemonicsState> {
  List<String> words = [];

  MnemonicsCubit()
      : super(MnemonicsVerifying(
            source: [], words: [], partVerified: true, verified: false)) {
    words = bip39.generateMnemonic().split(' ');
    this.emit(MnemonicsVerifying(
        source: [...words]..shuffle(),
        words: [],
        partVerified: true,
        verified: false));
  }

  Future<void> add(String word) async {
    MnemonicsState state = this.state;
    if (state is MnemonicsVerifying) {
      if (state.source.indexOf(word) != -1) {
        var words = [...state.words]..add(word);
        this.emit(state.copyWith(
            words: words,
            source: [...state.source]..remove(word),
            partVerified: partVerified(words),
            verified: verified(words)));
      }
    }
  }

  Future<void> shuffle() async {
    this.emit(MnemonicsVerifying(
        source: [...words]..shuffle(),
        words: [],
        partVerified: true,
        verified: false));
  }

  Future<void> removeAt(int index) async {
    MnemonicsState state = this.state;
    if (state is MnemonicsVerifying) {
      this.emit(state.copyWith(words: [...state.words]..removeAt(index)));
    }
  }

  Future<void> remove(String word) async {
    MnemonicsState state = this.state;
    if (state is MnemonicsVerifying) {
      int index = state.words.indexOf(word);
      var words = [...state.words]..remove(word);
      if (index != -1) {
        this.emit(state.copyWith(
            words: words,
            source: [...state.source]..add(word),
            partVerified: partVerified(words),
            verified: verified(words)));
      }
    }
  }

  bool partVerified(List<String> words) {
    return this.words.join(' ').indexOf(words.join(' ')) == 0;
  }

  bool verified(List<String> words) {
    return this.partVerified(words) && this.words.length == words.length;
  }
}
