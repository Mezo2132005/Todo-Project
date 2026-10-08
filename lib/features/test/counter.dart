import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/core/utls/colors_const.dart';
import 'package:todo_project/cubit/cubit/counter_cubit.dart';


class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.pureWhite,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            IconButton(
              onPressed: () {context.read<CounterCubit>().add();},
              icon: Icon(Icons.add, size: 32, color: ColorsConst.black),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  context.read<CounterCubit>().counter.toString(),
                  style: TextStyle(fontSize: 24));
              },
            ),
            IconButton(
              onPressed: () {context.read<CounterCubit>().remove();},
              icon: Icon(Icons.remove, size: 32, color: ColorsConst.black),
            ),
          ],
        ),
      ),
    );
  }
}
