import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buttons_cubit.dart';
import 'buttons_view.dart';

class ButtonsPage extends StatelessWidget {
  /// {@macro counter_page}
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ButtonsCubit(),
      child: ButtonsView(),
    );
  }
}