import 'package:flutter/material.dart';
import 'package:flutter_application_testing/screens/home_page.dart';
import 'package:flutter_application_testing/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_testing/screens/mycustom_screen.dart';

import 'firebase_options.dart';

// void main()  {

//   runApp(MyApp());
// }

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //this widget is the root of the application
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'my caretaker',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return myCustomScreen();
            }
          },
        ));
  }
}
