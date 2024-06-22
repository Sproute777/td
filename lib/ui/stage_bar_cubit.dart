import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../game_controller/game_repository.dart';

part 'stage_bar_cubit.freezed.dart';

@injectable
class StageBarCubit extends Cubit<StageBarState> {
  final GameRepository _repository;
  Listenable? _merge;
  StageBarCubit(this._repository)
      : super(const StageBarState(killed: 0, missed: 0, wave: 0, minerals: 0)) {
    _init();
  }

  void _init() {
    _merge = Listenable.merge([
      _repository.killedNotifier,
      _repository.mineralsNotifier,
      _repository.missedNotifier
    ]);
    _merge?.addListener(_listen);
  }

  void _listen() {
    emit(StageBarState(
      killed: _repository.killedNotifier.value,
      missed: _repository.missedNotifier.value,
      wave: _repository.waveNotifier.value,
      minerals: _repository.mineralsNotifier.value,
    ));
  }

  @override
  Future<void> close() {
    _merge?.removeListener(_listen);
    _merge = null;
    return super.close();
  }
}

@Freezed(
    map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: false)
class StageBarState with _$StageBarState {
  const StageBarState._();

  const factory StageBarState({
    required int killed,
    required int missed,
    required int wave,
    required int minerals,
  }) = _StageBarState;
}
