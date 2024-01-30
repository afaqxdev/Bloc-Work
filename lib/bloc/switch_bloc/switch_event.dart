// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{
  const SwitchEvent();
  @override
  List<Object?> get props=>[];
}
class SwitchButton extends SwitchEvent{}
class SliderButton extends SwitchEvent{
double value;
SliderButton({required this.value});
@override
List<Object?> get props=>[value];
}