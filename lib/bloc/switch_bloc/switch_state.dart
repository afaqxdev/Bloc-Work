import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{
  final bool switchValue;
  final double sliderValue;
  const SwitchState({
    this.switchValue=false,
    this.sliderValue=1

  });

  SwitchState copyWith({bool? switchValue,double? sliderValue}){
    return SwitchState(sliderValue:sliderValue??this.
    sliderValue ,switchValue:switchValue??this.switchValue );
  }
  
  @override
 
  List<Object?> get props => [switchValue,sliderValue];

}