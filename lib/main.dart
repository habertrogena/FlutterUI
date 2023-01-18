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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Tittle'),
        ),
        body: Center(
          child: ElevatedButton(onPressed: (() {}), child: Text('click here')),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            )
          ],
        ),
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


 


  