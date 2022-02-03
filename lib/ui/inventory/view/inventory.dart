import 'package:td/game_controller/game_controller.dart';
import 'package:td/ui/inventory/bloc/inventory_bloc.dart';

import 'package:td/weapon/weapon_component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  Color _mapWeaponColor(WeaponType weapon) {
    switch (weapon) {
      case WeaponType.cannon:
        return Colors.orange;
      case WeaponType.mg:
        return Colors.red;
      case WeaponType.missele:
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryBloc>().state;
    final List<WeaponType> weapons = state.listWeapons;
    return Row(children: [
      ...[
        for (int i = 0; i < weapons.length; i++)
          GestureDetector(
            onTap: () {
              if (weapons[i] != state.weapon) {
                final controller = context.read<GameController>();
                controller.send(controller, GameControl.weaponSelected);
                context
                    .read<InventoryBloc>()
                    .add(InvWeaponSelected(weapons[i]));
              }
            },
            child: Opacity(
              opacity: weapons[i] == state.weapon ? 0.8 : 0.6,
              child: Container(
                color: Colors.white,
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    '${weapons[i].name} \n ${state.weaponCost.isNotEmpty ? state.weaponCost[i] : "empty"}',
                    style: TextStyle(color: _mapWeaponColor(weapons[i])),
                  ),
                ),
              ),
            ),
          ),
      ]
          .expand((w) => [
                w,
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                )
              ])
          .toList()
        ..insert(
          0,
          const SizedBox(
            height: 40,
            width: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
        )
    ]);
  }
}
