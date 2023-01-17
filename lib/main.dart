import 'package:flutter/material.dart';

void main() {
  //starting point of the application.
  runApp(const MyApp());
}
// how to create an app.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
 
 //flow (statelesswidget -> build something -> return something)
 // flutter is widget inside widget inside widget....
 // widgets should start with a capital letter.


 


  