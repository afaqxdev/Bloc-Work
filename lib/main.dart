import 'package:block_work/bloc/counter_bloc/counter_bloc.dart';
import 'package:block_work/bloc/switch_bloc/switch_bloc.dart';
import 'package:block_work/ui/counter_example/counter_screen.dart';
import 'package:block_work/ui/switch_example/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => SwitchBloc())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SwitchScreen(),
        ));
  }
}
