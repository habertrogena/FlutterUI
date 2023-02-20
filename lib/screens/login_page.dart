import 'package:flutter/material.dart';
import 'package:flutter_application_testing/screens/home_page.dart';
import 'package:flutter_application_testing/screens/mycustom_screen.dart';
import 'package:flutter_application_testing/screens/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_testing/services/firebase_auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //initialize firebase auth
  final FirebaseAuth_auth = FirebaseAuth.instance;
  //pass the parameters

  //form key - help in validation.
  final _formkey = GlobalKey<FormState>();
  //
  // String _email, _password;

  // checkAuthentification() async {
  //   _auth.onAuthStateChanged.listen((user) {
  //     if (user != null) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: ((context) => HomePage()),
  //         ),
  //       );
  //       @override
  //       void initState() {
  //         super.initState();
  //         this.checkAuthentification();
  //       }
  //     }
  //   });
  // }

  //editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
//email validation
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // create fields.

    // email field
    final emailField = TextFormField(
      autofillHints: const [
        AutofillHints.email
      ], //added this to bring the dialogue box
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please enter your email";
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      //keyboardType: TextInputType.,
      //validator: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please enter your password";
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //create a button.
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          try {
            await FirebaseAuthService().login(
                emailController.text.trim(), passwordController.text.trim());
            if (FirebaseAuth.instance.currentUser != null) {
              if (!mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => myCustomScreen()),
              );
            } else {
              //             // showDialog(
              //             //   context: context,
              //             //   builder: (context) => AlertDialog(
              //             //     title: const Text('Alert Dialogue Box'),
              //             //     content: const Text(
              //             //         'Invalid username or password.Please enter the correct login details.or register'),
              //             //     actions: <Widget>[
              //             //       TextButton(
              //             //           child: Text('Register Now'),
              //             //           onPressed: () {
              //             //             Navigator.push(
              //             //               context,
              //             //               MaterialPageRoute(
              //             //                 builder: (context) => RegistrationPage(),
              //             //               ),
              //             //             );
              //             //           })
              //             //     ],
              //             //   ),
              // );
            }
          } on FirebaseException catch (e) {
            debugPrint("error is ${e.message}");
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Alert dialogue box"),
                content: const Text(
                    "Invalid email or password .Please enter the correct login details or Register"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text("OK"))
                ],
              ),
            );
          }
          // Navigator.push(
          //   //for redirection
          //   context,
          //   MaterialPageRoute(
          //     builder: ((context) => const myCustomScreen()),
          //   ),
          // );
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white10,
      //wrap with padding.
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Form(
                //takes in form key, column ,children .
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    emailField,
                    SizedBox(height: 45),
                    passwordField,
                    SizedBox(height: 45),
                    loginButton,
                    SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Dont Have An Account ?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              //for redirection
                              context,
                              MaterialPageRoute(
                                builder: ((context) => RegistrationPage()),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
