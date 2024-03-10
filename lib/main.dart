import 'package:block_work/bloc/counter_bloc/counter_bloc.dart';
import 'package:block_work/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:block_work/bloc/image_bloc/image_bloc.dart';
import 'package:block_work/bloc/post_bloc/post_bloc.dart';
import 'package:block_work/bloc/switch_bloc/switch_bloc.dart';
import 'package:block_work/repo/favourite_repository.dart';
import 'package:block_work/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/list_bloc/list_bloc.dart';
import 'ui/post_screen/post_screen.dart';

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
          BlocProvider(create: (_) => PostBloc()),
          BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            // This is the theme of your application.da            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const PostScreen(),
        ));
  }
}
