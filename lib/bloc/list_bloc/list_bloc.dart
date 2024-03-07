import 'package:bloc/bloc.dart';
import 'package:block_work/bloc/list_bloc/list_event.dart';
import 'package:block_work/bloc/list_bloc/list_state.dart';

class ToDoBloc extends Bloc<ToDoEvent,ToDoState>{
  final List<String> toDoList=[];
  ToDoBloc():super(const ToDoState()){
    on<AddToDoEvent>(addToDOEvent);
    on<AddToDoEvent>(removeToDOEvent);
  }

  void addToDOEvent(AddToDoEvent event,Emitter<ToDoState>emit){
   toDoList.add(event.task); 
    emit(state.copyWith(toDoList: List.from(toDoList)));

  }
  void removeToDOEvent(AddToDoEvent event,Emitter<ToDoState>emit){
   toDoList.remove(event.task); 
    emit(state.copyWith(toDoList: List.from(toDoList)));

  }
}