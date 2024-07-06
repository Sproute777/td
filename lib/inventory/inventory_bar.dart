import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game_controller/game_controller.dart';
import '../game_controller/game_event.dart';
import 'inventory_bloc.dart';
import 'weapon_type_cubit.dart';

class InventoryBar extends StatefulWidget {
  const InventoryBar({super.key});

  @override
  State<InventoryBar> createState() => _InventoryBarState();
}

class _InventoryBarState extends State<InventoryBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 100,
        child: BlocBuilder<WeaponTypeCubit, WeaponTypeState>(
          builder: (context, selectedState) {
            return BlocBuilder<InventoryCubit, InventoryState>(
                builder: (context, state) {
              switch (state) {
                case InitInventoryBloc():
                  return const Center(
                    child: Text('Loading...'),
                  );
                case LoadedInventoryBloc(:final weapons):
                  return Row(children: [
                    ...[
                      for (int i = 0; i < weapons.length; i++)
                        GestureDetector(
                          onTap: () {
                            if (weapons[i].type != selectedState.type) {
                              final controller = context.read<GameController>();
                              controller.send(const GameEvent.weaponSelected());
                              context
                                  .read<WeaponTypeCubit>()
                                  .selected(weapons[i].type);
                            }
                          },
                          child: Opacity(
                            opacity: weapons[i].type == selectedState.type
                                ? 1.0
                                : 0.4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox.fromSize(
                                  size: const Size(64, 64),
                                  child: Image.asset(
                                      'assets/images/weapon/${weapons[i].assetPath}.png'),
                                ),
                                Container(
                                  color: Colors.white,
                                  width: 64,
                                  height: 30,
                                  child: Text(
                                    '${weapons[i].type.name} \n ${weapons[i].cost}',
                                    style: TextStyle(
                                        color: weapons[i].type ==
                                                selectedState.type
                                            ? Colors.black
                                            : Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ]
                        .expand((w) => [
                              w,
                              const SizedBox(
                                width: 40,
                              )
                            ])
                        .toList()
                      ..insert(
                        0,
                        const SizedBox(
                          width: 40,
                        ),
                      )
                  ]);
              }
            });
          },
        ),
      ),
    );
  }
}
