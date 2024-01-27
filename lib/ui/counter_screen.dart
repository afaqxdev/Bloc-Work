
import 'package:block_work/bloc/counter_bloc/counter_bloc.dart';
import 'package:block_work/bloc/counter_bloc/counter_event.dart';
import 'package:block_work/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'dart:developer'as developer;
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    developer.log("Build");
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                 state.counter.toString(),
                  style: const TextStyle(fontSize: 49),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // print( context.read<CounterBloc>().c.toString())
                      context.read<CounterBloc>().add(Increament());
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 49),
                    )),
                const SizedBox(
                  width: 70,
                ),
                ElevatedButton(
                    onPressed: () {
                                            context.read<CounterBloc>().add(Decreament());

                    },
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 49),
                    )),
              ],
            )
          ]),
    );
  }
}
