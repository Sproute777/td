import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../game_controller/domain/game_repository.dart';
import '../game_controller/domain/weapon_model.dart';
part 'inventory_bloc.freezed.dart';

@injectable
class InventoryCubit extends Cubit<InventoryState> {
  final GameRepository _repository;
  InventoryCubit(this._repository) : super(const InventoryState.init());

  void init() {
    _repository.init();
    _repository.weaponsNotifier.addListener(_listen);
  }

  void _listen() {
    emit(InventoryState.loaded(_repository.weaponsNotifier.value));
  }

  @override
  Future<void> close() {
    _repository.weaponsNotifier.removeListener(_listen);
    return super.close();
  }
}

@Freezed(
    map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: false)
sealed class InventoryState with _$InventoryState {
  const InventoryState._();
  const factory InventoryState.init() = InitInventoryBloc;
  const factory InventoryState.loaded(List<WeaponModel> weapons) =
      LoadedInventoryBloc;
}
