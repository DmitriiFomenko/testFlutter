import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buttons_cubit.dart';

class ButtonsView extends StatelessWidget {
  const ButtonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons page'),
          centerTitle: true,
        ),
        body: Center(child: BlocBuilder<ButtonsCubit, ButtunsState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Button1'),
                      onPressed: () =>
                          context.read<ButtonsCubit>().increment(0),
                    ),
                    Text('${state.value[0]}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Button2'),
                      onPressed: () =>
                          context.read<ButtonsCubit>().increment(1),
                    ),
                    Text('${state.value[1]}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Button3'),
                      onPressed: () =>
                          context.read<ButtonsCubit>().increment(2),
                    ),
                    Text('${state.value[2]}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Button4'),
                      onPressed: () =>
                          context.read<ButtonsCubit>().increment(3),
                    ),
                    Text('${state.value[3]}'),
                  ],
                ),
              ],
            );
          },
        )));
  }
}
