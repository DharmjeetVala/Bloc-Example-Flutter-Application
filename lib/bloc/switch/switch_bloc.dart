
import 'package:bloc/bloc.dart';
import 'package:bloc_example_application/bloc/switch/switch_event.dart';
import 'package:bloc_example_application/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc() : super(SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_sliderValue);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event,Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderValue(SliderEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: event.slider));
  }
}