

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';
import '../bloc/counter/counter_event.dart';
import '../bloc/counter/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(
          "Counter Bloc Example", style: TextStyle(color: Colors.white),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(child: Text(state.counter.toString(), style: TextStyle(fontSize: 60),));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: Text("Increment")),
              SizedBox(width: 15),
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: Text("Decrement")),
            ],
          ),
        ],
      ),
    );
  }
}