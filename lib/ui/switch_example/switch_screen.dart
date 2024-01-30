import 'package:block_work/bloc/switch_bloc/switch_bloc.dart';
import 'package:block_work/bloc/switch_bloc/switch_event.dart';
import 'package:block_work/bloc/switch_bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    developer.log("Build");
    return Scaffold(
      appBar: AppBar(title: const Text("Switch Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.switchValue!=current.switchValue,
              builder: (context, state) {
                    developer.log("Switch");
                return Switch(
                  value: state.switchValue,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SwitchButton());
                  },
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
                            buildWhen: (previous, current) => previous.sliderValue!=current.sliderValue,

              builder: (context, state) {
                    developer.log("Container");

                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderButton(value: value));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
