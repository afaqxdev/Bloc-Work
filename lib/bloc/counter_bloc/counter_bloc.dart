import 'package:bloc/bloc.dart';
import 'package:block_work/bloc/counter_bloc/counter_event.dart';
import 'package:block_work/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<Increament>(
      _increament,
    );
    on<Decreament>(
      _decreament,
    );
  }

  void _increament(Increament increament, Emitter<CounterState> emit) {
  
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decreament(Decreament decreament, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
