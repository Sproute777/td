import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:td/game/game_main.dart';
import 'package:td/game/game_test.dart';
import 'package:td/ui/inventory/bloc/inventory_bloc.dart';
import 'package:td/ui/inventory/view/inventory.dart';
import 'package:td/ui/components/weaponview_widget.dart';
import 'package:td/ui/stage_bar/bloc/stage_bar_bloc.dart';
import 'package:td/weapon/weapon_component.dart';

import 'game_controller/game_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.fullScreen();
  await Flame.device.setOrientation(DeviceOrientation.portraitUp);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
          child: const MaterialApp(home: AppView()),
        ));
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<StageBarBloc, StageBarState>(
          builder: (context, state) {
            return Row(
                children: [
              Text('killed ${state.killed}'),
              Text('missed ${state.missed}'),
              Text('wave ${state.wave}'),
              Text('minerals ${state.minerals}'),
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/neutual/mine_cluster.png',
                    fit: BoxFit.cover),
              ),
            ].expand((e) => [e, const Spacer()]).toList());
          },
        ),
      ),
      body: GameWidget<GameMain>(
        game: GameTest(
            gameController: RepositoryProvider.of<GameController>(context)),
        overlayBuilderMap: {
          WeaponViewWidget.name: WeaponViewWidget.builder,
          'start': _pauseMenuBuilder,
        },
        initialActiveOverlays: const ['start'],
      ),
      bottomSheet: const Inventory(),
    );
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
          padding: const EdgeInsets.all(16.0),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          game.start();
          ctx.read<InventoryBloc>().add(const InvWeaponSelected(WeaponType.mg));
          game.overlays.remove('start');
        },
        child: const Text('Start'),
      )),
    ));
  }
}
