// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:td/game_controller/game_repository.dart' as _i3;
import 'package:td/ui/inventory_bloc.dart' as _i6;
import 'package:td/ui/selected_weapon_cubit.dart' as _i5;
import 'package:td/ui/stage_bar_cubit.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.GameRepository>(() => _i3.GameRepository());
    gh.factory<_i4.StageBarCubit>(
        () => _i4.StageBarCubit(gh<_i3.GameRepository>()));
    gh.factory<_i5.SelectedWeaponCubit>(
        () => _i5.SelectedWeaponCubit(gh<_i3.GameRepository>()));
    gh.factory<_i6.InventoryCubit>(
        () => _i6.InventoryCubit(gh<_i3.GameRepository>()));
    return this;
  }
}
