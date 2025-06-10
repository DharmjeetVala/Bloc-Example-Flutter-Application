import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch/switch_bloc.dart';
import '../bloc/switch/switch_event.dart';
import '../bloc/switch/switch_state.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(
          'Switch Bloc Example', style: TextStyle(color: Colors.white),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Notification'),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous,current) => previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  print('switch');
                  return Switch(value: state.isSwitch, onChanged: (newValue) {
                    context.read<SwitchBloc>().add(EnableOrDisableNotification());
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 30),

          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous,current) => previous.sliderValue != current.sliderValue,
            builder: (context, state) {
              print('slider');
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.sliderValue),
              );
            },
          ),
          const SizedBox(height: 30,),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Slider(value: state.sliderValue, onChanged: (value) {
                context.read<SwitchBloc>().add(SliderEvent(slider: value));
              });
            },
          ),
        ],
      ),
    );
  }
}
