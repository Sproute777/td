import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'game/game_main.dart';
import 'game/game_test.dart';
import 'game_controller/game_controller.dart';
import 'ui/components/weaponview_widget.dart';
import 'ui/inventory/bloc/inventory_bloc.dart';
import 'ui/inventory/view/inventory.dart';
import 'ui/stage_bar/bloc/stage_bar_bloc.dart';
import 'ui/stage_bar/view/stage_bar_view.dart';
import 'weapon/weapon_component.dart';

class ProdApp extends StatelessWidget {
  const ProdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => GameController(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => InventoryBloc()..add(InvInit()),
            ),
            BlocProvider(
              create: (context) =>
                  StageBarBloc(bloc: context.read<InventoryBloc>()),
            ),
          ],
          child: const MaterialApp(home: _AppView()),
        ));
  }
}

class _AppView extends StatefulWidget {
  const _AppView({Key? key}) : super(key: key);

  @override
  State<_AppView> createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
  bool pause = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const StageBarView(),
      Expanded(
        child: GameWidget<GameMain>(
          game: GameTest(
            gameController: RepositoryProvider.of<GameController>(context),
            stageBarBloc: context.read<StageBarBloc>(),
            inventoryBloc: context.read<InventoryBloc>(),
          ),
          overlayBuilderMap: {
            WeaponViewWidget.name: WeaponViewWidget.builder,
            'start': _pauseMenuBuilder,
          },
          initialActiveOverlays: const ['start'],
        ),
      ),
      const Inventory(),
    ]);
  }

  Widget _pauseMenuBuilder(BuildContext ctx, GameMain game) {
    return Center(
        child: Container(
      width: 100,
      height: 100,
      color: Colors.orange,
      child: Center(
          child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          if (pause) {
            game.resumeEngine();
            game.start();
            ctx
                .read<InventoryBloc>()
                .add(const InvWeaponSelected(WeaponType.mg));
            game.overlays.remove('start');
          }
        },
        child: const Text('Start'),
      )),
    ));
  }
}
