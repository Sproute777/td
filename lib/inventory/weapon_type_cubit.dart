import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../game_controller/domain/game_repository.dart';
import '../settings/weapon_settings.dart';

part 'weapon_type_cubit.freezed.dart';

@injectable
class WeaponTypeCubit extends Cubit<WeaponTypeState> {
  final GameRepository _repository;
  WeaponTypeCubit(this._repository)
      : super(const WeaponTypeState(type: WeaponType.none));

  void init() {
    _repository.weaponTypeNotifier.addListener(_listen);
  }

  void selected(WeaponType type) {
    _repository.setWeaponType(type);
  }

  void _listen() {
    emit(WeaponTypeState(type: _repository.weaponTypeNotifier.value));
  }

  @override
  Future<void> close() {
    _repository.weaponsNotifier.removeListener(_listen);
    return super.close();
  }
}

@Freezed(
    map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: false)
class WeaponTypeState with _$WeaponTypeState {
  const WeaponTypeState._();
  const factory WeaponTypeState({required WeaponType type}) = _WeaponTypeState;
}
