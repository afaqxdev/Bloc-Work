import 'package:block_work/bloc/counter_bloc/counter_bloc.dart';
import 'package:block_work/bloc/image_bloc/image_bloc.dart';
import 'package:block_work/bloc/switch_bloc/switch_bloc.dart';
import 'package:block_work/ui/image_example/image_example.dart';
import 'package:block_work/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/list_bloc/list_bloc.dart';
import 'ui/list_example/list_example.dart';

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
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => ToDoBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ToDOList(),
        ));
  }
}
