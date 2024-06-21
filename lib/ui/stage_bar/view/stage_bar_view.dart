import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/stage_bar_cubit.dart';

class StageBarView extends StatelessWidget {
  const StageBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: SizedBox.fromSize(
          size: Size(size.width, 60),
          child: BlocBuilder<StageBarCubit, StageBarState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Row(
                    children: [
                  Text('killed\n${state.killed}'),
                  Text('missed \n${state.missed}'),
                  Text('wave \n${state.wave}'),
                  Text('minerals \n${state.minerals}'),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/neutual/mine_cluster.png',
                        fit: BoxFit.cover),
                  ),
                ].expand((e) => [e, const Spacer()]).toList()),
              );
            },
          )),
    );
  }
}
