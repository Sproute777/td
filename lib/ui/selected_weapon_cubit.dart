import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../game_controller/game_repository.dart';
import '../settings/weapon_settings.dart';

part 'selected_weapon_cubit.freezed.dart';

@injectable
class SelectedWeaponCubit extends Cubit<SelectedWeaponState> {
  final GameRepository _repository;
  SelectedWeaponCubit(this._repository)
      : super(const SelectedWeaponState(type: WeaponType.none));

  void init() {
    _repository.selectedTypeNotifier.addListener(_listen);
  }

  void selected(WeaponType type) {
    _repository.selectedWeapon(type);
  }

  void _listen() {
    emit(SelectedWeaponState(type: _repository.selectedTypeNotifier.value));
  }

  @override
  Future<void> close() {
    _repository.weaponsNotifier.removeListener(_listen);
    return super.close();
  }
}

@Freezed(
    map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: false)
class SelectedWeaponState with _$SelectedWeaponState {
  const SelectedWeaponState._();
  const factory SelectedWeaponState({required WeaponType type}) =
      _SelectedWeaponState;
}
