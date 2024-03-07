import 'package:equatable/equatable.dart';

class ToDoState extends Equatable{

  final List<String> toDoList;
  const  ToDoState ({
    this.toDoList=const [],
});
  
  ToDoState copyWith({List<String>? toDoList}){
    return ToDoState(
      toDoList: toDoList??this.toDoList,
    );
  }
  @override
  List<Object?> get props => [];
}