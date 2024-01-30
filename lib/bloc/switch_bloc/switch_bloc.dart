// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:block_work/bloc/switch_bloc/switch_event.dart';
import 'package:block_work/bloc/switch_bloc/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
SwitchBloc():super(const SwitchState()){
on<SwitchButton>(_switchbutton);
on<SliderButton>(_sliderbutton);
}
_switchbutton(SwitchButton button,Emitter<SwitchState> emitter){
emit(state.copyWith(
  switchValue: !state.switchValue,
));
}
_sliderbutton(SliderButton button,Emitter<SwitchState> emitter){

emit(state.copyWith(
sliderValue: button.value));
}
}