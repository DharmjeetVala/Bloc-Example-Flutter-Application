import 'package:bloc_example_application/ui/counter_screen.dart';
import 'package:bloc_example_application/ui/switch_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Bloc Examples',style: TextStyle(color: Colors.white))),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Center(child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CounterScreen()));
            }, child: Text('Counter Example'))),
            SizedBox(height: 16),
            Center(child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SwitchScreen()));
            }, child: Text('Slider/Switch Example'))),
          ],
        ),
      ),
    );
  }
}