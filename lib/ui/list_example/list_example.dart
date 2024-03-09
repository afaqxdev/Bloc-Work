import 'package:block_work/bloc/list_bloc/list_bloc.dart';
import 'package:block_work/bloc/list_bloc/list_event.dart';
import 'package:block_work/bloc/list_bloc/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDOList extends StatelessWidget {
  const ToDOList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO List"),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.toDoList.isNotEmpty) {
  return ListView.builder(
    itemCount:state.toDoList.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(index.toString()),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            context.read<ToDoBloc>().add(RemoveToDoEvent(task: state.toDoList[index]));
          },
        ),
      );
    },
  );
}else{
  return const CircularProgressIndicator();
}
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          for(var i=0;i<=10;i++){
        context.read<ToDoBloc>().add(AddToDoEvent(task: "Task:$i"));

          }
        },
      ),
    );
  }
}
