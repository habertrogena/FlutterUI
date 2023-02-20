// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_testing/screens/home_page.dart';

class myCustomScreen extends StatelessWidget {
  const myCustomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome to the dashbord'),
      ),
      body: Column(
        children: [
          Text('welcome back'),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }),
                );
              },
              child: Text('LOGOUT'))
        ],
      ),
    );
  }
}
