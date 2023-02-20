import 'package:flutter/material.dart';
import 'package:flutter_application_testing/screens/login_page.dart';
import 'package:flutter_application_testing/screens/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage("images/images.jpeg"),
              ),
            ),
            RichText(
              text: const TextSpan(
                  text: 'Welcome To ',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'My Caretaker',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent),
                    ),
                  ]),
            ),
            Text(
              'lets get started',
              style: TextStyle(color: Colors.blueGrey),
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => LoginPage()),
                      ),
                    );
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                //sign up button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => RegistrationPage()),
                      ),
                    );
                  },
                  child: Text(
                    "REGiSTER BUTTON",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
